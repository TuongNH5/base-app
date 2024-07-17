
import 'package:myutils/data/network/models/gtd_json_model.dart';

class Airport extends GTDJsonModel {
  Airport({
    this.cityCode,
    this.city,
    this.city2,
    this.countryCode,
    this.country,
    this.country2,
    this.airportCode,
    this.airportName,
    this.airportName2,
  });

  String? cityCode;
  String? city;
  String? city2;
  String? countryCode;
  String? country;
  String? country2;
  String? airportCode;
  String? airportName;
  String? airportName2;

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        cityCode: json["cityCode"],
        city: json["city"],
        city2: json["city2"],
        countryCode: json["countryCode"],
        country: json["country"],
        country2: json["country2"],
        airportCode: json["airportCode"],
        airportName: json["airportName"],
        airportName2: json["airportName2"],
      );

  Map<String, dynamic> toJson() => {
        "cityCode": cityCode,
        "city": city,
        "city2": city2,
        "countryCode": countryCode,
        "country": country,
        "country2": country2,
        "airportCode": airportCode,
        "airportName": airportName,
        "airportName2": airportName2,
      };
}
