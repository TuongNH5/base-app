import 'package:myutils/data/network/network.dart';

class AuthenticationAPIEndpoint extends GtdEndpoint {
  AuthenticationAPIEndpoint({required super.env, required super.path});

  static const String kLogIn = '/api/authenticate';
  static const String kLogOut = '/api/account/log-out';
  static const String kForgotPassword = '/api/account/reset-password/init';
  static const String kAccountInfo = '/api/account';
  static const String kSocialSignup = '/api/social/signup';
  static const String kRegister = '/api/register';
  static const String kShortProfile = '/api/profile/short';
  static const String kCustomerProfile = '/customersrv/api/customer-profiles';
  static const String kCustomerTraveller =
      '/customersrv/api/customer-travellers';
  static const String kCustomerAvatar =
      '/customersrv/api/customer-avatars/profile';
  static const String kChangePassword = '/api/account/change-password';
  static const String kUpdateTraveller =
      '/customersrv/api/customer-travellers-collection';
  static const String kUpdateCustomer = '/customersrv/api/customer-profiles';

  static GtdEndpoint logIn(GTDEnvType envType) {
    const path = kLogIn;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
  static GtdEndpoint forgotPassword(GTDEnvType envType) {
    const path = kForgotPassword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
  static GtdEndpoint socialSignup(GTDEnvType envType) {
    const path = kSocialSignup;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getAccountInfo(GTDEnvType envType) {
    const path = kAccountInfo;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint logOut(GTDEnvType envType) {
    const path = kLogOut;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint register(GTDEnvType envType) {
    const path = kRegister;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint shortProfile(GTDEnvType envType) {
    const path = kShortProfile;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerAvatar(GTDEnvType envType, int profileId) {
    String path = '$kCustomerAvatar/$profileId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerProfile(GTDEnvType envType, int profileId) {
    String path = '$kCustomerProfile/$profileId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint customerTraveller(GTDEnvType envType, int travellerId) {
    String path = '$kCustomerTraveller/$travellerId';
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint changePassword(GTDEnvType envType) {
    const path = kChangePassword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateTraveller(GTDEnvType envType) {
    const path = kUpdateTraveller;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint updateCustomer(GTDEnvType envType) {
    const path = kUpdateCustomer;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
