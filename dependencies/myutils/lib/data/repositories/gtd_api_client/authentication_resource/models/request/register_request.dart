class RegisterRequest {
  String? login;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? referencedBy;

  RegisterRequest({
    this.login,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.referencedBy,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    referencedBy = json['referencedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['referencedBy'] = referencedBy;
    return data;
  }
}
