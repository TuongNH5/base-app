// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myutils/constants/api_constant.dart';
import 'package:myutils/data/cache_helper/cache_helper.dart';
import 'package:myutils/utils/multipart_file_extend.dart';

import '../../configofmypt/config/app_config.dart';
import '../../configofmypt/config/injection.dart';
import '../../constants/locale_keys_enum.dart';

// CacheHelper.shared.getCachedLanguage()
//Class save request info, reused in refresh token
class PendingRequestInfo {
  PendingRequestInfo(
      {required this.options, this.requestHandler, this.responseHandler});
  RequestOptions options;
  RequestInterceptorHandler? requestHandler;
  ResponseInterceptorHandler? responseHandler;
}

// Create api request, when server response REFRESH_TOKEN status, lock [dio],
// then use [refreshTokenDio] to call api refresh token, update new token in header of dio then unlock
class NetworkManager {
  NetworkManager() {
    // _localeManager = injector();
    initDio();
  }

  Dio? _dio;
  Dio? _refreshTokenDio;
  // LocaleManager? _localeManager;

  static const int connectTimeout = 60000;
  static const int receiveTimeout = 60000;

  String _baseUrl = '';
  String _accessToken = '';
  String _refreshToken = '';
  final String _refreshTokenPath = '${ApiService.auth}/user-token';

  //variable for locking refresh token, allow only one request execute one time
  final List<PendingRequestInfo> _listPendingRequest = [];
  bool _isRefreshingToken = false;

  void initDio() {
    _baseUrl =
        '${injector<AppConfig>().baseUrl ?? ''}${injector<AppConfig>().apiVersion ?? ''}';
    _accessToken =     CacheHelper.shared.getShareString(key: StorageKeys.accessToken.name);
    _refreshToken =   CacheHelper.shared.getShareString(key: StorageKeys.refreshToken.name);

    // config api cache
    // _dioCacheManager = DioCacheManager(CacheConfig(
    //   defaultMaxAge: Duration(days: injector<AppConfig>().cacheDuration),
    // ));
    final options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        headers: {'Accept': 'application/json'},
        validateStatus: (_) => true);

    //add header
    options.headers[ApiConstant.contentType] = 'application/json';
    options.headers[ApiConstant.authorization] = 'Bearer $_accessToken';

    _dio = Dio(options);
    // _dio?.interceptors.add(_dioCacheManager?.interceptor);
    // _dio?.interceptors.add(LoggyDioInterceptor());
    _refreshTokenDio?.options = _dio?.options ?? options;
    _refreshTokenDio = Dio(options);

    //handle refresh token in queue
    _configRefreshToken();
  }

  void _configRefreshToken() {
    //refresh token and retry api
    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: _handleRequest,
      onResponse: _handleResponse,
      
    ));
  }

  Future<Map<String, dynamic>?> request(String method, String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      bool isLoadFromCache = true,
      Map<String, dynamic>? extra}) async {
    if (kDebugMode) {
      print(_dio?.options.headers);
      print('url : $path \n queryParameters: $queryParameters \n data: $data \n headers: $headers \n extra: $extra');
      // logger.v('url : $path');
      // log('queryParameters: $queryParameters');
      // log('dataOutput: -> $data');
      // log('headers: $headers');
      // log('extra: $extra');
    }

    try {
      final result = await _dio?.request(path,
          queryParameters: queryParameters ?? <String, dynamic>{},
          options: Options(method: method, headers: headers, extra: extra),
          data: data,
          cancelToken: CancelToken());
      return result?.data as Map<String, dynamic>?;
    } catch (error) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> requestFormData(String method, String path,
      {Map<String, dynamic>? queryParameters,
      FormData? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra}) async {
    if (kDebugMode) {
      print(_dio?.options.headers);
      print('url : $path \n queryParameters: $queryParameters \n data: $data \n headers: $headers \n extra: $extra');
    }
    var _data = data;
    if (data is FormData) {
      final formData = FormData();
      formData.fields.addAll(data.fields);
      for (final mapFile in data.files) {
        formData.files.add(MapEntry(mapFile.key, mapFile.value));
      }
      _data = formData;
    }
    try {
      final result = await _dio?.request(path,
          queryParameters: queryParameters ?? <String, dynamic>{},
          options: Options(
              method: method,
              headers: {'Content-Type': 'multipart/form-data'},
              extra: extra),
          data: _data,
          cancelToken: CancelToken());
      return result?.data as Map<String, dynamic>?;
    } catch (error) {
      return null;
    }
  }

  Future<void> _updateNewToken(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    CacheHelper.shared.saveShareString(value: accessToken, key: StorageKeys.accessToken.name);
    CacheHelper.shared.saveShareString(value: refreshToken, key: StorageKeys.refreshToken.name);


    // await _localeManager?.setStringValue(StorageKeys.accessToken, accessToken);
    // await _localeManager?.setStringValue(StorageKeys.refreshToken, refreshToken);
  }

  void _handleResponse(Response response, ResponseInterceptorHandler handler) {
    // injector<LogzIoLogger>().logApiResponse(response);

    if (kDebugMode) {
      print('_result of ${response.requestOptions.path}: $response');
    }
    if (response.data[ApiConstant.statusCode] == ApiStatusCode.refreshToken) {
      if (kDebugMode) {
        // log('server response need to refresh token, start refreshing token');
        print('server response need to refresh token, start refreshing token');
      }
      if (_isRefreshingToken) {
        if (kDebugMode) {
          // log('is there a token refreshing is executing. Add this request to queue and retry later');
          print('is there a token refreshing is executing. Add this request to queue and retry later');
        }
        _listPendingRequest.add(PendingRequestInfo(
            options: response.requestOptions, responseHandler: handler));
      } else {
        if (kDebugMode) {
          print('There are no token refreshing request executing, now try to get new token');

        }
        _isRefreshingToken = true;
        postRefreshToken(
          response.data[ApiConstant.data][ApiConstant.extoken] as String,
        )?.then((value) async {
          //send to sentry
          // injector<LogzIoLogger>().logApiResponse(value);

          _isRefreshingToken = false;
          if (kDebugMode) {
            print(value);
          }
          //If refresh token fail, return token expired and redirect to login page
          if (value.data[ApiConstant.statusCode] != ApiStatusCode.success) {
            if (kDebugMode) {
              print('Refresh token fail, return to login page');
            }
            returnExpireToken(response, handler);
          } else {
            if (kDebugMode) {
              print('Refresh token success, update new token and retrapp_cy api');
              print('updating new token');
            }
            await _updateNewToken(
                value.data[ApiConstant.data][ApiConstant.accessToken]
                    .toString(),
                value.data[ApiConstant.data][ApiConstant.refreshToken]
                    .toString());

            //Recall current request
            _recallApi(response.requestOptions, handler);

            // recall all pending request with new token
            _executePendingRequest();
          }
        }).catchError((error, stackTrace) {
          if (kDebugMode) {

            // logger.e(error, stackTrace);
            if (error is DioException) {
              print(error.requestOptions.headers);
            }
            print('Refresh token error, return to login page');
          }
          _isRefreshingToken = false;
          returnExpireToken(response, handler);
        });
      }
    } else {
      handler.resolve(response);
    }
  }

  void _handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    //If is there some refresh token request is executing. Add current request to pending list and execute after refresh done
    if (_isRefreshingToken) {
      _listPendingRequest
          .add(PendingRequestInfo(options: options, requestHandler: handler));
    } else {
      handler.next(options);
    }
  }

  Future<Response>? postRefreshToken(String exToken) {
    CacheHelper.shared.getShareString(key: StorageKeys.userToken.name);
    final _userToken =     CacheHelper.shared.getShareString(key: StorageKeys.userToken.name);

    //call api get new token
    if (kDebugMode) {
      print('refresh_token: $_refreshTokenPath');
    }

    if (kDebugMode) {
      // log(_refreshTokenDio?.options.);
      print({'Accept': 'application/json', ApiConstant.authorization: exToken});
      print({
        ApiConstant.refreshToken: _refreshToken,
        ApiConstant.userToken: _userToken,
        ApiConstant.grantType: GrantType.refreshToken,
      });
    }

    return _refreshTokenDio?.post(_refreshTokenPath,
        options: Options(headers: {
          'Accept': 'application/json',
          ApiConstant.authorization: exToken
        }),
        data: {
          ApiConstant.refreshToken: _refreshToken,
          ApiConstant.userToken: _userToken,
          ApiConstant.grantType: GrantType.refreshToken
        });
  }

  void _recallApi(RequestOptions options, ResponseInterceptorHandler? handler) {
    if (kDebugMode) {
      print('recalling ${options.path}');
    }

    options.headers[ApiConstant.authorization] = 'Bearer $_accessToken';

    if (options.data is FormData) {
      //Clone a new formData to prevent Bad state: Can't finalize a finalized MultipartFile
      options.data = _cloneFormData(options);
    }

    _dio?.options.headers[ApiConstant.authorization] = 'Bearer $_accessToken';
    _dio?.fetch(options).then(
      (r) {
        print('recall success ${r} ' );
        // logger.d(r);
        handler?.resolve(r);
      },
      onError: (e) {
        handler?.reject(e as DioException);
      },
    );
  }

  Future<void> returnExpireToken(
      Response response, ResponseInterceptorHandler? handler) async {
    response.data = {
      ApiConstant.statusCode: ApiStatusCode.tokenExpired,
      ApiConstant.message: response.data[ApiConstant.message]
    };
    handler?.resolve(response);
    //Cancel all pending request
    for (final item in _listPendingRequest) {
      item.options.cancelToken?.cancel();
    }
  }

  void _executePendingRequest() {
    if (kDebugMode) {
      print('execute pending request');
    }
    for (final item in _listPendingRequest) {
      if (kDebugMode) {
        print('execute ${item.options.path}');
      }
      if (item.requestHandler != null) {
        item.options.headers[ApiConstant.authorization] =
            'Bearer $_accessToken';

        if (item.options.data is FormData) {
          //Clone a new formData to prevent Bad state: Can't finalize a finalized MultipartFile
          item.options.data = _cloneFormData(item.options);
        }

        item.requestHandler?.next(item.options);
      } else {
        //recall request that need refresh
        _recallApi(item.options, item.responseHandler);
      }
    }
    _listPendingRequest.clear();
  }

  FormData _cloneFormData(RequestOptions options) {
    final _data = options.data as FormData;
    final newFormData = FormData();
    newFormData.fields.addAll(_data.fields);
    for (final MapEntry mapFile in _data.files) {
      if (mapFile.value is MultipartFileExtended) {
        final value = mapFile.value as MultipartFileExtended;
        newFormData.files.add(MapEntry(
            mapFile.key.toString(),
            MultipartFileExtended.fromFileSync(value.filePath ?? '',
                filename: value.filename.toString(),
                contentType: value.contentType)));
      }
    }
    return newFormData;
  }
}
