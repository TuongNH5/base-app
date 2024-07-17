import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdHotelPolularRs extends GtdResponse {
  FavoriteHotelLocationRs? result;

  GtdHotelPolularRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelPolularRs.fromJson(Map<String, dynamic> json) => GtdHotelPolularRs(
        result: json["result"] == null ? null : FavoriteHotelLocationRs.fromJson(json["result"]),
        duration: json["duration"],
        textMessage: json["textMessage"],
        success: json["success"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}

class FavoriteHotelLocationRs {
  int? id;
  int? code;
  String? name;
  int? arrange;
  String? category;
  List<HotelPropertyValue>? propertyValues;

  FavoriteHotelLocationRs({
    this.id,
    this.code,
    this.name,
    this.arrange,
    this.category,
    this.propertyValues,
  });

  factory FavoriteHotelLocationRs.fromJson(Map<String, dynamic> json) => FavoriteHotelLocationRs(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        arrange: json["arrange"],
        category: json["category"],
        propertyValues: json["propertyValues"] == null
            ? []
            : List<HotelPropertyValue>.from(json["propertyValues"]!.map((x) => HotelPropertyValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "arrange": arrange,
        "category": category,
        "propertyValues": propertyValues == null ? [] : List<dynamic>.from(propertyValues!.map((x) => x.toJson())),
      };
}

class HotelPropertyValue {
  int? id;
  String? type;
  String? key;
  String? value;
  int? propertyId;

  HotelPropertyValue({
    this.id,
    this.type,
    this.key,
    this.value,
    this.propertyId,
  });

  factory HotelPropertyValue.fromJson(Map<String, dynamic> json) => HotelPropertyValue(
        id: json["id"],
        type: json["type"],
        key: json["key"],
        value: json["value"],
        propertyId: json["propertyId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "key": key,
        "value": value,
        "propertyId": propertyId,
      };
}
