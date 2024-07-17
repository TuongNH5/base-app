import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';

class CustomerTravellerResponse {
  String? phoneNumber1;
  int? id;
  String? country;
  String? documentNumber;
  String? firstName;
  String? dob;
  String? email;
  String? nationality;
  int? profileId;
  bool? isDefault;
  String? expiredDate;
  String? surName;
  String? travelerCode;
  String? adultType;
  String? gender;
  String? customerCode;
  List<MemberCard>? listMemberCard;


  CustomerTravellerResponse({
    this.phoneNumber1,
    this.id,
    this.country,
    this.documentNumber,
    this.firstName,
    this.dob,
    this.email,
    this.nationality,
    this.profileId,
    this.isDefault,
    this.expiredDate,
    this.surName,
    this.travelerCode,
    this.adultType,
    this.gender,
    this.customerCode,
    this.listMemberCard
  });

  CustomerTravellerResponse.fromJson(Map<String, dynamic> json) {
    phoneNumber1 = json['phoneNumber1'];
    id = json['id'];
    country = json['country'];
    documentNumber = json['documentNumber'];
    firstName = json['firstName'];
    dob = json['dob'];
    email = json['email'];
    nationality = json['nationality'];
    profileId = json['profileId'];
    isDefault = json['isDefault'];
    expiredDate = json['expiredDate'];
    surName = json['surName'];
    travelerCode = json['travelerCode'];
    adultType = json['adultType'];
    gender = json['gender'];
    customerCode = json['customerCode'];
    listMemberCard = json['memberCards'] != null ? (json['memberCards'] as List).map((e) => MemberCard.fromJson(e)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber1'] = phoneNumber1;
    data['id'] = id;
    data['country'] = country;
    data['documentNumber'] = documentNumber;
    data['firstName'] = firstName;
    data['dob'] = dob;
    data['email'] = email;
    data['nationality'] = nationality;
    data['profileId'] = profileId;
    data['isDefault'] = isDefault;
    data['expiredDate'] = expiredDate;
    data['surName'] = surName;
    data['travelerCode'] = travelerCode;
    data['adultType'] = adultType;
    data['gender'] = gender;
    data['customerCode'] = customerCode;
    data['memberCards'] = listMemberCard?.map((e) => e.toJson()).toList();
    return data;
  }

  DateTime? getExpiredDateTime() {
    if (expiredDate == null) return null;
    return DateTime.parse(expiredDate!);
  }

  DateTime? getDateOfBirthDateTime() {
    if (dob == null) return null;
    return DateTime.parse(dob!);
  }
}
