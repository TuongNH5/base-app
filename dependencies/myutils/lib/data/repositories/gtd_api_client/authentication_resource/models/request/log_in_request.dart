class LogInRequest {
  String? username;
  String? password;

  LogInRequest({this.username, this.password});

  LogInRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['rememberMe'] = true;
    return data;
  }
}
