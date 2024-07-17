
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/utc_offset.dart';

class AirportSegment {
  AirportSegment({
    this.airport,
    this.scheduledTime,
    this.utcOffset,
  });

  String? airport;
  DateTime? scheduledTime;
  UtcOffset? utcOffset;

  factory AirportSegment.fromJson(Map<String, dynamic> json) => AirportSegment(
        airport: json["airport"],
        scheduledTime: json["scheduledTime"] == null
            ? null
            : DateTime.parse(json["scheduledTime"]),
        utcOffset: json["utcOffset"] == null
            ? null
            : UtcOffset.fromJson(json["utcOffset"]),
      );

  Map<String, dynamic> toJson() => {
        "airport": airport,
        "scheduledTime": scheduledTime?.toIso8601String(),
        "utcOffset": utcOffset?.toJson(),
      };
}
