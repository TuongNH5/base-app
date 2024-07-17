import 'fare.dart';
import 'itin_total_fare.dart';

class AirItineraryPricingInfo {
  AirItineraryPricingInfo({
    this.adultFare,
    this.childFare,
    this.divideInPartyIndicator,
    this.fareInfoReferences,
    this.fareSourceCode,
    this.fareType,
    this.infantFare,
    this.itinTotalFare,
  });

  Fare? adultFare;
  Fare? childFare;
  bool? divideInPartyIndicator;
  dynamic fareInfoReferences;
  String? fareSourceCode;
  String? fareType;
  Fare? infantFare;
  ItinTotalFare? itinTotalFare;

  factory AirItineraryPricingInfo.fromJson(Map<String, dynamic> json) => AirItineraryPricingInfo(
        adultFare: json["adultFare"] == null ? null : Fare.fromJson(json["adultFare"]),
        childFare: json["childFare"] == null ? null : Fare.fromJson(json["childFare"]),
        divideInPartyIndicator: json["divideInPartyIndicator"],
        fareInfoReferences: json["fareInfoReferences"],
        fareSourceCode: json["fareSourceCode"],
        fareType: json["fareType"],
        infantFare: json["infantFare"] == null ? null : Fare.fromJson(json["infantFare"]),
        itinTotalFare: json["itinTotalFare"] == null ? null : ItinTotalFare.fromJson(json["itinTotalFare"]),
      );

  Map<String, dynamic> toJson() => {
        "adultFare": adultFare?.toJson(),
        "childFare": childFare?.toJson(),
        "divideInPartyIndicator": divideInPartyIndicator,
        "fareInfoReferences": fareInfoReferences,
        "fareSourceCode": fareSourceCode,
        "fareType": fareType,
        "infantFare": infantFare?.toJson(),
        "itinTotalFare": itinTotalFare?.toJson(),
      };
}

extension AirItineraryPricingInfoHelper on AirItineraryPricingInfo {
  double get baseAmount {
    return itinTotalFare?.baseFare?.amount ?? 0;
  }

  double get totalTempAmount {
    return itinTotalFare?.totalFare?.amount ?? 0 - markup;
  }

  double get totalAmount {
    // double markup = itinTotalFare?.equivFare?.amount ?? 0;
    //Recheck markup later => markup is included in totalFare
    // double markup = 0;
    return itinTotalFare?.totalFare?.amount ?? 0;
  }

  double get totalTaxFee {
    double totalTaxFee = itinTotalFare?.serviceTax?.amount ?? 0;
    return totalTaxFee;
  }

  double get markup {
    double markup = itinTotalFare?.equivFare?.amount ?? 0;
    return markup;
  }

  double get comboMarkup {
    double markup = itinTotalFare?.comboMarkup?.amount ?? 0;
    return markup;
  }

  double get netPerPerson {
    double fee = adultFare?.passengerFare?.baseFare?.amount ?? 0;
    double tax = adultFare?.passengerFare?.serviceTax?.amount ?? 0;
    return fee + tax;
  }

  double get netAdultPerPerson {
    double fee = adultFare?.passengerFare?.baseFare?.amount ?? 0;
    double tax = adultFare?.passengerFare?.serviceTax?.amount ?? 0;
    return fee + tax;
  }

  double get baseAdultPerPerson {
    double fee = adultFare?.passengerFare?.baseFare?.amount ?? 0;
    return fee;
  }

  double get netChildPerPerson {
    double fee = childFare?.passengerFare?.baseFare?.amount ?? 0;
    double tax = childFare?.passengerFare?.serviceTax?.amount ?? 0;
    return fee + tax;
  }

  double get baseChildPerPerson {
    double fee = childFare?.passengerFare?.baseFare?.amount ?? 0;
    return fee;
  }

  double get netInfantPerPerson {
    double fee = infantFare?.passengerFare?.baseFare?.amount ?? 0;
    double tax = infantFare?.passengerFare?.serviceTax?.amount ?? 0;
    return fee + tax;
  }

  double get baseInfantPerPerson {
    double fee = infantFare?.passengerFare?.baseFare?.amount ?? 0;
    return fee;
  }

  double get totalAdultPerPerson {
    double totalPrice = adultFare?.passengerFare?.totalFare?.amount ?? 0;
    return totalPrice;
  }

  double get totalChildPerPerson {
    double totalPrice = childFare?.passengerFare?.totalFare?.amount ?? 0;
    return totalPrice;
  }

  double get totalInfantPerPerson {
    double totalPrice = infantFare?.passengerFare?.totalFare?.amount ?? 0;
    return totalPrice;
  }

  double get taxFee {
    double taxFee = (itinTotalFare?.serviceTax?.amount ?? 0) + (itinTotalFare?.totalTax?.amount ?? 0);
    return taxFee;
  }

  int get countAdult {
    return adultFare?.passengerTypeQuantities?.quantity ?? 0;
  }

  int get countChild {
    return childFare?.passengerTypeQuantities?.quantity ?? 0;
  }

  int get countInfant {
    return infantFare?.passengerTypeQuantities?.quantity ?? 0;
  }
}
