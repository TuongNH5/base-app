class LogInResponse {
  String? idToken;

  LogInResponse({this.idToken});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['id_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_token'] = idToken;
    return data;
  }
}
