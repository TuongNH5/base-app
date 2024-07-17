import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_location_address.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_page.dart';


class GtdHotelLocationSearchRs extends GtdResponse {
  HotelLocationContentRs? result;
  GtdHotelLocationSearchRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelLocationSearchRs.fromJson(Map<String, dynamic> json) => GtdHotelLocationSearchRs(
        result: json["result"] == null ? null : HotelLocationContentRs.fromJson(json["result"]),
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

class HotelLocationContentRs {
  HotelPage? page;
  List<HotelLocationSearchContentRs>? contents;

  HotelLocationContentRs({
    this.page,
    this.contents,
  });

  factory HotelLocationContentRs.fromJson(Map<String, dynamic> json) => HotelLocationContentRs(
        page: json["page"] == null ? null : HotelPage.fromJson(json["page"]),
        contents: json["contents"] == null
            ? []
            : List<HotelLocationSearchContentRs>.from(
                json["contents"]!.map((x) => HotelLocationSearchContentRs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page?.toJson(),
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
      };
}

class HotelLocationSearchContentRs {
  String? name;
  String? searchCode;
  String? searchType;
  String? supplier;
  HotelLocationAddress? address;
  int? propertyCount;
  List<String>? tags;

  HotelLocationSearchContentRs({
    this.name,
    this.searchCode,
    this.searchType,
    this.supplier,
    this.address,
    this.propertyCount,
    this.tags,
  });

  factory HotelLocationSearchContentRs.fromJson(Map<String, dynamic> json) => HotelLocationSearchContentRs(
        name: json["name"],
        searchCode: json["searchCode"],
        searchType: json["searchType"],
        supplier: json["supplier"],
        address: json["address"] == null ? null : HotelLocationAddress.fromJson(json["address"]),
        propertyCount: json["propertyCount"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "searchCode": searchCode,
        "searchType": searchType,
        "supplier": supplier,
        "address": address?.toJson(),
        "propertyCount": propertyCount,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}


