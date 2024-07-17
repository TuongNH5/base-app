import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/fare.dart';

class GtdPrice {
  String currencyCode;
  double baseFare;
  double serviceTax;
  double paxFare;
  double totalFare;
  double discountAmout;
  GtdPrice({
    this.currencyCode = "VND",
    this.baseFare = 0,
    this.serviceTax = 0,
    this.paxFare = 0,
    this.totalFare = 0,
    this.discountAmout = 0,
  });

  factory GtdPrice.fromFare(Fare fare) {
    GtdPrice price = GtdPrice(
        currencyCode: fare.passengerFare?.baseFare?.currencyCode ?? "VND",
        baseFare: fare.passengerFare?.baseFare?.amount ?? 0,
        totalFare: fare.passengerFare?.totalFare?.amount ?? 0);
    return price;
  }
}