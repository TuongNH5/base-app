import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/surcharge.dart';

import 'base_fare.dart';

class PassengerFare {
  PassengerFare({
    this.baseFare,
    this.displayBaseFare,
    this.discountBaseFare,
    this.comboMarkup,
    this.equivFare,
    this.serviceTax,
    this.totalTax,
    this.surcharges,
    this.taxes,
    this.totalFare,
    this.totalPaxFee,
  });

  BaseFare? baseFare;
  BaseFare? displayBaseFare;
  BaseFare? discountBaseFare;
  BaseFare? comboMarkup;
  BaseFare? equivFare;
  BaseFare? serviceTax;
  BaseFare? totalTax;
  List<Surcharge>? surcharges;
  dynamic taxes;
  BaseFare? totalFare;
  BaseFare? totalPaxFee;

  factory PassengerFare.fromJson(Map<String, dynamic> json) => PassengerFare(
        baseFare: json["baseFare"] == null ? null : BaseFare.fromJson(json["baseFare"]),
        displayBaseFare: json["displayBaseFare"] == null ? null : BaseFare.fromJson(json["displayBaseFare"]),
        discountBaseFare: json["discountBaseFare"] == null ? null : BaseFare.fromJson(json["discountBaseFare"]),
        comboMarkup: json["comboMarkup"] == null ? null : BaseFare.fromJson(json["comboMarkup"]),
        equivFare: json["equivFare"] == null ? null : BaseFare.fromJson(json["equivFare"]),
        serviceTax: json["serviceTax"] == null ? null : BaseFare.fromJson(json["serviceTax"]),
        totalTax: json["totalTax"] == null ? null : BaseFare.fromJson(json["totalTax"]),
        surcharges: json["surcharges"] == null
            ? []
            : List<Surcharge>.from(json["surcharges"]!.map((x) => Surcharge.fromJson(x))),
        taxes: json["taxes"],
        totalFare: json["totalFare"] == null ? null : BaseFare.fromJson(json["totalFare"]),
        totalPaxFee: json["totalPaxFee"] == null ? null : BaseFare.fromJson(json["totalPaxFee"]),
      );

  Map<String, dynamic> toJson() => {
        "baseFare": baseFare?.toJson(),
        "displayBaseFare": displayBaseFare?.toJson(),
        "discountBaseFare": discountBaseFare?.toJson(),
        "comboMarkup": comboMarkup?.toJson(),
        "equivFare": equivFare?.toJson(),
        "serviceTax": serviceTax?.toJson(),
        "surcharges": surcharges == null ? [] : List<dynamic>.from(surcharges!.map((x) => x.toJson())),
        "taxes": taxes,
        "totalFare": totalFare?.toJson(),
        "totalPaxFee": totalPaxFee?.toJson(),
      };
}
