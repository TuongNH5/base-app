
class FilterItineraryRq {
  String? groupId;
  String? searchId;
  String? airlineCode;
  String? cabinClass;
  String? supplierCode;
  String? fareSourceCode;
  FilterItineraryRq({
    this.groupId,
    this.searchId,
    this.airlineCode,
    this.cabinClass,
    this.supplierCode,
    this.fareSourceCode,
  });

      factory FilterItineraryRq.fromJson(Map<String, dynamic> json) => FilterItineraryRq(
        groupId: json["groupId"],
        airlineCode: json["airlineCode"],
        fareSourceCode: json["fareSourceCode"],
        supplierCode: json["supplierCode"],
        searchId: json["searchId"],
    );

    Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "airlineCode": airlineCode,
        "fareSourceCode": fareSourceCode,
        "supplierCode": supplierCode,
        "searchId": searchId,
    }..removeWhere((key, value) => value == null);
}
