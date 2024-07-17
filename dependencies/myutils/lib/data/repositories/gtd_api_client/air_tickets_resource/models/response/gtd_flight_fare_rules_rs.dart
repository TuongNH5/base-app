import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_error_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_info_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/operating_airline.dart';

class GtdFlightFareRulesRs extends GtdResponse {
  List<BookedFareRule>? bookedFareRules;
  String? bookingCode;
  String? bookingNumber;

  GtdFlightFareRulesRs({
    this.bookedFareRules,
    this.bookingCode,
    this.bookingNumber,
    super.duration,
    super.errors,
    super.infos,
    super.success,
    super.textMessage,
  });

  factory GtdFlightFareRulesRs.fromJson(Map<String, dynamic> json) => GtdFlightFareRulesRs(
        bookedFareRules: json["bookedFareRules"] == null
            ? []
            : List<BookedFareRule>.from(json["bookedFareRules"]!.map((x) => BookedFareRule.fromJson(x))),
        bookingCode: json["bookingCode"],
        bookingNumber: json["bookingNumber"],
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "bookedFareRules": bookedFareRules == null ? [] : List<dynamic>.from(bookedFareRules!.map((x) => x.toJson())),
        "bookingCode": bookingCode,
        "bookingNumber": bookingNumber,
        "duration": duration,
        "errors": errors,
        "infos": infos,
        "success": success,
        "textMessage": textMessage,
      };
}

class BookedFareRule {
  String? fareCode;
  List<FareRule>? fareRules;
  String? groupId;

  BookedFareRule({
    this.fareCode,
    this.fareRules,
    this.groupId,
  });

  factory BookedFareRule.fromJson(Map<String, dynamic> json) => BookedFareRule(
        fareCode: json["fareCode"],
        fareRules:
            json["fareRules"] == null ? [] : List<FareRule>.from(json["fareRules"]!.map((x) => FareRule.fromJson(x))),
        groupId: json["groupId"],
      );

  Map<String, dynamic> toJson() => {
        "fareCode": fareCode,
        "fareRules": fareRules == null ? [] : List<dynamic>.from(fareRules!.map((x) => x.toJson())),
        "groupId": groupId,
      };
}

class FareRule {
  String? arrivalAirportLocationCode;
  String? arrivalAirportLocationName;
  dynamic arrivalCity;
  DateTime? arrivalDateTime;
  String? departureAirportLocationCode;
  String? departureAirportLocationName;
  dynamic departureCity;
  DateTime? departureDateTime;
  List<FareRuleItem>? fareRuleItems;
  OperatingAirline? operatingAirline;

  FareRule({
    this.arrivalAirportLocationCode,
    this.arrivalAirportLocationName,
    this.arrivalCity,
    this.arrivalDateTime,
    this.departureAirportLocationCode,
    this.departureAirportLocationName,
    this.departureCity,
    this.departureDateTime,
    this.fareRuleItems,
    this.operatingAirline,
  });

  factory FareRule.fromJson(Map<String, dynamic> json) => FareRule(
        arrivalAirportLocationCode: json["arrivalAirportLocationCode"],
        arrivalAirportLocationName: json["arrivalAirportLocationName"],
        arrivalCity: json["arrivalCity"],
        arrivalDateTime: json["arrivalDateTime"] == null ? null : DateTime.parse(json["arrivalDateTime"]),
        departureAirportLocationCode: json["departureAirportLocationCode"],
        departureAirportLocationName: json["departureAirportLocationName"],
        departureCity: json["departureCity"],
        departureDateTime: json["departureDateTime"] == null ? null : DateTime.parse(json["departureDateTime"]),
        fareRuleItems: json["fareRuleItems"] == null
            ? []
            : List<FareRuleItem>.from(json["fareRuleItems"]!.map((x) => FareRuleItem.fromJson(x))),
        operatingAirline: json["operatingAirline"] == null ? null : OperatingAirline.fromJson(json["operatingAirline"]),
      );

  Map<String, dynamic> toJson() => {
        "arrivalAirportLocationCode": arrivalAirportLocationCode,
        "arrivalAirportLocationName": arrivalAirportLocationName,
        "arrivalCity": arrivalCity,
        "arrivalDateTime": arrivalDateTime?.toIso8601String(),
        "departureAirportLocationCode": departureAirportLocationCode,
        "departureAirportLocationName": departureAirportLocationName,
        "departureCity": departureCity,
        "departureDateTime": departureDateTime?.toIso8601String(),
        "fareRuleItems": fareRuleItems == null ? [] : List<dynamic>.from(fareRuleItems!.map((x) => x.toJson())),
        "operatingAirline": operatingAirline?.toJson(),
      };
}

class FareRuleItem {
  String? detail;
  String? title;

  FareRuleItem({
    this.detail,
    this.title,
  });

  factory FareRuleItem.fromJson(Map<String, dynamic> json) => FareRuleItem(
        detail: json["detail"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "title": title,
      };
}
