// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/booking_code.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

class AddbookingResultRs extends GtdResponse {
  AddBookingTravellerRs? result;
  AddbookingResultRs({this.result, super.duration, super.textMessage, super.errors, super.infos, super.success});
  factory AddbookingResultRs.fromJson(Map<String, dynamic> json) => AddbookingResultRs(
        result: json["result"] == null ? null : AddBookingTravellerRs.fromJson(json["result"]),
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}

class AddBookingTravellerRs extends GtdResponse {
  AddBookingTravellerRs({
    this.bookingCode,
    this.otpServiceRes,
    super.duration,
    super.errors,
    super.infos,
    super.isSuccess,
    super.success,
    super.textMessage,
  });

  BookingCode? bookingCode;
  OtpServiceRes? otpServiceRes;

  factory AddBookingTravellerRs.fromRawJson(String str) => AddBookingTravellerRs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddBookingTravellerRs.fromJson(Map<String, dynamic> json) => AddBookingTravellerRs(
        bookingCode: json["bookingCode"] == null ? null : BookingCode.fromJson(json["bookingCode"]),
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        isSuccess: json["isSuccess"],
        otpServiceRes: json["otpServiceRes"] == null ? null : OtpServiceRes.fromJson(json["otpServiceRes"]),
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "bookingCode": bookingCode?.toJson(),
        "duration": duration,
        "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x.toJson())),
        "infos": infos == null ? [] : List<dynamic>.from(infos!.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "otpServiceRes": otpServiceRes?.toJson(),
        "success": success,
        "textMessage": textMessage,
      };
}

class OtpServiceRes extends GtdResponse {
  OtpServiceRes({
    super.duration,
    super.errors,
    this.expDate,
    this.expired,
    this.fullQuota,
    super.infos,
    super.isSuccess,
    this.lifeTimeInMin,
    this.matched,
    this.notFound,
    this.outOfSlot,
    this.phoneNumber,
    this.serviceId,
    this.smsServiceAvailable,
    super.success,
    this.tag,
    super.textMessage,
    this.used,
    this.verificationCode,
  });

  DateTime? expDate;
  bool? expired;
  bool? fullQuota;

  int? lifeTimeInMin;
  bool? matched;
  bool? notFound;
  bool? outOfSlot;
  String? phoneNumber;
  String? serviceId;
  bool? smsServiceAvailable;

  String? tag;

  bool? used;
  String? verificationCode;

  factory OtpServiceRes.fromRawJson(String str) => OtpServiceRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpServiceRes.fromJson(Map<String, dynamic> json) => OtpServiceRes(
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        expDate: json["expDate"] == null ? null : DateTime.parse(json["expDate"]),
        expired: json["expired"],
        fullQuota: json["fullQuota"],
        isSuccess: json["isSuccess"],
        lifeTimeInMin: json["lifeTimeInMin"],
        matched: json["matched"],
        notFound: json["notFound"],
        outOfSlot: json["outOfSlot"],
        phoneNumber: json["phoneNumber"],
        serviceId: json["serviceID"],
        smsServiceAvailable: json["smsServiceAvailable"],
        success: json["success"],
        tag: json["tag"],
        textMessage: json["textMessage"],
        used: json["used"],
        verificationCode: json["verificationCode"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "errors": errors,
        "expDate": expDate?.toIso8601String(),
        "expired": expired,
        "fullQuota": fullQuota,
        "infos": infos == null ? [] : List<dynamic>.from(infos!.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "lifeTimeInMin": lifeTimeInMin,
        "matched": matched,
        "notFound": notFound,
        "outOfSlot": outOfSlot,
        "phoneNumber": phoneNumber,
        "serviceID": serviceId,
        "smsServiceAvailable": smsServiceAvailable,
        "success": success,
        "tag": tag,
        "textMessage": textMessage,
        "used": used,
        "verificationCode": verificationCode,
      };
}
