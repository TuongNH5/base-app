import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_app_logger.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network_service/gtd_dio_exception.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';
import 'package:myutils/data/network/network_service/gtd_network_request.dart';
import 'package:myutils/data/network/network_service/gtd_network_service.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/authentication_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/request/change_password_request.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/request/login_social_requests.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/request/register_request.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/request/update_customer_request.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/request/update_traveller_request.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/response/account_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_avatar_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_profile_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/response/customer_traveller_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/response/short_profile_response.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class AuthenticationResourceAPI {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;
  CancelToken cancelToken = CancelToken();

  AuthenticationResourceAPI._();

  static final shared = AuthenticationResourceAPI._();

  void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("cancelled");
    }
  }

  Future<LogInResponse> logInWithSocial(LoginSocialRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.socialSignup(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      LogInResponse logInResponse = JsonParser.jsonToModel(LogInResponse.fromJson, response.data);
      return logInResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
  Future<dynamic> forgotPassword(String emailOrPhone) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.forgotPassword(envType),
        data:emailOrPhone,
        headers: {
          'Content-Type': 'text/plain',
        },
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return Future.value(response);
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<LogInResponse> logIn(LogInRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.logIn(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      LogInResponse logInResponse = JsonParser.jsonToModel(LogInResponse.fromJson, response.data);
      return logInResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logIn: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AccountResponse> getAccountInfo() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.getAccountInfo(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AccountResponse accountResponse = JsonParser.jsonToModel(AccountResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getAccountInfo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> logOut() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.logOut(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error logOut: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> register(RegisterRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.register(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error register: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<ShortProfileResponse> getShortProfile() async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.shortProfile(envType),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      ShortProfileResponse accountResponse = JsonParser.jsonToModel(ShortProfileResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getShortProfile: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerAvatarResponse> getCustomerAvatar(int profileId) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerAvatar(envType, profileId),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerAvatarResponse accountResponse = JsonParser.jsonToModel(CustomerAvatarResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerAvatar: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerProfileResponse> getCustomerProfile(int profileId) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerProfile(envType, profileId),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerProfileResponse accountResponse = JsonParser.jsonToModel(CustomerProfileResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerProfile: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<CustomerTravellerResponse> getCustomerTraveller(
    int travellerId,
  ) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AuthenticationAPIEndpoint.customerTraveller(
          envType,
          travellerId,
        ),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      CustomerTravellerResponse accountResponse =
          JsonParser.jsonToModel(CustomerTravellerResponse.fromJson, response.data);
      return accountResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCustomerTraveller: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> changePassword(ChangePasswordRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AuthenticationAPIEndpoint.changePassword(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error changePassword: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> updateTraveller(UpdateTravellerRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.put,
        enpoint: AuthenticationAPIEndpoint.updateTraveller(envType),
        data: [request],
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error updateTraveller: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<Response> updateCustomer(UpdateCustomerRequest request) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.put,
        enpoint: AuthenticationAPIEndpoint.updateCustomer(envType),
        data: request,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      return response;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error updateCustomer: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
