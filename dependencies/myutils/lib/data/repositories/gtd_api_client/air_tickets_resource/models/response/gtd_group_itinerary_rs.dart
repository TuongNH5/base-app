import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

// GroupItineraryRs groupItineraryRsFromJson(String str) =>
//     GroupItineraryRs.fromJson(json.decode(str));

// String groupItineraryRsToJson(GroupItineraryRs data) => json.encode(data.toJson());

class GroupItineraryRs extends GtdResponse {
  GroupItineraryRs({
    this.groupPricedItinerary,
    this.searchId,
    super.duration,
    super.infos,
    super.errors,
    super.success,
    super.textMessage,
  });

  GroupPricedItinerary? groupPricedItinerary;
  String? searchId;

  factory GroupItineraryRs.fromJson(Map<String, dynamic> json) => GroupItineraryRs(
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        groupPricedItinerary:
            json["groupPricedItinerary"] == null ? null : GroupPricedItinerary.fromJson(json["groupPricedItinerary"]),
        searchId: json["searchId"],
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "errors": errors,
        "groupPricedItinerary": groupPricedItinerary?.toJson(),
        "infos": infos,
        "searchId": searchId,
        "success": success,
        "textMessage": textMessage,
      };
}
