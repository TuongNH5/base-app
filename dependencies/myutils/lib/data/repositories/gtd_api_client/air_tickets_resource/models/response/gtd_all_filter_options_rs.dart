// To parse this JSON data, do
//
//     final allFilterOptionsRs = allFilterOptionsRsFromJson(jsonString);

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

// AllFilterOptionsRs allFilterOptionsRsFromJson(String str) =>
//     AllFilterOptionsRs.fromJson(json.decode(str));

// String allFilterOptionsRsToJson(AllFilterOptionsRs data) => json.encode(data.toJson());

class AllFilterOptionsRs extends GtdResponse {
  AllFilterOptionsRs({
    this.searchId,
    this.itineraryFilter,
    super.isSuccess,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  String? searchId;
  ItineraryFilter? itineraryFilter;

  factory AllFilterOptionsRs.fromJson(Map<String, dynamic> json) => AllFilterOptionsRs(
        isSuccess: json["isSuccess"],
        duration: json["duration"],
        textMessage: json["textMessage"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        searchId: json["searchId"],
        itineraryFilter: json["itineraryFilter"] == null ? null : ItineraryFilter.fromJson(json["itineraryFilter"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "searchId": searchId,
        "itineraryFilter": itineraryFilter?.toJson(),
        "success": success,
      };
}

class ItineraryFilter {
  ItineraryFilter({
    this.airlineOptions,
    this.arrivalDateTimeOptions,
    this.arrivalDateTimeReturnOptions,
    this.cabinClassOptions,
    this.departureDateTimeOptions,
    this.departureDateTimeReturnOptions,
    this.flightType,
    this.groupId,
    this.loadMore,
    this.minPrice,
    this.filterToPrice,
    this.filterFromPrice,
    this.priceItineraryId,
    this.step,
    this.stopOptions,
    this.ticketPolicyOptions,
  });

  List<String>? airlineOptions;
  dynamic arrivalDateTimeOptions;
  dynamic arrivalDateTimeReturnOptions;
  List<String>? cabinClassOptions;
  dynamic departureDateTimeOptions;
  dynamic departureDateTimeReturnOptions;
  dynamic flightType;
  dynamic groupId;
  dynamic loadMore;
  dynamic minPrice;
  double? filterToPrice;
  double? filterFromPrice;
  dynamic priceItineraryId;
  dynamic step;
  List<String>? stopOptions;
  dynamic ticketPolicyOptions;

  factory ItineraryFilter.fromJson(Map<String, dynamic> json) => ItineraryFilter(
        airlineOptions: json["airlineOptions"] == null ? [] : List<String>.from(json["airlineOptions"]!.map((x) => x)),
        arrivalDateTimeOptions: json["arrivalDateTimeOptions"],
        arrivalDateTimeReturnOptions: json["arrivalDateTimeReturnOptions"],
        cabinClassOptions:
            json["cabinClassOptions"] == null ? [] : List<String>.from(json["cabinClassOptions"]!.map((x) => x)),
        departureDateTimeOptions: json["departureDateTimeOptions"],
        departureDateTimeReturnOptions: json["departureDateTimeReturnOptions"],
        flightType: json["flightType"],
        groupId: json["groupId"],
        loadMore: json["loadMore"],
        minPrice: json["minPrice"],
        filterToPrice: json["filterToPrice"],
        filterFromPrice: json["filterFromPrice"],
        priceItineraryId: json["priceItineraryId"],
        step: json["step"],
        stopOptions: json["stopOptions"] == null ? [] : List<String>.from(json["stopOptions"]!.map((x) => x)),
        ticketPolicyOptions: json["ticketPolicyOptions"],
      );

  Map<String, dynamic> toJson() => {
        "airlineOptions": airlineOptions == null ? [] : List<dynamic>.from(airlineOptions!.map((x) => x)),
        "arrivalDateTimeOptions": arrivalDateTimeOptions,
        "arrivalDateTimeReturnOptions": arrivalDateTimeReturnOptions,
        "cabinClassOptions": cabinClassOptions == null ? [] : List<dynamic>.from(cabinClassOptions!.map((x) => x)),
        "departureDateTimeOptions": departureDateTimeOptions,
        "departureDateTimeReturnOptions": departureDateTimeReturnOptions,
        "flightType": flightType,
        "groupId": groupId,
        "loadMore": loadMore,
        "minPrice": minPrice,
        "filterToPrice": filterToPrice,
        "filterFromPrice": filterFromPrice,
        "priceItineraryId": priceItineraryId,
        "step": step,
        "stopOptions": stopOptions == null ? [] : List<dynamic>.from(stopOptions!.map((x) => x)),
        "ticketPolicyOptions": ticketPolicyOptions,
      };
}
