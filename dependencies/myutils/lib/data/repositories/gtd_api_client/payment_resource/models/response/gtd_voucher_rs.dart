// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/json_models/gtd_voucher_info.dart';

class GtdVoucherRs extends GtdResponse {
  String? bookingNumber;
  double? discountAmount;
  String? trackingCode;
  String? voucherCode;
  bool? voucherValid;
  double? amountOff;
  double? percentOff;
  double? amountLimited;
  String? type;
  GtdVoucherRs({
    this.bookingNumber,
    this.discountAmount,
    this.trackingCode,
    this.voucherCode,
    this.voucherValid,
    this.amountOff,
    this.percentOff,
    this.amountLimited,
    this.type,
    super.infos,
    super.duration,
    super.errors,
    super.textMessage,
    super.success,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingNumber': bookingNumber,
      'discountAmount': discountAmount,
      'trackingCode': trackingCode,
      'voucherCode': voucherCode,
      'voucherValid': voucherValid,
      'amountOff': amountOff,
      'percentOff': percentOff,
      'amountLimited': amountLimited,
      'type': type,
    };
  }

  factory GtdVoucherRs.fromMap(Map<String, dynamic> map) {
    return GtdVoucherRs(
      bookingNumber: map['bookingNumber'] != null ? map['bookingNumber'] as String : null,
      discountAmount: map['discountAmount'] != null ? map['discountAmount'] as double : null,
      trackingCode: map['trackingCode'] != null ? map['trackingCode'] as String : null,
      voucherCode: map['voucherCode'] != null ? map['voucherCode'] as String : null,
      voucherValid: map['voucherValid'] != null ? map['voucherValid'] as bool : null,
      amountOff: map['amountOff'] != null ? map['amountOff'] as double : null,
      percentOff: map['percentOff'] != null ? map['percentOff'] as double : null,
      amountLimited: map['amountLimited'] != null ? map['amountLimited'] as double : null,
      type: map['type'] != null ? map['type'] as String : null,
      duration: map["duration"],
      textMessage: map["textMessage"],
      errors: map["errors"] == null ? null : List<ErrorRs>.from(map["errors"]!.map((x) => ErrorRs.fromJson(x))),
      infos: map["infos"] == null ? null : List<InfoRs>.from(map["infos"]!.map((x) => InfoRs.fromJson(x))),
      success: map["success"],
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherRs.fromJson(String source) => GtdVoucherRs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GtdVoucherRs(bookingNumber: $bookingNumber, discountAmount: $discountAmount, trackingCode: $trackingCode, voucherCode: $voucherCode, voucherValid: $voucherValid, amountOff: $amountOff, percentOff: $percentOff, amountLimited: $amountLimited, type: $type)';
  }

  @override
  bool operator ==(covariant GtdVoucherRs other) {
    if (identical(this, other)) return true;

    return other.bookingNumber == bookingNumber &&
        other.discountAmount == discountAmount &&
        other.trackingCode == trackingCode &&
        other.voucherCode == voucherCode &&
        other.voucherValid == voucherValid &&
        other.amountOff == amountOff &&
        other.percentOff == percentOff &&
        other.amountLimited == amountLimited &&
        other.type == type;
  }

  @override
  int get hashCode {
    return bookingNumber.hashCode ^
        discountAmount.hashCode ^
        trackingCode.hashCode ^
        voucherCode.hashCode ^
        voucherValid.hashCode ^
        amountOff.hashCode ^
        percentOff.hashCode ^
        amountLimited.hashCode ^
        type.hashCode;
  }
}

extension GtdVoucherRsMapper on GtdVoucherRs {
  static GtdVoucherRs fromGtdVoucherInfoRs(
      {required String bookingNumber, required double totalAmount, required GtdVoucherInfoRs voucherInfoRs}) {
    var voucherDetail = voucherInfoRs.data!;
    var voucherRS = GtdVoucherRs(success: true);
    voucherRS.type = voucherDetail.discount?.type ?? "AMOUNT";
    if (voucherRS.type == "AMOUNT") {
      var amountOff = voucherDetail.discount?.amountOff;
      var amountLimited = voucherDetail.discount?.amountLimit;
      if (amountOff != null && amountLimited != null) {
        if (amountLimited > 0) {
          voucherRS.discountAmount = (amountOff > amountLimited) ? amountLimited : amountOff;
        } else {
          voucherRS.discountAmount = amountOff;
        }
      }
    } else {
      var percentOff = voucherDetail.discount?.percentOff;
      var amountLimited = voucherDetail.discount?.amountLimit;
      if (percentOff != null && amountLimited != null) {
        var amountOff = (totalAmount * percentOff) / 100;
        if (amountLimited > 0) {
          voucherRS.discountAmount = (amountOff > amountLimited) ? amountLimited : amountOff;
        } else {
          voucherRS.discountAmount = amountOff;
        }
      }
    }

    voucherRS.amountOff = voucherDetail.discount?.amountOff;
    voucherRS.amountLimited = voucherDetail.discount?.amountLimit;
    voucherRS.percentOff = voucherDetail.discount?.percentOff;
    voucherRS.success = true;
    voucherRS.voucherValid = false;
    voucherRS.bookingNumber = bookingNumber;
    voucherRS.voucherCode = voucherDetail.code;
    return voucherRS;
  }
}
