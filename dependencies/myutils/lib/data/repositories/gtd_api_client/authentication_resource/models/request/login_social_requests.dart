/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation


// LoginSocialRequests loginSocialRequestsFromJson(String str) => LoginSocialRequests.fromJson(json.decode(str));
//
// String loginSocialRequestsToJson(LoginSocialRequests data) => json.encode(data.toJson());

class LoginSocialRequest {
  LoginSocialRequest({
    required this.profileUrl,
    required this.displayName,
    required this.providerId,
    required this.imageUrl,
    required this.rememberMe,
    required this.accessToken,
    required this.providerUserId,
    required this.email,
     // this.password,
  });

  String profileUrl;
  String displayName;
  String providerId;
  String imageUrl;
  bool rememberMe;
  String accessToken;
  String providerUserId;
  String email;
  // String? password;

  factory LoginSocialRequest.fromJson(Map<String, dynamic> data) {
    return LoginSocialRequest(
      profileUrl: data['profileUrl'] as String,
      displayName: data['displayName'] as String,
      providerId: data['providerId'] as String,
      imageUrl: data['imageUrl'] as String,
      rememberMe: data['rememberMe'] as bool,
      accessToken: data['accessToken'] as String,
      providerUserId: data['providerUserId'] as String,
      email: data['email'] as String,
      // password: data['password']  ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "profileUrl": profileUrl,
      "displayName": displayName,
      "providerId": providerId,
      "imageUrl": imageUrl,
      "rememberMe": rememberMe,
      "accessToken": accessToken,
      "providerUserId": providerUserId,
      "email": email,
      // "password": password,
    };
  }

  LoginSocialRequest fakeData() {
    return LoginSocialRequest(
      profileUrl:
          'https://graph.facebook.com/v16.0/122111771600254544/picture?height=100&width=100&migration_overrides=%7Boctober_2012%3Atrue%7D&a',
      displayName: 'Nguyen Gtd',
      email: 'tuongnhps07603@gmail.com',
      accessToken:
          'EAARFFl1YloQBO022rPIf7W7T9ZCtsWU9EFHZBaEudZC5JLbSBAeXVGfrxha9OsQUQjtvzYUpKYH6c6i8qYhH0b8VdlmCTNfxaYSDb92npZC2SCATTdWL5XOjiZCTgOZ',
      providerId: 'FACEBOOK',
      imageUrl:
          'https://graph.facebook.com/v16.0/122111771600254544/picture?height=100&width=100&migration_overrides=%7Boctober_2012%3Atrue%7D&a',
      rememberMe: true,
      providerUserId: '122111771600254544',
    );
  }
}
