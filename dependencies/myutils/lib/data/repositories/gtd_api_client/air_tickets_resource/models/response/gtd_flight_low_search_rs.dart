
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/page.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

class GtdFlightLowSearchRs extends GtdResponse {
  GtdFlightLowSearchRs({
    this.returnSearchId,
    this.departureSearchId,
    this.flightType,
    this.groupPricedItineraries,
    this.page,
    this.searchId,
    super.duration,
    super.infos,
    super.errors,
    super.success,
    super.textMessage,
  });

  String? returnSearchId;
  String? departureSearchId;
  String? flightType;
  List<GroupPricedItinerary>? groupPricedItineraries;
  Page? page;
  String? searchId;

  factory GtdFlightLowSearchRs.fromJson(Map<String, dynamic> json) => GtdFlightLowSearchRs(
        returnSearchId: json["returnSearchId"],
        departureSearchId: json["departureSearchId"],
        flightType: json["flightType"],
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        groupPricedItineraries: json["groupPricedItineraries"] == null
            ? []
            : List<GroupPricedItinerary>.from(
                json["groupPricedItineraries"]!.map((x) => GroupPricedItinerary.fromJson(x))),
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
        searchId: json["searchId"],
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "returnSearchId": returnSearchId,
        "departureSearchId": departureSearchId,
        "flightType": flightType,
        "duration": duration,
        "errors": errors,
        "groupPricedItineraries": groupPricedItineraries == null
            ? []
            : List<dynamic>.from(groupPricedItineraries!.map((x) => x.toJson())),
        "infos": infos,
        "page": page?.toJson(),
        "searchId": searchId,
        "success": success,
        "textMessage": textMessage,
      };
}

extension GtdFlightLowSearchRsMapping on GtdFlightLowSearchRs {

  String journeyDurationStr(int millSeconds) {
    int oneSecond = 1;
    int oneMinute = oneSecond * 1;
    int oneHour = oneMinute * 60;
    int oneDay = oneHour * 24;

    // int seconds = ((millSeconds % oneMinute) / oneSecond).floor();
    int minutes = ((millSeconds % oneHour) / oneMinute).floor();
    int hours = ((millSeconds % oneDay) / oneHour).floor();
    int days = (millSeconds / oneDay).floor();

    String timeString = '';
    if (days != 0) {
      timeString += (days != 1) ? ('${days}d') : ('${days}d');
    }
    if (hours != 0) {
      timeString += (hours != 1) ? (' ${hours}h') : ('${hours}h');
    }
    if (minutes != 0) {
      timeString += (minutes != 1) ? (' ${minutes}m') : ('${minutes}m');
    }
    return timeString;
  }
}
