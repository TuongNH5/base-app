class AccountResponse {
  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? userRefCode;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  String? createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;
  List<String>? authorities;
  String? phoneNumber;
  String? dob;
  String? membershipClass;
  bool? socialUser;

  AccountResponse({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.userRefCode,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
    this.phoneNumber,
    this.dob,
    this.membershipClass,
    this.socialUser,
  });

  AccountResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    userRefCode = json['userRefCode'];
    imageUrl = json['imageUrl'];
    activated = json['activated'];
    langKey = json['langKey'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
    authorities = json['authorities'].cast<String>();
    phoneNumber = json['phoneNumber'];
    dob = json['dob'];
    membershipClass = json['membershipClass'];
    socialUser = json['socialUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['login'] = login;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['userRefCode'] = userRefCode;
    data['imageUrl'] = imageUrl;
    data['activated'] = activated;
    data['langKey'] = langKey;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['lastModifiedBy'] = lastModifiedBy;
    data['lastModifiedDate'] = lastModifiedDate;
    data['authorities'] = authorities;
    data['phoneNumber'] = phoneNumber;
    data['dob'] = dob;
    data['membershipClass'] = membershipClass;
    data['socialUser'] = socialUser;
    return data;
  }
}
