import 'dart:convert';

import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/gtd_flight_repository_dto.dart';
import 'package:myutils/helpers/extension/string_extension.dart';

AddBookingTravellerRq addBookingTravellerRqFromJson(String str) => AddBookingTravellerRq.fromJson(json.decode(str));

String addBookingTravellerRqToJson(AddBookingTravellerRq data) => json.encode(data.toJson());

class AddBookingTravellerRq {
  AddBookingTravellerRq({
    required this.bookingNumber,
    required this.bookingContacts,
    required this.bookingTravelerInfos,
    this.osiCodes = const [],
    this.taxReceiptRequest,
    this.bookingNote,
    this.otpServiceReq,
  });

  String bookingNumber;
  List<BookingContactRq> bookingContacts;
  List<BookingTravelerInfoRq> bookingTravelerInfos;
  List<dynamic> osiCodes;
  TaxReceiptRequest? taxReceiptRequest;
  String? bookingNote;
  OtpServiceReq? otpServiceReq;

  factory AddBookingTravellerRq.fromRawJson(String str) => AddBookingTravellerRq.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddBookingTravellerRq.fromJson(Map<String, dynamic> json) => AddBookingTravellerRq(
        bookingNumber: json["bookingNumber"],
        bookingContacts: List<BookingContactRq>.from(json["bookingContacts"].map((x) => BookingContactRq.fromJson(x))),
        bookingTravelerInfos: List<BookingTravelerInfoRq>.from(
            json["bookingTravelerInfos"].map((x) => BookingTravelerInfoRq.fromJson(x))),
        osiCodes: List<dynamic>.from(json["osiCodes"].map((x) => x)),
        taxReceiptRequest: TaxReceiptRequest.fromJson(json["taxReceiptRequest"]),
        otpServiceReq: json["otpServiceReq"] == null ? null : OtpServiceReq.fromJson(json["otpServiceReq"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingNumber": bookingNumber,
        "bookingContacts": List<dynamic>.from(bookingContacts.map((x) => x.toJson())),
        "bookingTravelerInfos": List<dynamic>.from(bookingTravelerInfos.map((x) => x.toJson())),
        "osiCodes": List<dynamic>.from(osiCodes.map((x) => x)),
        "taxReceiptRequest": taxReceiptRequest?.toJson(),
        "bookingNote": bookingNote,
        "otpServiceReq": otpServiceReq?.toJson(),
      }..removeWhere((key, value) => (value == null && key == "otpServiceReq"));
}

class BookingContactRq {
  BookingContactRq({
    required this.email,
    required this.firstName,
    this.phoneCode1 = "+84",
    required this.phoneNumber1,
    this.dob,
    required this.surName,
    required this.bookingNumber,
  });

  String email;
  String firstName;
  String phoneCode1;
  String phoneNumber1;
  DateTime? dob;
  String surName;
  String bookingNumber;

  factory BookingContactRq.fromRawJson(String str) => BookingContactRq.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingContactRq.fromJson(Map<String, dynamic> json) => BookingContactRq(
        email: json["email"],
        firstName: json["firstName"],
        phoneCode1: json["phoneCode1"],
        phoneNumber1: json["phoneNumber1"],
        dob: DateTime.parse(json["dob"]),
        surName: json["surName"],
        bookingNumber: json["bookingNumber"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "phoneCode1": phoneCode1,
        "phoneNumber1": phoneNumber1,
        "dob": dob?.toIso8601String(),
        "surName": surName,
        "bookingNumber": bookingNumber,
      };
}

class BookingTravelerInfoRq {
  BookingTravelerInfoRq({
    required this.traveler,
    this.serviceRequests = const [],
  });

  TravelerRq traveler;
  List<SsrOfferDTO> serviceRequests;
  factory BookingTravelerInfoRq.fromRawJson(String str) => BookingTravelerInfoRq.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingTravelerInfoRq.fromJson(Map<String, dynamic> json) => BookingTravelerInfoRq(
        traveler: TravelerRq.fromJson(json["traveler"]),
        serviceRequests: List<SsrOfferDTO>.from(json["serviceRequests"].map((x) => SsrOfferDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "traveler": traveler.toJson(),
        "serviceRequests": List<dynamic>.from(serviceRequests.map((x) => x.toJson())),
      };
}

class TravelerRq {
  TravelerRq(
      {required this.adultType,
      this.documentNumber,
      this.documentExpiredDate,
      this.documentIssuingCountry,
      required this.firstName,
      required this.gender,
      this.memberCard = false,
      this.memberCardType,
      this.memberCardNumber,
      required this.surName,
      required this.bookingNumber,
      required this.dob,
      this.personRepresentation});

  String adultType;
  String? documentNumber;
  String? documentExpiredDate;
  String? documentIssuingCountry;
  String firstName;
  String gender;
  bool memberCard;
  String? memberCardType;
  String? memberCardNumber;
  String surName;
  String bookingNumber;
  DateTime? dob;
  bool? personRepresentation;

  factory TravelerRq.fromRawJson(String str) => TravelerRq.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelerRq.fromJson(Map<String, dynamic> json) => TravelerRq(
      adultType: json["adultType"],
      documentNumber: json["documentNumber"],
      documentExpiredDate: json["documentExpiredDate"],
      documentIssuingCountry: json["documentIssuingCountry"],
      firstName: json["firstName"],
      gender: json["gender"],
      memberCard: json["memberCard"],
      memberCardType: json["memberCardType"],
      memberCardNumber: json["memberCardNumber"],
      surName: json["surName"],
      bookingNumber: json["bookingNumber"],
      dob: DateTime.parse(json["dob"]),
      personRepresentation: json["personRepresentation"]);

  Map<String, dynamic> toJson() => {
        "adultType": adultType,
        "documentNumber": documentNumber,
        "documentExpiredDate": documentExpiredDate,
        "documentIssuingCountry": documentIssuingCountry,
        "firstName": firstName,
        "gender": gender,
        "memberCard": memberCard,
        "memberCardType": memberCardType,
        "memberCardNumber": memberCardNumber,
        "surName": surName,
        "bookingNumber": bookingNumber,
        "dob": dob?.toIso8601String(),
        "personRepresentation": personRepresentation
      };
}

class TaxReceiptRequest {
  String? bookingNumber;
  String? taxAddress1;
  String? taxCompanyName;
  String? taxNumber;
  bool? taxReceiptRequest;
  TaxPersonalInfoContact? taxPersonalInfoContact;

  TaxReceiptRequest({
    this.bookingNumber,
    this.taxAddress1,
    this.taxCompanyName,
    this.taxNumber,
    this.taxReceiptRequest,
    this.taxPersonalInfoContact,
  });

  factory TaxReceiptRequest.fromJson(Map<String, dynamic> json) => TaxReceiptRequest(
        bookingNumber: json["bookingNumber"],
        taxAddress1: json["taxAddress1"],
        taxCompanyName: json["taxCompanyName"],
        taxNumber: json["taxNumber"],
        taxReceiptRequest: json["taxReceiptRequest"],
        taxPersonalInfoContact: json["taxPersonalInfoContact"],
      );

  Map<String, dynamic> toJson() => {
        "bookingNumber": bookingNumber,
        "taxAddress1": taxAddress1,
        "taxCompanyName": taxCompanyName,
        "taxNumber": taxNumber,
        "taxReceiptRequest": taxReceiptRequest,
        "taxPersonalInfoContact": taxPersonalInfoContact?.toJson().toString(),
      };
}

class TaxPersonalInfoContact {
  String? name;
  String? fname;
  String? phone;
  String? email1;
  String? phoneCode3;
  String? buyerName;
  String? note;

  TaxPersonalInfoContact({
    this.name,
    this.fname,
    this.phone,
    this.email1,
    this.phoneCode3 = "84",
    this.buyerName,
    this.note,
  });

  factory TaxPersonalInfoContact.fromJson(Map<String, dynamic> json) => TaxPersonalInfoContact(
        name: json["name"],
        fname: json["fname"],
        phone: json["phone"],
        email1: json["email1"],
        phoneCode3: json["phoneCode3"],
        buyerName: json["buyerName"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fname": fname,
        "phone": phone,
        "email1": email1,
        "phoneCode3": phoneCode3,
        "buyerName": buyerName?.toUpperCase().removeDiacritics(),
        "note": note,
      };

  String toJsonString() {
    return toJson().toString();
  }
}

class OtpServiceReq {
  String? lang;
  String? otpCode;
  String? verificationCode;

  OtpServiceReq({
    this.lang,
    this.otpCode,
    this.verificationCode,
  });

  factory OtpServiceReq.fromJson(Map<String, dynamic> json) => OtpServiceReq(
        lang: json["lang"],
        otpCode: json["otpCode"],
        verificationCode: json["verificationCode"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "otpCode": otpCode,
        "verificationCode": verificationCode,
      }..removeWhere((key, value) => value == null);
}
