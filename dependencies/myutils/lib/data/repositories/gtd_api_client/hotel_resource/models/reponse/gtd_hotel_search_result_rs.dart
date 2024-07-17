import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_error_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_info_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_location_address.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_page.dart';

class GtdHotelSearchResultRs extends GtdResponse {
  GtdHotelSearchResult? result;

  GtdHotelSearchResultRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelSearchResultRs.fromJson(Map<String, dynamic> json) => GtdHotelSearchResultRs(
        result: json["result"] == null ? null : GtdHotelSearchResult.fromJson(json["result"]),
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

class GtdHotelSearchResult {
  String? searchId;
  List<PropertyAvailable>? propertyAvailable;
  HotelPage? pageResult;

  GtdHotelSearchResult({
    this.searchId,
    this.propertyAvailable,
    this.pageResult,
  });

  factory GtdHotelSearchResult.fromJson(Map<String, dynamic> json) => GtdHotelSearchResult(
        searchId: json["searchId"],
        propertyAvailable: json["propertyAvailable"] == null
            ? []
            : List<PropertyAvailable>.from(json["propertyAvailable"]!.map((x) => PropertyAvailable.fromJson(x))),
        pageResult: json["pageResult"] == null ? null : HotelPage.fromJson(json["pageResult"]),
      );

  Map<String, dynamic> toJson() => {
        "searchId": searchId,
        "propertyAvailable":
            propertyAvailable == null ? [] : List<dynamic>.from(propertyAvailable!.map((x) => x.toJson())),
        "pageResult": pageResult?.toJson(),
      };
}

class PropertyAvailable {
  String? propertyId;
  String? propertyName;
  String? stars;
  HotelLocationAddress? address;
  double? latitude;
  double? longitude;
  PropertyCategory? propertyCategory;
  List<Image>? images;
  List<Amenity>? amenities;
  String? supplier;
  String? language;
  String? currency;
  bool? breakfastIncluded;
  bool? cancelFree;
  num? totalPrice;
  num? basePrice;
  num? taxAndServiceFree;
  num? basePriceBeforePromo;
  num? additionPrice;
  String? reviewCount;
  String? reviewScore;
  String? reviewRecommendPercent;
  TripAdvisor? tripAdvisor;
  int? totalRooms;
  List<String>? tags;
  String? rateOption;
  int? masterPropertyId;
  String? distanceToCenter;
  List<dynamic>? inclusionTags;
  bool? promo;
  bool? refundable;
  String? availableType;

  PropertyAvailable({
    this.propertyId,
    this.propertyName,
    this.stars,
    this.address,
    this.latitude,
    this.longitude,
    this.propertyCategory,
    this.images,
    this.amenities,
    this.supplier,
    this.language,
    this.currency,
    this.breakfastIncluded,
    this.cancelFree,
    this.totalPrice,
    this.basePrice,
    this.taxAndServiceFree,
    this.basePriceBeforePromo,
    this.additionPrice,
    this.reviewCount,
    this.reviewScore,
    this.reviewRecommendPercent,
    this.tripAdvisor,
    this.totalRooms,
    this.tags,
    this.rateOption,
    this.masterPropertyId,
    this.distanceToCenter,
    this.inclusionTags,
    this.promo,
    this.refundable,
    this.availableType, /// 'SOLD_OUT/'AVAILABLE'
  });

  factory PropertyAvailable.fromJson(Map<String, dynamic> json) => PropertyAvailable(
        propertyId: json["propertyId"],
        propertyName: json["propertyName"],
        stars: json["stars"],
        address: json["address"] == null ? null : HotelLocationAddress.fromJson(json["address"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        propertyCategory: json["propertyCategory"] == null ? null : PropertyCategory.fromJson(json["propertyCategory"]),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        amenities:
            json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
        supplier: json["supplier"],
        language: json["language"],
        currency: json["currency"],
        breakfastIncluded: json["breakfastIncluded"],
        cancelFree: json["cancelFree"],
        totalPrice: json["totalPrice"],
        basePrice: json["basePrice"],
        taxAndServiceFree: json["taxAndServiceFree"],
        basePriceBeforePromo: json["basePriceBeforePromo"],
        additionPrice: json["additionPrice"],
        reviewCount: json["reviewCount"],
        reviewScore: json["reviewScore"],
        reviewRecommendPercent: json["reviewRecommendPercent"],
        tripAdvisor: json["tripAdvisor"] == null ? null : TripAdvisor.fromJson(json["tripAdvisor"]),
        totalRooms: json["totalRooms"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        rateOption: json["rateOption"],
        masterPropertyId: json["masterPropertyId"],
        distanceToCenter: json["distanceToCenter"],
        inclusionTags: json["inclusionTags"] == null ? [] : List<dynamic>.from(json["inclusionTags"]!.map((x) => x)),
        promo: json["promo"],
        refundable: json["refundable"],
        availableType: json["availableType"],
      );

  Map<String, dynamic> toJson() => {
        "propertyId": propertyId,
        "propertyName": propertyName,
        "stars": stars,
        "address": address?.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "propertyCategory": propertyCategory?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        "supplier": supplier,
        "language": language,
        "currency": currency,
        "breakfastIncluded": breakfastIncluded,
        "cancelFree": cancelFree,
        "totalPrice": totalPrice,
        "basePrice": basePrice,
        "taxAndServiceFree": taxAndServiceFree,
        "basePriceBeforePromo": basePriceBeforePromo,
        "additionPrice": additionPrice,
        "reviewCount": reviewCount,
        "reviewScore": reviewScore,
        "reviewRecommendPercent": reviewRecommendPercent,
        "tripAdvisor": tripAdvisor?.toJson(),
        "totalRooms": totalRooms,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "rateOption": rateOption,
        "masterPropertyId": masterPropertyId,
        "distanceToCenter": distanceToCenter,
        "inclusionTags": inclusionTags == null ? [] : List<dynamic>.from(inclusionTags!.map((x) => x)),
        "promo": promo,
        "refundable": refundable,
        "availableType":availableType,
      };
}

class Amenity {
  String? id;
  String? name;
  String? value;
  String? group;
  String? symbol;

  Amenity({
    this.id,
    this.name,
    this.value,
    this.group,
    this.symbol,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        group: json["group"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "group": group,
        "symbol": symbol,
      };
}

class Image {
  String? caption;
  int? position;
  String? link;

  Image({
    this.caption,
    this.position,
    this.link,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        caption: json["caption"],
        position: json["position"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "position": position,
        "link": link,
      };
}

class PropertyCategory {
  String? id;
  String? name;

  PropertyCategory({
    this.id,
    this.name,
  });

  factory PropertyCategory.fromJson(Map<String, dynamic> json) => PropertyCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class TripAdvisor {
  String? rating;
  String? count;
  String? image;

  TripAdvisor({
    this.rating,
    this.count,
    this.image,
  });

  factory TripAdvisor.fromJson(Map<String, dynamic> json) => TripAdvisor(
        rating: json["rating"],
        count: json["count"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "count": count,
        "image": image,
      };
}
