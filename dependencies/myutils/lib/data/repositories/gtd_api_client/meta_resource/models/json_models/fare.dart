
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/passenger_fare.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/passenger_type_quantities.dart';

class Fare {
  Fare({
    this.fareBasisCodes,
    this.passengerFare,
    this.passengerTypeQuantities,
  });

  dynamic fareBasisCodes;
  PassengerFare? passengerFare;
  PassengerTypeQuantities? passengerTypeQuantities;

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        fareBasisCodes: json["fareBasisCodes"],
        passengerFare: json["passengerFare"] == null
            ? null
            : PassengerFare.fromJson(json["passengerFare"]),
        passengerTypeQuantities: json["passengerTypeQuantities"] == null
            ? null
            : PassengerTypeQuantities.fromJson(json["passengerTypeQuantities"]),
      );

  Map<String, dynamic> toJson() => {
        "fareBasisCodes": fareBasisCodes,
        "passengerFare": passengerFare?.toJson(),
        "passengerTypeQuantities": passengerTypeQuantities?.toJson(),
      };
}
