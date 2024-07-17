import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GtdRedeemVoucherRq {
  String bookingNumber;
  String voucherCode;
  String paymentType;
  GtdRedeemVoucherRq({
    required this.bookingNumber,
    required this.voucherCode,
    this.paymentType = "OTHER",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingNumber': bookingNumber,
      'voucherCode': voucherCode,
      'paymentType': paymentType,
    };
  }

  factory GtdRedeemVoucherRq.fromMap(Map<String, dynamic> map) {
    return GtdRedeemVoucherRq(
      bookingNumber: map['bookingNumber'] as String,
      voucherCode: map['voucherCode'] as String,
      paymentType: map['paymentType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdRedeemVoucherRq.fromJson(String source) =>
      GtdRedeemVoucherRq.fromMap(json.decode(source) as Map<String, dynamic>);
}
