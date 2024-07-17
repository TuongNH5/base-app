import 'package:myutils/data/network/models/gtd_json_model.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/airport.dart';


class GtdPopularAirportRS extends GTDJsonModel {
  GtdPopularAirportRS({
    this.domesticCities,
    this.normalCitiesVietnam,
    this.internationalCities,
  });

  List<Airport>? domesticCities;
  List<Airport>? normalCitiesVietnam;
  List<Airport>? internationalCities;

  factory GtdPopularAirportRS.fromJson(Map<String, dynamic> json) =>
      GtdPopularAirportRS(
        domesticCities: json["domesticCities"] == null
            ? []
            : List<Airport>.from(
                json["domesticCities"]!.map((x) => Airport.fromJson(x))),
        normalCitiesVietnam: json["normalCitiesVietnam"] == null
            ? []
            : List<Airport>.from(
                json["normalCitiesVietnam"]!.map((x) => Airport.fromJson(x))),
        internationalCities: json["internationalCities"] == null
            ? []
            : List<Airport>.from(
                json["internationalCities"]!.map((x) => Airport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "domesticCities": domesticCities == null
            ? []
            : List<dynamic>.from(domesticCities!.map((x) => x.toJson())),
        "normalCitiesVietnam": normalCitiesVietnam == null
            ? []
            : List<dynamic>.from(normalCitiesVietnam!.map((x) => x.toJson())),
        "internationalCities": internationalCities == null
            ? []
            : List<dynamic>.from(internationalCities!.map((x) => x.toJson())),
      };
}
