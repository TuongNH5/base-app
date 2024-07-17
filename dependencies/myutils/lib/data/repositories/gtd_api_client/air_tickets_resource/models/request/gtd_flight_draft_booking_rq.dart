class GtdFlightDraftBookingRq {
  GtdFlightDraftBookingRq({
    this.itineraryInfos,
  });

  List<ItineraryInfo>? itineraryInfos;

  factory GtdFlightDraftBookingRq.fromJson(Map<String, dynamic> json) => GtdFlightDraftBookingRq(
        itineraryInfos: json["itineraryInfos"] == null
            ? []
            : List<ItineraryInfo>.from(json["itineraryInfos"]!.map((x) => ItineraryInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "itineraryInfos": itineraryInfos == null ? [] : List<dynamic>.from(itineraryInfos!.map((x) => x.toJson())),
      };
}

class ItineraryInfo {
  ItineraryInfo({
    required this.fareSourceCode,
    required this.groupId,
    required this.searchId,
  });

  String fareSourceCode;
  String groupId;
  String searchId;

  factory ItineraryInfo.fromJson(Map<String, dynamic> json) => ItineraryInfo(
        fareSourceCode: json["fareSourceCode"],
        groupId: json["groupId"],
        searchId: json["searchId"],
      );

  Map<String, dynamic> toJson() => {
        "fareSourceCode": fareSourceCode,
        "groupId": groupId,
        "searchId": searchId,
      };
}
