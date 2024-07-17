import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class PaymentFee {
  double? amount;
  String? paymentType;
  String? valueType;

  PaymentFee({
    this.amount,
    this.paymentType,
    this.valueType,
  });

  factory PaymentFee.fromJson(Map<String, dynamic> json) => PaymentFee(
        amount: json["amount"],
        paymentType: json["paymentType"],
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "paymentType": paymentType,
        "valueType": valueType,
      };
}

class GtdPaymentFeeRs extends GtdResponse {
  List<PaymentFee>? peymentFees;

  GtdPaymentFeeRs({
    super.duration,
    super.errors,
    super.infos,
    this.peymentFees,
    super.success,
    super.textMessage,
  });

  factory GtdPaymentFeeRs.fromJson(Map<String, dynamic> json) => GtdPaymentFeeRs(
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        peymentFees: json["peymentFees"] == null
            ? []
            : List<PaymentFee>.from(json["peymentFees"]!.map((x) => PaymentFee.fromJson(x))),
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "errors": errors,
        "infos": infos,
        "peymentFees": peymentFees == null ? [] : List<dynamic>.from(peymentFees!.map((x) => x.toJson())),
        "success": success,
        "textMessage": textMessage,
      };
}
