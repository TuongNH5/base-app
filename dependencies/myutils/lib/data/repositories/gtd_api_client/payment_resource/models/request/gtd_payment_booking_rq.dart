class GtdPaymentBookingRq {
  String bookingNumber;
  String bookingCode;
  double amount;
  String paymentType;
  ExtentInfo? extentInfo;

  GtdPaymentBookingRq({
    required this.bookingNumber,
    required this.bookingCode,
    required this.amount,
    required this.paymentType,
    this.extentInfo,
  });

  factory GtdPaymentBookingRq.fromJson(Map<String, dynamic> json) => GtdPaymentBookingRq(
        bookingNumber: json["bookingNumber"],
        bookingCode: json["bookingCode"],
        amount: json["amount"],
        paymentType: json["paymentType"],
        extentInfo: json["extentInfo"] == null ? null : ExtentInfo.fromJson(json["extentInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingNumber": bookingNumber,
        "bookingCode": bookingCode,
        "amount": amount,
        "paymentType": paymentType,
        "extentInfo": extentInfo?.toJson(),
      }..removeWhere((key, value) => value == null);
}

class ExtentInfo {
  PayByDebitReq? payByDebitReq;

  ExtentInfo({
    this.payByDebitReq,
  });

  factory ExtentInfo.fromJson(Map<String, dynamic> json) => ExtentInfo(
        payByDebitReq: json["payByDebitReq"] == null ? null : PayByDebitReq.fromJson(json["payByDebitReq"]),
      );

  Map<String, dynamic> toJson() => {
        "payByDebitReq": payByDebitReq?.toJson(),
      };
}

class PayByDebitReq {
  String? paymentOptionEnum;

  PayByDebitReq({
    this.paymentOptionEnum,
  });

  factory PayByDebitReq.fromJson(Map<String, dynamic> json) => PayByDebitReq(
        paymentOptionEnum: json["paymentOptionEnum"],
      );

  Map<String, dynamic> toJson() => {
        "paymentOptionEnum": paymentOptionEnum,
      };
}
