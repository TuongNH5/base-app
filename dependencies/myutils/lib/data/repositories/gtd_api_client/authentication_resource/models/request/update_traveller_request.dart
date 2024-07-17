import 'package:myutils/data/repositories/gtd_api_client/authentication_resource/models/json_model/member_card.dart';

class UpdateTravellerRequest {
  int? id;
  String? country;
  String? nationality;
  String? firstName;
  String? adultType;
  String? dob;
  bool? isDefault;
  List<MemberCardsSimplified>? memberCards;
  String? expiredDate;
  int? profileId;
  String? surName;
  String? phoneNumber1;
  String? customerCode;
  String? email;
  String? gender;
  String? documentNumber;

  UpdateTravellerRequest({
    this.id,
    this.country,
    this.nationality,
    this.firstName,
    this.adultType,
    this.dob,
    this.isDefault,
    this.memberCards,
    this.expiredDate,
    this.profileId,
    this.surName,
    this.phoneNumber1,
    this.customerCode,
    this.email,
    this.gender,
    this.documentNumber,
  });

  UpdateTravellerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    nationality = json['nationality'];
    firstName = json['firstName'];
    adultType = json['adultType'];
    dob = json['dob'];
    isDefault = json['isDefault'];
    if (json['memberCards'] != null) {
      memberCards = <MemberCardsSimplified>[];
      json['memberCards'].forEach((v) {
        memberCards!.add(MemberCardsSimplified.fromJson(v));
      });
    }
    expiredDate = json['expiredDate'];
    profileId = json['profileId'];
    surName = json['surName'];
    phoneNumber1 = json['phoneNumber1'];
    customerCode = json['customerCode'];
    email = json['email'];
    gender = json['gender'];
    documentNumber = json['documentNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['nationality'] = nationality;
    data['firstName'] = firstName;
    data['adultType'] = adultType;
    data['dob'] = dob;
    data['isDefault'] = isDefault;
    if (memberCards != null) {
      data['memberCards'] = memberCards!.map((v) => v.toJson()).toList();
    }
    data['expiredDate'] = expiredDate;
    data['profileId'] = profileId;
    data['surName'] = surName;
    data['phoneNumber1'] = phoneNumber1;
    data['customerCode'] = customerCode;
    data['email'] = email;
    data['gender'] = gender;
    data['documentNumber'] = documentNumber;
    return data;
  }
}
