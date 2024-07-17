import 'package:myutils/data/network/models/gtd_json_model.dart';
import 'package:myutils/helpers/global_functions.dart';

class GtdFlightLowSearchRq extends GTDJsonModel {
  GtdFlightLowSearchRq({
    this.originCode,
    this.destinationCode,
    this.departureDate,
    this.returntureDate,
    this.cabinClass,
    this.routeType,
    this.adutsQtt,
    this.childrenQtt,
    this.infantsQtt,
    this.time,
    this.key,
    this.searchBranch,
    this.skipFilter,
    this.page,
    this.size,
  });

  String? originCode;
  String? destinationCode;
  String? departureDate;
  String? returntureDate;
  String? cabinClass;
  String? routeType;
  int? adutsQtt;
  int? childrenQtt;
  int? infantsQtt;
  String? time;
  String? key;
  String? searchBranch;
  bool? skipFilter;
  int? page;
  int? size;

  factory GtdFlightLowSearchRq.fromJson(Map<String, dynamic> json) =>
      GtdFlightLowSearchRq(
        originCode: json["origin_code"],
        destinationCode: json["destination_code"],
        departureDate: json["departure_date"],
        returntureDate: json["returnture_date"],
        cabinClass: json["cabin_class"],
        routeType: json["route_type"],
        adutsQtt: json["aduts_qtt"],
        childrenQtt: json["children_qtt"],
        infantsQtt: json["infants_qtt"],
        time: json["time"],
        key: json["key"],
        searchBranch: json["search_branch"],
        skipFilter: json["skip_filter"],
        page: json["page"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "origin_code": originCode,
        "destination_code": destinationCode,
        "departure_date": departureDate,
        "returnture_date": returntureDate,
        "cabin_class": cabinClass,
        "route_type": routeType,
        "aduts_qtt": adutsQtt,
        "children_qtt": childrenQtt,
        "infants_qtt": infantsQtt,
        "time": time,
        "key": key,
        "search_branch": searchBranch,
        "skip_filter": skipFilter,
        "page": page,
        "size": size,
      };

  Map<String, String> encryptKey() {
    Map<String, String> decryptKey = {};
    int time = DateTime.now().millisecondsSinceEpoch;
    // int time = GtdDateTime.timestampFromUTC("2023-03-13T15:41:49.939Z");
    // int time = 1678723398232;
    String plainString =
        '$originCode$destinationCode$departureDate${returntureDate}E${(routeType ?? "ONEWAY").toUpperCase()}$adutsQtt$childrenQtt$infantsQtt$page$size$time';

    decryptKey.putIfAbsent(
        "key", () => GlobalFunctions.encryptHmacSha256(value: plainString));
    decryptKey.putIfAbsent(
        "time",
        () =>
            // '${GtdDateTime.timestampFromLocalDate(dateTime: departureDate ?? DateTime.now().localDate("yyyy-MM-dd HH:mm:ss"))}');
            '$time');
    return decryptKey;
  }

  void updateTimeStampRequest() {
    int time = DateTime.now().millisecondsSinceEpoch;
    String plainString =
        '$originCode$destinationCode$departureDate${returntureDate}E${(routeType ?? "ONEWAY").toUpperCase()}$adutsQtt$childrenQtt$infantsQtt$page$size$time';
    key = GlobalFunctions.encryptHmacSha256(value: plainString);
    this.time = '$time';
  }
}
