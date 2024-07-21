import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:myutils/constants/api_constant.dart';
import 'package:myutils/data/cache_helper/cache_helper.dart';
import 'package:myutils/data/network/model/base_output.dart';
import 'package:myutils/helpers/extension/colors_extension.dart';

import '../../configofmypt/config/app_config.dart';
import '../../configofmypt/config/injection.dart';

abstract class WidgetCubit<State> extends Cubit<State> {
  void onWidgetCreated();

  WidgetCubit({required State widgetState}) : super(widgetState) {
    // language = localeManager.getString(StorageKeys.language) ?? 'vi';
    // dataBundle = AppNavigator.currentArguments;
    //ensure execute action when widget finish render in the first time
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onWidgetCreated();
    });
  }

  //Data from previous screen
  // DataBundle? dataBundle;
  // LocaleManager localeManager = injector();
  String language = 'vi';

  void showToast(
    String? message, {
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity toastGravity = ToastGravity.CENTER,
    int timeInSecForIosWeb = 1,
    double? fontSize = 12,
    Color? backgroundColor,
    Color? textColor,
    bool webShowClose = false,
  }) {
    if ((message?.isNotEmpty ?? false) == true) {
      Fluttertoast.showToast(
          msg: message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: fontSize);
    }
  }

  void showErrorToast(String? message) {
    showToast(message, backgroundColor: MyColors.crimsonRed);

  }
  void showSuccessToast(String? message) {
    showToast(message, backgroundColor: MyColors.emerald);

}
  void showNormalToast(String? message) {
    showToast(message,
        backgroundColor: MyColors.steelGrey, toastGravity: ToastGravity.BOTTOM);
  }

  //show dialog with title, content and two button
  void showNormalNotificationDialog({String? title, required String? content}) {
    // AppNavigator.showDialog(
    //     dialog: NormalNotificationDialog(
    //         content: content,
    //         hasCloseButton: true,
    //         hasHeaderDivider: false,
    //         centerButtonText: S.current.close));
  }

  //Function for call api, handle data loading, data error
  Future<OutputType?> fetchApi<OutputType extends BaseOutput>(
      Function() apiFunction,
      {bool showLoading = true,
      bool loadFromCache = false,
      bool checkInternetBeforeFetchingData = true,
      bool showToastError = true,
      bool showToastException = true}) async {
    final hasInternetConnection =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;

    //if device not connect to wifi or mobile data, show dialog
    if (checkInternetBeforeFetchingData) {
      if (!hasInternetConnection) {
        // AppNavigator.showDialog(
        //     dialog: NormalNotificationDialog(
        //         routeName: DialogRouter.internetErrorDialog,
        //         title: S.current.lost_internet_connection,
        //         content: S.current.please_check_internet_connection,
        //         leftButtonText: S.current.close,
        //         rightButtonText: S.current.setting,
        //         hasHeaderDivider: false,
        //         hasCloseButton: true,
        //         onRightButtonPress: (data) {
        //           AppSettings.openAppSettingsPanel(AppSettingsPanelType.wifi);
        //         }));
        // showErrorToast(S.current.connection_error);
      }
    }

    //check loading, show loading before fetch api
    if (showLoading && hasInternetConnection) {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.none,
      );
    }

    try {
      // ignore: avoid_dynamic_calls
      final response = await apiFunction.call() as OutputType?;
      handleApiResponse(response,
          showLoading: showLoading,
          showToastError: showToastError,
          showToastException: showToastException);
      return response;
    } catch (err) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      handleApiError(err, showToastException);
      return Future.value();
    }
  }

  @override
  close() async {
    super.close();
    //to prevent emit state after close cubit that throw exception.
    // Fix error show bad state after navigate to another page
    stream.drain();
  }

  Future handleApiError(err, showPopupException) async {
    if (injector<AppConfig>().isProduction()) {
      if (err is dio.DioException) {
        //send error to logz server
        // injector<LogzIoLogger>().logApiError(err);
      }
      if (showPopupException == true && !isClosed) {
        showNormalToast('Please retry');
      }
    } else if (err is dio.DioException && !isClosed) {
      if (showPopupException == true) {
        showErrorToast('${err.message} [${err.requestOptions.path}]');
      }
      if (kDebugMode) {
        print(err.requestOptions.path);
        print(err.requestOptions.uri);
        print(err.requestOptions.headers);
        print(err.requestOptions.queryParameters);
        print(err.requestOptions.data);
        print(err.requestOptions.extra);
        print('Response: ');
        print(err.response);
        print(err.error);
      }
    } else {
      //only show when cubit active, not show when cubit is closed
      if (!isClosed) {
        showErrorToast(err.toString());
      }
      if (kDebugMode) {
        print(err.toString());
      }
    }
  }

  Future<void> handleApiResponse<OutputType extends BaseOutput>(
      OutputType? response,
      {bool showLoading = true,
      bool showToastError = true,
      bool showToastException = true}) async {
    //hide loading after receive api response
    if (showLoading) {
      EasyLoading.dismiss();
    }

    if (response?.statusCode == ApiStatusCode.tokenExpired) {
      CacheHelper.shared.clearDataLocalLogout();
      if (!isClosed) {
        // AppNavigator.pushNamedAndRemoveUntil(
        //     const LoginScreenRoute(), (route) => false,
        //     arguments: DataBundleBuilder()
        //         .putString(DataKey.message, response?.message)
        //         .putBoolean(DataKey.isExpired, true)
        //         .build());
      }
      await close();
      return;
    }

    if (response?.statusCode != ApiStatusCode.success && showToastError) {
      // response?.message?.let(showNormalToast);
    }
  }
}
