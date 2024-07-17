import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdInvoiceSumaryResponse extends GtdResponse {
  GtdInvoiceSumaryRs? result;
  GtdInvoiceSumaryResponse({this.result, super.duration, super.textMessage, super.errors, super.infos, super.success});
  factory GtdInvoiceSumaryResponse.fromJson(Map<String, dynamic> json) => GtdInvoiceSumaryResponse(
        result: json["result"] == null ? null : GtdInvoiceSumaryRs.fromJson(json["result"]),
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

class GtdInvoiceSumaryRs {
  final List<InvoiceSumary>? invoiceSumary;
  final double? totalSum;
  final int? totalInvoice;

  GtdInvoiceSumaryRs({
    this.invoiceSumary,
    this.totalSum,
    this.totalInvoice,
  });

  factory GtdInvoiceSumaryRs.fromJson(Map<String, dynamic> json) => GtdInvoiceSumaryRs(
        invoiceSumary: json["invoiceSumary"] == null
            ? []
            : List<InvoiceSumary>.from(json["invoiceSumary"]!.map((x) => InvoiceSumary.fromJson(x))),
        totalSum: json["totalSum"],
        totalInvoice: json["totalInvoice"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceSumary": invoiceSumary == null ? [] : List<dynamic>.from(invoiceSumary!.map((x) => x.toJson())),
        "totalSum": totalSum,
        "totalInvoice": totalInvoice,
      };
}

class InvoiceSumary {
  final int? invoiceMonthCount;
  final double? invoiceTotalSumMonth;
  final String? invoiceMonth;

  InvoiceSumary({
    this.invoiceMonthCount,
    this.invoiceTotalSumMonth,
    this.invoiceMonth,
  });

  factory InvoiceSumary.fromJson(Map<String, dynamic> json) => InvoiceSumary(
        invoiceMonthCount: json["invoiceMonthCount"],
        invoiceTotalSumMonth: json["invoiceTotalSumMonth"],
        invoiceMonth: json["invoiceMonth"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceMonthCount": invoiceMonthCount,
        "invoiceTotalSumMonth": invoiceTotalSumMonth,
        "invoiceMonth": invoiceMonth,
      };
}
