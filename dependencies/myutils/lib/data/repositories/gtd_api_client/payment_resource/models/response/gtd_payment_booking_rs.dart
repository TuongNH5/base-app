import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdPayBookingRs extends GtdResponse {
  BookingCode? bookingCode;
  bool? hasPaymentAuth;
  String? paymentAuthUrl;
  dynamic paReq;
  String? termUrl;
  dynamic md;
  OtpServiceRes? otpServiceRes;
  String? billingCode;
  String? returnUrlPayoo;

  GtdPayBookingRs({
    super.isSuccess,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    this.bookingCode,
    this.hasPaymentAuth,
    this.paymentAuthUrl,
    this.paReq,
    this.termUrl,
    this.md,
    this.otpServiceRes,
    this.billingCode,
    this.returnUrlPayoo,
    super.success,
  });

  factory GtdPayBookingRs.fromJson(Map<String, dynamic> json) => GtdPayBookingRs(
        isSuccess: json["isSuccess"],
        duration: json["duration"],
        textMessage: json["textMessage"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        bookingCode: json["bookingCode"] == null ? null : BookingCode.fromJson(json["bookingCode"]),
        hasPaymentAuth: json["hasPaymentAuth"],
        paymentAuthUrl: json["paymentAuthUrl"],
        paReq: json["paReq"],
        termUrl: json["termUrl"],
        md: json["md"],
        otpServiceRes: json["otpServiceRes"],
        billingCode: json["billingCode"],
        returnUrlPayoo: json["returnUrlPayoo"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "bookingCode": bookingCode?.toJson(),
        "hasPaymentAuth": hasPaymentAuth,
        "paymentAuthUrl": paymentAuthUrl,
        "paReq": paReq,
        "termUrl": termUrl,
        "md": md,
        "otpServiceRes": otpServiceRes,
        "billingCode": billingCode,
        "returnUrlPayoo": returnUrlPayoo,
        "success": success,
      };
}
