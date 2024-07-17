// To parse this JSON data, do
//
//     final gtdSavedTravellerRs = gtdSavedTravellerRsFromJson(jsonString);

class GtdSavedTravellerRs {
  bool? travellerDefault;
  String? address1;
  String? address2;
  String? adultType;
  String? city;
  String? companyAddress;
  String? companyName;
  String? companyTaxCode;
  String? country;
  String? customerCode;
  DateTime? dob;
  String? documentNumber;
  String? documentType;
  String? email;
  DateTime? expiredDate;
  String? firstName;
  String? gender;
  int? id;
  bool? isDefault;
  DateTime? issuedDate;
  String? issuingCountry;
  String? memberCard;
  List<MemberCard>? memberCards;
  String? nationality;
  String? nationalityName;
  String? phoneNumber1;
  String? phoneNumber2;
  String? phoneNumber3;
  String? phoneNumber4;
  String? phoneNumber5;
  String? postalCode;
  int? profileId;
  String? surName;
  String? travelerCode;

  GtdSavedTravellerRs({
    this.travellerDefault,
    this.address1,
    this.address2,
    this.adultType,
    this.city,
    this.companyAddress,
    this.companyName,
    this.companyTaxCode,
    this.country,
    this.customerCode,
    this.dob,
    this.documentNumber,
    this.documentType,
    this.email,
    this.expiredDate,
    this.firstName,
    this.gender,
    this.id,
    this.isDefault,
    this.issuedDate,
    this.issuingCountry,
    this.memberCard,
    this.memberCards,
    this.nationality,
    this.nationalityName,
    this.phoneNumber1,
    this.phoneNumber2,
    this.phoneNumber3,
    this.phoneNumber4,
    this.phoneNumber5,
    this.postalCode,
    this.profileId,
    this.surName,
    this.travelerCode,
  });

  factory GtdSavedTravellerRs.fromJson(Map<String, dynamic> json) => GtdSavedTravellerRs(
        travellerDefault: json["default"],
        address1: json["address1"],
        address2: json["address2"],
        adultType: json["adultType"],
        city: json["city"],
        companyAddress: json["companyAddress"],
        companyName: json["companyName"],
        companyTaxCode: json["companyTaxCode"],
        country: json["country"],
        customerCode: json["customerCode"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        documentNumber: json["documentNumber"],
        documentType: json["documentType"],
        email: json["email"],
        expiredDate: json["expiredDate"] == null ? null : DateTime.parse(json["expiredDate"]),
        firstName: json["firstName"],
        gender: json["gender"],
        id: json["id"],
        isDefault: json["isDefault"],
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        issuingCountry: json["issuingCountry"],
        memberCard: json["memberCard"],
        memberCards: json["memberCards"] == null
            ? []
            : List<MemberCard>.from(json["memberCards"]!.map((x) => MemberCard.fromJson(x))),
        nationality: json["nationality"],
        nationalityName: json["nationalityName"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        phoneNumber3: json["phoneNumber3"],
        phoneNumber4: json["phoneNumber4"],
        phoneNumber5: json["phoneNumber5"],
        postalCode: json["postalCode"],
        profileId: json["profileId"],
        surName: json["surName"],
        travelerCode: json["travelerCode"],
      );

  Map<String, dynamic> toJson() => {
        "default": travellerDefault,
        "address1": address1,
        "address2": address2,
        "adultType": adultType,
        "city": city,
        "companyAddress": companyAddress,
        "companyName": companyName,
        "companyTaxCode": companyTaxCode,
        "country": country,
        "customerCode": customerCode,
        "dob": dob?.toIso8601String(),
        "documentNumber": documentNumber,
        "documentType": documentType,
        "email": email,
        "expiredDate": expiredDate?.toIso8601String(),
        "firstName": firstName,
        "gender": gender,
        "id": id,
        "isDefault": isDefault,
        "issuedDate": issuedDate?.toIso8601String(),
        "issuingCountry": issuingCountry,
        "memberCard": memberCard,
        "memberCards": memberCards == null ? [] : List<dynamic>.from(memberCards!.map((x) => x.toJson())),
        "nationality": nationality,
        "nationalityName": nationalityName,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "phoneNumber3": phoneNumber3,
        "phoneNumber4": phoneNumber4,
        "phoneNumber5": phoneNumber5,
        "postalCode": postalCode,
        "profileId": profileId,
        "surName": surName,
        "travelerCode": travelerCode,
      };
}

class MemberCard {
  String? cardNumber;
  String? cardType;
  String? customerCode;
  DateTime? expiredDate;
  int? id;
  int? travellerId;

  MemberCard({
    this.cardNumber,
    this.cardType,
    this.customerCode,
    this.expiredDate,
    this.id,
    this.travellerId,
  });

  factory MemberCard.fromJson(Map<String, dynamic> json) => MemberCard(
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        customerCode: json["customerCode"],
        expiredDate: json["expiredDate"] == null ? null : DateTime.parse(json["expiredDate"]),
        id: json["id"],
        travellerId: json["travellerId"],
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "cardType": cardType,
        "customerCode": customerCode,
        "expiredDate": expiredDate?.toIso8601String(),
        "id": id,
        "travellerId": travellerId,
      };
}
