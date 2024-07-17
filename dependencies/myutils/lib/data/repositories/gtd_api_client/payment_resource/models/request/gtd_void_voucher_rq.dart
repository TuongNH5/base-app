// ignore_for_file: public_member_api_docs, sort_constructors_first
class GtdVoidVoucherRq {
  String bookingNumber;
  String voucherCode;
  String redeemId;
  GtdVoidVoucherRq({
    required this.bookingNumber,
    required this.voucherCode,
    required this.redeemId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingNumber': bookingNumber,
      'voucherCode': voucherCode,
      'redeemId': redeemId,
    };
  }

  factory GtdVoidVoucherRq.fromMap(Map<String, dynamic> map) {
    return GtdVoidVoucherRq(
      bookingNumber: map['bookingNumber'] as String,
      voucherCode: map['voucherCode'] as String,
      redeemId: map['redeemId'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory GtdVoidVoucherRq.fromJson(String source) =>
  //     GtdVoidVoucherRq.fromMap(json.decode(source) as Map<String, dynamic>);
}
