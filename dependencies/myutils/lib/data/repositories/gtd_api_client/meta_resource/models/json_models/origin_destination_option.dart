import 'flight_segment.dart';

class OriginDestinationOption {
  OriginDestinationOption({
    this.cabinClassName,
    this.destinationCity,
    this.destinationDateTime,
    this.destinationLocationCode,
    this.destinationLocationName,
    this.flightDirection,
    this.flightSegments,
    this.journeyDuration,
    this.originCity,
    this.originDateTime,
    this.originLocationCode,
    this.originLocationName,
  });

  String? cabinClassName;
  String? destinationCity;
  DateTime? destinationDateTime;
  String? destinationLocationCode;
  String? destinationLocationName;
  String? flightDirection;
  List<FlightSegment>? flightSegments;
  int? journeyDuration;
  String? originCity;
  DateTime? originDateTime;
  String? originLocationCode;
  String? originLocationName;

  factory OriginDestinationOption.fromJson(Map<String, dynamic> json) =>
      OriginDestinationOption(
        cabinClassName: json["cabinClassName"],
        destinationCity: json["destinationCity"],
        destinationDateTime: json["destinationDateTime"] == null
            ? null
            : DateTime.parse(json["destinationDateTime"]),
        destinationLocationCode: json["destinationLocationCode"],
        destinationLocationName: json["destinationLocationName"],
        flightDirection: json["flightDirection"],
        flightSegments: json["flightSegments"] == null
            ? []
            : List<FlightSegment>.from(
                json["flightSegments"]!.map((x) => FlightSegment.fromJson(x))),
        journeyDuration: json["journeyDuration"],
        originCity: json["originCity"],
        originDateTime: json["originDateTime"] == null
            ? null
            : DateTime.parse(json["originDateTime"]),
        originLocationCode: json["originLocationCode"],
        originLocationName: json["originLocationName"],
      );

  Map<String, dynamic> toJson() => {
        "cabinClassName": cabinClassName,
        "destinationCity": destinationCity,
        "destinationDateTime": destinationDateTime?.toIso8601String(),
        "destinationLocationCode": destinationLocationCode,
        "destinationLocationName": destinationLocationName,
        "flightDirection": flightDirection,
        "flightSegments": flightSegments == null
            ? []
            : List<dynamic>.from(flightSegments!.map((x) => x.toJson())),
        "journeyDuration": journeyDuration,
        "originCity": originCity,
        "originDateTime": originDateTime?.toIso8601String(),
        "originLocationCode": originLocationCode,
        "originLocationName": originLocationName,
      };
}
