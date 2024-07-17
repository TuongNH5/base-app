// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdVoidVoucherRs extends GtdResponse {
  String? result;
  String? voucherCode;
  String? bookingNumber;
  bool? redeemValid;
  GtdVoidVoucherRs({
    this.result,
    this.voucherCode,
    this.bookingNumber,
    this.redeemValid,
    super.duration,
    super.errors,
    super.success,
    super.textMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result,
      'voucherCode': voucherCode,
      'bookingNumber': bookingNumber,
      'redeemValid': redeemValid,
    };
  }

  factory GtdVoidVoucherRs.fromMap(Map<String, dynamic> map) {
    return GtdVoidVoucherRs(
      result: map['result'] != null ? map['result'] as String : null,
      voucherCode: map['voucherCode'] != null ? map['voucherCode'] as String : null,
      bookingNumber: map['bookingNumber'] != null ? map['bookingNumber'] as String : null,
      redeemValid: map['redeemValid'] != null ? map['redeemValid'] as bool : null,
      duration: map["duration"],
      errors: map["errors"] == null ? null : List<ErrorRs>.from(map["errors"]!.map((x) => ErrorRs.fromJson(x))),
      success: map["success"],
      textMessage: map["textMessage"],
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoidVoucherRs.fromJson(String source) =>
      GtdVoidVoucherRs.fromMap(json.decode(source) as Map<String, dynamic>);
}
