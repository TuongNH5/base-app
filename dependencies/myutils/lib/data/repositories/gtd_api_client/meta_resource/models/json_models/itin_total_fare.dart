import 'base_fare.dart';

class ItinTotalFare {
  ItinTotalFare({
    this.baseFare,
    this.comboMarkup,
    this.equivFare,
    this.serviceTax,
    this.totalFare,
    this.totalPaxFee,
    this.totalTax,
  });

  BaseFare? baseFare;
  BaseFare? comboMarkup;
  BaseFare? equivFare;
  BaseFare? serviceTax;
  BaseFare? totalFare;
  BaseFare? totalPaxFee;
  BaseFare? totalTax;

  factory ItinTotalFare.fromJson(Map<String, dynamic> json) => ItinTotalFare(
        baseFare: json["baseFare"] == null ? null : BaseFare.fromJson(json["baseFare"]),
        comboMarkup: json["comboMarkup"] == null ? null : BaseFare.fromJson(json["comboMarkup"]),
        equivFare: json["equivFare"] == null ? null : BaseFare.fromJson(json["equivFare"]),
        serviceTax: json["serviceTax"] == null ? null : BaseFare.fromJson(json["serviceTax"]),
        totalFare: json["totalFare"] == null ? null : BaseFare.fromJson(json["totalFare"]),
        totalPaxFee: json["totalPaxFee"] == null ? null : BaseFare.fromJson(json["totalPaxFee"]),
        totalTax: json["totalTax"] == null ? null : BaseFare.fromJson(json["totalTax"]),
      );

  Map<String, dynamic> toJson() => {
        "baseFare": baseFare?.toJson(),
        "comboMarkup": comboMarkup?.toJson(),
        "equivFare": equivFare?.toJson(),
        "serviceTax": serviceTax?.toJson(),
        "totalFare": totalFare?.toJson(),
        "totalPaxFee": totalPaxFee?.toJson(),
        "totalTax": totalTax?.toJson(),
      };
}
