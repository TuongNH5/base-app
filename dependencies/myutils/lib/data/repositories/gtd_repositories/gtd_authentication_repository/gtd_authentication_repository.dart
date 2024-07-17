import 'package:dio/dio.dart';
import 'package:myutils/data/cache_helper/models/gtd_account_hive.dart';
import 'package:myutils/data/network/gtd_app_logger.dart';
import 'package:myutils/data/network/models/wrapped_result/result.dart';
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

class GtdAuthenticationRepository {
  final AuthenticationResourceAPI authenticationResourceAPI = AuthenticationResourceAPI.shared;

  GtdAuthenticationRepository._();

  static final shared = GtdAuthenticationRepository._();

  Future<Result<LogInResponse, GtdApiError>> logInWithSocial(LoginSocialRequest request) async {
    try {
      LogInResponse response = await authenticationResourceAPI.logInWithSocial(request).then(
            (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("logIn: $e");
      return Error(e);
    }
  }
  Future<Result<dynamic, GtdApiError>> forgotPassword(String emailOrPhone) async {
    try {
      dynamic response = await authenticationResourceAPI.forgotPassword(emailOrPhone).then(
            (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("logIn: $e");
      return Error(e);
    }
  }
  Future<Result<LogInResponse, GtdApiError>> logIn(LogInRequest request) async {
    try {
      LogInResponse response = await authenticationResourceAPI.logIn(request).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("logIn: $e");
      return Error(e);
    }
  }

  Future<Result<AccountResponse, GtdApiError>> getAccountInfo() async {
    try {
      AccountResponse response = await authenticationResourceAPI.getAccountInfo().then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getAccountInfo: $e");
      return Error(e);
    }
  }

  Future<Result<Response, GtdApiError>> logOut() async {
    try {
      Response response = await authenticationResourceAPI.logOut().then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("logOut: $e");
      return Error(e);
    }
  }

  Future<Result<Response, GtdApiError>> register(RegisterRequest request) async {
    try {
      Response response = await authenticationResourceAPI.register(request).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("register: $e");
      return Error(e);
    }
  }

  Future<Result<ShortProfileResponse, GtdApiError>> getShortProfile() async {
    try {
      ShortProfileResponse response = await authenticationResourceAPI.getShortProfile().then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getShortProfile: $e");
      return Error(e);
    }
  }

  Future<Result<CustomerAvatarResponse, GtdApiError>> getCustomerAvatar(
    int profileId,
  ) async {
    try {
      CustomerAvatarResponse response = await authenticationResourceAPI.getCustomerAvatar(profileId).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCustomerAvatar: $e");
      return Error(e);
    }
  }

  Future<Result<CustomerProfileResponse, GtdApiError>> getCustomerProfile(
    int profileId,
  ) async {
    try {
      CustomerProfileResponse response = await authenticationResourceAPI.getCustomerProfile(profileId).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCustomerProfile: $e");
      return Error(e);
    }
  }

  Future<Result<CustomerTravellerResponse, GtdApiError>> getCustomerTraveller(
    int travellerId,
  ) async {
    try {
      CustomerTravellerResponse response = await authenticationResourceAPI.getCustomerTraveller(travellerId).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCustomerTraveller: $e");
      return Error(e);
    }
  }

  Future<(GtdAccountHive?, GtdApiError?)> getAllAccountInfo() async {
    GtdAccountHive? accountData = GtdAccountHive();

    ///Call account info to get id, last name, surname, email,...
    ///Call short profile to get profileId
    final infoResult = await Future.wait([
      getAccountInfo(),
      getShortProfile(),
    ]);

    if (infoResult.first.isError() || infoResult.last.isError()) {
      return (
        null,
        infoResult.first.tryGetError() ?? infoResult.last.tryGetError(),
      );
    } else {
      final accountResponse = infoResult.first.tryGetSuccess() as AccountResponse?;
      final shortResponse = infoResult.last.tryGetSuccess() as ShortProfileResponse?;
      accountData.id = accountResponse?.id;
      accountData.firstName = accountResponse?.firstName;
      accountData.lastName = accountResponse?.lastName;
      accountData.email = accountResponse?.email;
      accountData.membershipClass = accountResponse?.membershipClass;
      accountData.userRefcode = accountResponse?.userRefCode;
      final profileId = shortResponse?.profileId;
      accountData.profileId = profileId;
      if (profileId != null) {
        ///Call customer profile with profileId -> get travellerId
        ///Call get avatar
        final profileResult = await Future.wait([
          getCustomerProfile(profileId),
          getCustomerAvatar(profileId),
        ]);
        if (profileResult.first.isError() || profileResult.last.isError()) {
          return (
            null,
            profileResult.first.tryGetError() ?? profileResult.last.tryGetError(),
          );
        } else {
          final avatarResponse = profileResult.last.tryGetSuccess() as CustomerAvatarResponse?;
          final profileResponse = profileResult.first.tryGetSuccess() as CustomerProfileResponse?;
          final travellerId = profileResponse?.defaultTravellerId;
          accountData.avatarImage = avatarResponse?.avatarImage;
          accountData.orgCode = profileResponse?.orgCode;
          accountData.customerCode = profileResponse?.customerCode;
          accountData.branchCode = profileResponse?.branchCode;
          if (travellerId != null) {
            accountData.travellerId = travellerId;

            ///Get paperwork/passport info
            final travellerResponse = await getCustomerTraveller(travellerId);
            if (travellerResponse.isSuccess()) {
              accountData.passportNumber = travellerResponse.tryGetSuccess()?.documentNumber;
              accountData.passportNumber = travellerResponse.tryGetSuccess()?.nationality;
              accountData.passportExpireDate = travellerResponse.tryGetSuccess()?.getExpiredDateTime();
              accountData.dateOfBirth = travellerResponse.tryGetSuccess()?.getDateOfBirthDateTime();
              accountData.listMemberCard = travellerResponse.tryGetSuccess()?.listMemberCard;
            } else {
              return (null, travellerResponse.tryGetError());
            }
          } else {
            ///return account data when there's no travellerId
            return (accountData, null);
          }
        }
      } else {
        ///MARK: - handle no profileId here
        return (
          null,
          GtdApiError(
            message: 'no profileId',
          )
        );
      }
    }
    return (accountData, null);
  }

  Future<Result<Response, GtdApiError>> changePassword(ChangePasswordRequest request) async {
    try {
      Response response = await authenticationResourceAPI.changePassword(request).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("changePassword: $e");
      return Error(e);
    }
  }

  Future<Result<Response, GtdApiError>> updateTraveller(UpdateTravellerRequest request) async {
    try {
      Response response = await authenticationResourceAPI.updateTraveller(request).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("updateTraveller: $e");
      return Error(e);
    }
  }

  Future<Result<Response, GtdApiError>> updateCustomer(UpdateCustomerRequest request) async {
    try {
      Response response = await authenticationResourceAPI.updateCustomer(request).then(
        (value) {
          return value;
        },
      );
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("updateCustomer: $e");
      return Error(e);
    }
  }
}
