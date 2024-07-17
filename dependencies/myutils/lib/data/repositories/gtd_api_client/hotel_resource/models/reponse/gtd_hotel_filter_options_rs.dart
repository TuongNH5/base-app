import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdHotelFilterOptionRs extends GtdResponse {
  GtdHotelFilterOptionJsonModel? result;

  GtdHotelFilterOptionRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelFilterOptionRs.fromJson(Map<String, dynamic> json) => GtdHotelFilterOptionRs(
        result: json["result"] == null ? null : GtdHotelFilterOptionJsonModel.fromJson(json["result"]),
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

class GtdHotelFilterOptionJsonModel {
  String? language;
  List<RangeOptionJsonModel>? prices;
  List<Rating>? guestRatings;
  List<Rating>? propertyRatings;
  List<BedType>? propertyAmenities;
  List<BedType>? propertyCategories;
  List<BedType>? roomAmenities;
  List<BedType>? roomViews;
  List<dynamic>? themes;
  List<dynamic>? mealPlans;
  List<BedType>? bedTypes;
  List<RangeOptionJsonModel>? propertyDistance;
  List<BedType>? rateAmenities;
  List<OfferOption>? offerOptions;

  GtdHotelFilterOptionJsonModel({
    this.language,
    this.prices,
    this.guestRatings,
    this.propertyRatings,
    this.propertyAmenities,
    this.propertyCategories,
    this.roomAmenities,
    this.roomViews,
    this.themes,
    this.mealPlans,
    this.bedTypes,
    this.propertyDistance,
    this.rateAmenities,
    this.offerOptions,
  });

  factory GtdHotelFilterOptionJsonModel.fromJson(Map<String, dynamic> json) => GtdHotelFilterOptionJsonModel(
        language: json["language"],
        prices: json["prices"] == null ? [] : List<RangeOptionJsonModel>.from(json["prices"]!.map((x) => RangeOptionJsonModel.fromJson(x))),
        guestRatings:
            json["guestRatings"] == null ? [] : List<Rating>.from(json["guestRatings"]!.map((x) => Rating.fromJson(x))),
        propertyRatings: json["propertyRatings"] == null
            ? []
            : List<Rating>.from(json["propertyRatings"]!.map((x) => Rating.fromJson(x))),
        propertyAmenities: json["propertyAmenities"] == null
            ? []
            : List<BedType>.from(json["propertyAmenities"]!.map((x) => BedType.fromJson(x))),
        propertyCategories: json["propertyCategories"] == null
            ? []
            : List<BedType>.from(json["propertyCategories"]!.map((x) => BedType.fromJson(x))),
        roomAmenities: json["roomAmenities"] == null
            ? []
            : List<BedType>.from(json["roomAmenities"]!.map((x) => BedType.fromJson(x))),
        roomViews:
            json["roomViews"] == null ? [] : List<BedType>.from(json["roomViews"]!.map((x) => BedType.fromJson(x))),
        themes: json["themes"] == null ? [] : List<dynamic>.from(json["themes"]!.map((x) => x)),
        mealPlans: json["mealPlans"] == null ? [] : List<dynamic>.from(json["mealPlans"]!.map((x) => x)),
        bedTypes: json["bedTypes"] == null ? [] : List<BedType>.from(json["bedTypes"]!.map((x) => BedType.fromJson(x))),
        propertyDistance: json["propertyDistance"] == null
            ? []
            : List<RangeOptionJsonModel>.from(json["propertyDistance"]!.map((x) => RangeOptionJsonModel.fromJson(x))),
        rateAmenities: json["rateAmenities"] == null
            ? []
            : List<BedType>.from(json["rateAmenities"]!.map((x) => BedType.fromJson(x))),
        offerOptions: json["offerOptions"] == null
            ? []
            : List<OfferOption>.from(json["offerOptions"]!.map((x) => OfferOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "prices": prices == null ? [] : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "guestRatings": guestRatings == null ? [] : List<dynamic>.from(guestRatings!.map((x) => x.toJson())),
        "propertyRatings": propertyRatings == null ? [] : List<dynamic>.from(propertyRatings!.map((x) => x.toJson())),
        "propertyAmenities":
            propertyAmenities == null ? [] : List<dynamic>.from(propertyAmenities!.map((x) => x.toJson())),
        "propertyCategories":
            propertyCategories == null ? [] : List<dynamic>.from(propertyCategories!.map((x) => x.toJson())),
        "roomAmenities": roomAmenities == null ? [] : List<dynamic>.from(roomAmenities!.map((x) => x.toJson())),
        "roomViews": roomViews == null ? [] : List<dynamic>.from(roomViews!.map((x) => x.toJson())),
        "themes": themes == null ? [] : List<dynamic>.from(themes!.map((x) => x)),
        "mealPlans": mealPlans == null ? [] : List<dynamic>.from(mealPlans!.map((x) => x)),
        "bedTypes": bedTypes == null ? [] : List<dynamic>.from(bedTypes!.map((x) => x.toJson())),
        "propertyDistance":
            propertyDistance == null ? [] : List<dynamic>.from(propertyDistance!.map((x) => x.toJson())),
        "rateAmenities": rateAmenities == null ? [] : List<dynamic>.from(rateAmenities!.map((x) => x.toJson())),
        "offerOptions": offerOptions == null ? [] : List<dynamic>.from(offerOptions!.map((x) => x.toJson())),
      };
}

class BedType {
  String? name;
  String? value;

  BedType({
    this.name,
    this.value,
  });

  factory BedType.fromJson(Map<String, dynamic> json) => BedType(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Rating {
  String? name;
  double? value;

  Rating({
    this.name,
    this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        name: json["name"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class OfferOption {
  String? name;
  bool? value;

  OfferOption({
    this.name,
    this.value,
  });

  factory OfferOption.fromJson(Map<String, dynamic> json) => OfferOption(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class RangeOptionJsonModel {
  double? from;
  double? to;
  String? priceOperator;

  RangeOptionJsonModel({
    this.from,
    this.to,
    this.priceOperator,
  });

  factory RangeOptionJsonModel.fromJson(Map<String, dynamic> json) => RangeOptionJsonModel(
        from: json["from"]?.toDouble(),
        to: json["to"]?.toDouble(),
        priceOperator: json["operator"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "operator": priceOperator,
      };
}
