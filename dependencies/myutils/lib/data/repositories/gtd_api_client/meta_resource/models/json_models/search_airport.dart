import 'package:myutils/data/network/models/gtd_json_model.dart';

// List<SearchAirport> searchAirportModelFromJson(String str) => List<SearchAirport>.from(json.decode(str).map((x) => SearchAirport.fromJson(x)));

// String searchAirportModelToJson(List<SearchAirport> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAirport extends GTDJsonModel {
  SearchAirport({
    this.id,
    this.code,
    this.name,
    this.cityCode,
    this.city,
    this.countryCode,
    this.country,
    this.iata,
    this.icao,
    this.latitude,
    this.longitude,
    this.altitude,
    this.timezone,
    this.dts,
    this.tzTimezone,
    this.updatedAt,
    this.groupName,
    this.name2,
    this.city2,
    this.location,
    this.connectedPorts,
    this.index,
    this.stateCode,
    this.status,
    this.keywords,
  });

  int? id;
  String? code;
  String? name;
  String? cityCode;
  String? city;
  String? countryCode;
  String? country;
  String? iata;
  dynamic icao;
  dynamic latitude;
  dynamic longitude;
  dynamic altitude;
  double? timezone;
  dynamic dts;
  dynamic tzTimezone;
  dynamic updatedAt;
  String? groupName;
  String? name2;
  String? city2;
  String? location;
  dynamic connectedPorts;
  int? index;
  String? stateCode;
  String? status;
  dynamic keywords;

  factory SearchAirport.fromJson(Map<String, dynamic> json) => SearchAirport(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        cityCode: json["cityCode"],
        city: json["city"],
        countryCode: json["countryCode"],
        country: json["country"],
        iata: json["iata"],
        icao: json["icao"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        altitude: json["altitude"],
        timezone: json["timezone"],
        dts: json["dts"],
        tzTimezone: json["tzTimezone"],
        updatedAt: json["updatedAt"],
        groupName: json["groupName"],
        name2: json["name2"],
        city2: json["city2"],
        location: json["location"],
        connectedPorts: json["connectedPorts"],
        index: json["index"],
        stateCode: json["stateCode"],
        status: json["status"],
        keywords: json["keywords"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "cityCode": cityCode,
        "city": city,
        "countryCode": countryCode,
        "country": country,
        "iata": iata,
        "icao": icao,
        "latitude": latitude,
        "longitude": longitude,
        "altitude": altitude,
        "timezone": timezone,
        "dts": dts,
        "tzTimezone": tzTimezone,
        "updatedAt": updatedAt,
        "groupName": groupName,
        "name2": name2,
        "city2": city2,
        "location": location,
        "connectedPorts": connectedPorts,
        "index": index,
        "stateCode": stateCode,
        "status": status,
        "keywords": keywords,
      };
}
