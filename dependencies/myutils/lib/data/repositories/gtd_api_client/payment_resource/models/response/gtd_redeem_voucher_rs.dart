// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdRedeemVoucherRs extends GtdResponse {
  String? voucherCode;
  String? bookingNumber;
  bool? redeemValid;
  GtdRedeemVoucherRs({
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
      'voucherCode': voucherCode,
      'bookingNumber': bookingNumber,
      'redeemValid': redeemValid,
    };
  }

  factory GtdRedeemVoucherRs.fromMap(Map<String, dynamic> map) {
    return GtdRedeemVoucherRs(
      voucherCode: map['voucherCode'] != null ? map['voucherCode'] as String : null,
      bookingNumber: map['bookingNumber'] != null ? map['bookingNumber'] as String : null,
      redeemValid: map['redeemValid'] != null ? map['redeemValid'] as bool : null,
      duration: map["duration"],
      errors: map["errors"] == null ? null : List<ErrorRs>.from(map["errors"]!.map((x) => ErrorRs.fromJson(x))),
      success: map["success"],
      textMessage: map["textMessage"],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory GtdRedeemVoucherRs.fromJson(String source) => GtdRedeemVoucherRs.fromMap(json.decode(source) as Map<String, dynamic>);
}
