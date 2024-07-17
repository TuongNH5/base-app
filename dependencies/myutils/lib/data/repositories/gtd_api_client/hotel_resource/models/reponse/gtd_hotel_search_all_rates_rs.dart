// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_location_address.dart';

import 'gtd_hotel_search_result_rs.dart';

class GtdSearchAllRatesRs extends GtdResponse {
  GtdSearchAllRateDetail? result;

  GtdSearchAllRatesRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdSearchAllRatesRs.fromJson(Map<String, dynamic> json) =>
      GtdSearchAllRatesRs(
        result: json["result"] == null
            ? null
            : GtdSearchAllRateDetail.fromJson(json["result"]),
        duration: json["duration"],
        textMessage: json["textMessage"],
        success: json["success"],
        errors: json["errors"] == null
            ? null
            : List<ErrorRs>.from(
                json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null
            ? null
            : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
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

class GtdSearchAllRateDetail {
  String? tripId;
  String? searchId;
  HotelPropertyAllRate? propertyAllRate;

  GtdSearchAllRateDetail({
    this.tripId,
    this.searchId,
    this.propertyAllRate,
  });

  factory GtdSearchAllRateDetail.fromJson(Map<String, dynamic> json) =>
      GtdSearchAllRateDetail(
        tripId: json["tripId"],
        searchId: json["searchId"],
        propertyAllRate: json["propertyAllRate"] == null
            ? null
            : HotelPropertyAllRate.fromJson(json["propertyAllRate"]),
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "searchId": searchId,
        "propertyAllRate": propertyAllRate?.toJson(),
      };
}

class HotelPropertyAllRate {
  String? propertyId;
  String? propertyName;
  String? supplier;
  String? language;
  String? currency;
  CombineRating? rating;
  HotelLocationAddress? address;
  double? latitude;
  double? longitude;
  PropertyCategory? propertyCategory;
  GtdHotelTime? checkin;
  GtdHotelTime? checkout;
  int? rank;
  List<dynamic>? fees;
  List<Amenity>? inclusions;
  List<Amenity>? policies;
  List<Amenity>? descriptions;
  List<Amenity>? themes;
  List<Amenity>? statistics;
  List<Amenity>? amenities;
  List<Image>? images;
  List<GtdHotelRoom>? rooms;
  List<dynamic>? attributes;
  List<dynamic>? spokenLanguage;
  String? airportCode;
  List<String>? tags;
  String? rateOption;
  int? masterPropertyId;

  HotelPropertyAllRate({
    this.propertyId,
    this.propertyName,
    this.supplier,
    this.language,
    this.currency,
    this.rating,
    this.address,
    this.latitude,
    this.longitude,
    this.propertyCategory,
    this.checkin,
    this.checkout,
    this.rank,
    this.fees,
    this.inclusions,
    this.policies,
    this.descriptions,
    this.themes,
    this.statistics,
    this.amenities,
    this.images,
    this.rooms,
    this.attributes,
    this.spokenLanguage,
    this.airportCode,
    this.tags,
    this.rateOption,
    this.masterPropertyId,
  });

  factory HotelPropertyAllRate.fromJson(Map<String, dynamic> json) =>
      HotelPropertyAllRate(
        propertyId: json["propertyId"],
        propertyName: json["propertyName"],
        supplier: json["supplier"],
        language: json["language"],
        currency: json["currency"],
        rating: json["rating"] == null
            ? null
            : CombineRating.fromJson(json["rating"]),
        address: json["address"] == null
            ? null
            : HotelLocationAddress.fromJson(json["address"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        propertyCategory: json["propertyCategory"] == null
            ? null
            : PropertyCategory.fromJson(json["propertyCategory"]),
        checkin: json["checkin"] == null
            ? null
            : GtdHotelTime.fromJson(json["checkin"]),
        checkout: json["checkout"] == null
            ? null
            : GtdHotelTime.fromJson(json["checkout"]),
        rank: json["rank"],
        fees: json["fees"] == null
            ? []
            : List<dynamic>.from(json["fees"]!.map((x) => x)),
        inclusions: json["inclusions"] == null
            ? []
            : List<Amenity>.from(json["inclusions"]!.map((x) => x)),
        policies: json["policies"] == null
            ? []
            : List<Amenity>.from(
                json["policies"]!.map((x) => Amenity.fromJson(x))),
        descriptions: json["descriptions"] == null
            ? []
            : List<Amenity>.from(
                json["descriptions"]!.map((x) => Amenity.fromJson(x))),
        themes: json["themes"] == null
            ? []
            : List<Amenity>.from(
                json["themes"]!.map((x) => Amenity.fromJson(x))),
        statistics: json["statistics"] == null
            ? []
            : List<Amenity>.from(
                json["statistics"]!.map((x) => Amenity.fromJson(x))),
        amenities: json["amenities"] == null
            ? []
            : List<Amenity>.from(
                json["amenities"]!.map((x) => Amenity.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        rooms: json["rooms"] == null
            ? []
            : List<GtdHotelRoom>.from(
                json["rooms"]!.map((x) => GtdHotelRoom.fromJson(x))),
        attributes: json["attributes"] == null
            ? []
            : List<dynamic>.from(json["attributes"]!.map((x) => x)),
        spokenLanguage: json["spokenLanguage"] == null
            ? []
            : List<dynamic>.from(json["spokenLanguage"]!.map((x) => x)),
        airportCode: json["airportCode"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        rateOption: json["rateOption"],
        masterPropertyId: json["masterPropertyId"],
      );

  Map<String, dynamic> toJson() => {
        "propertyId": propertyId,
        "propertyName": propertyName,
        "supplier": supplier,
        "language": language,
        "currency": currency,
        "rating": rating?.toJson(),
        "address": address?.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "propertyCategory": propertyCategory?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
        "rank": rank,
        "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x)),
        "inclusions": inclusions == null
            ? []
            : List<dynamic>.from(inclusions!.map((x) => x)),
        "policies": policies == null
            ? []
            : List<dynamic>.from(policies!.map((x) => x.toJson())),
        "descriptions": descriptions == null
            ? []
            : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "themes": themes == null
            ? []
            : List<dynamic>.from(themes!.map((x) => x.toJson())),
        "statistics": statistics == null
            ? []
            : List<dynamic>.from(statistics!.map((x) => x.toJson())),
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
        "spokenLanguage": spokenLanguage == null
            ? []
            : List<dynamic>.from(spokenLanguage!.map((x) => x)),
        "airportCode": airportCode,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "rateOption": rateOption,
        "masterPropertyId": masterPropertyId,
      };
}

class GtdHotelTime {
  String? beginTime;
  String? endTime;

  GtdHotelTime({
    this.beginTime,
    this.endTime,
  });

  factory GtdHotelTime.fromJson(Map<String, dynamic> json) => GtdHotelTime(
        beginTime: json["beginTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "beginTime": beginTime,
        "endTime": endTime,
      };
}

class CombineRating {
  RatingProperty? ratingProperty;
  RatingGuest? ratingGuest;

  CombineRating({
    this.ratingProperty,
    this.ratingGuest,
  });

  factory CombineRating.fromJson(Map<String, dynamic> json) => CombineRating(
        ratingProperty: json["ratingProperty"] == null
            ? null
            : RatingProperty.fromJson(json["ratingProperty"]),
        ratingGuest: json["ratingGuest"] == null
            ? null
            : RatingGuest.fromJson(json["ratingGuest"]),
      );

  Map<String, dynamic> toJson() => {
        "ratingProperty": ratingProperty?.toJson(),
        "ratingGuest": ratingGuest?.toJson(),
      };
}

class RatingGuest {
  int? count;
  String? score;
  String? recommendationPercent;
  String? overall;
  String? cleanliness;
  String? service;
  String? comfort;
  String? condition;
  String? location;
  String? neighborhood;
  String? quality;
  String? value;
  String? amenities;

  RatingGuest({
    this.count,
    this.score,
    this.recommendationPercent,
    this.overall,
    this.cleanliness,
    this.service,
    this.comfort,
    this.condition,
    this.location,
    this.neighborhood,
    this.quality,
    this.value,
    this.amenities,
  });

  factory RatingGuest.fromJson(Map<String, dynamic> json) => RatingGuest(
        count: json["count"],
        score: json["score"],
        recommendationPercent: json["recommendationPercent"],
        overall: json["overall"],
        cleanliness: json["cleanliness"],
        service: json["service"],
        comfort: json["comfort"],
        condition: json["condition"],
        location: json["location"],
        neighborhood: json["neighborhood"],
        quality: json["quality"],
        value: json["value"],
        amenities: json["amenities"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "score": score,
        "recommendationPercent": recommendationPercent,
        "overall": overall,
        "cleanliness": cleanliness,
        "service": service,
        "comfort": comfort,
        "condition": condition,
        "location": location,
        "neighborhood": neighborhood,
        "quality": quality,
        "value": value,
        "amenities": amenities,
      };
}

class RatingProperty {
  String? rating;
  String? type;

  RatingProperty({
    this.rating,
    this.type,
  });

  factory RatingProperty.fromJson(Map<String, dynamic> json) => RatingProperty(
        rating: json["rating"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "type": type,
      };
}

class GtdHotelRoom {
  String? id;
  String? name;
  List<Amenity>? descriptions;
  List<Image>? images;
  RoomArea? roomArea;
  List<RatePlan>? ratePlans;
  List<Amenity>? bedGroupStatics;
  List<Amenity>? views;
  OccupancyAllowed? occupancyAllowed;
  List<Amenity>? amenities;

  GtdHotelRoom({
    this.id,
    this.name,
    this.descriptions,
    this.images,
    this.roomArea,
    this.ratePlans,
    this.bedGroupStatics,
    this.views,
    this.occupancyAllowed,
    this.amenities,
  });

  factory GtdHotelRoom.fromJson(Map<String, dynamic> json) => GtdHotelRoom(
        id: json["id"],
        name: json["name"],
        descriptions: json["descriptions"] == null
            ? []
            : List<Amenity>.from(
                json["descriptions"]!.map((x) => Amenity.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        roomArea: json["roomArea"] == null
            ? null
            : RoomArea.fromJson(json["roomArea"]),
        ratePlans: json["ratePlans"] == null
            ? []
            : List<RatePlan>.from(
                json["ratePlans"]!.map((x) => RatePlan.fromJson(x))),
        bedGroupStatics: json["bedGroupStatics"] == null
            ? []
            : List<Amenity>.from(
                json["bedGroupStatics"]!.map((x) => Amenity.fromJson(x))),
        views: json["views"] == null
            ? []
            : List<Amenity>.from(
                json["views"]!.map((x) => Amenity.fromJson(x))),
        occupancyAllowed: json["occupancyAllowed"] == null
            ? null
            : OccupancyAllowed.fromJson(json["occupancyAllowed"]),
        amenities: json["amenities"] == null
            ? []
            : List<Amenity>.from(
                json["amenities"]!.map((x) => Amenity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "descriptions": descriptions == null
            ? []
            : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "roomArea": roomArea?.toJson(),
        "ratePlans": ratePlans == null
            ? []
            : List<dynamic>.from(ratePlans!.map((x) => x.toJson())),
        "bedGroupStatics": bedGroupStatics == null
            ? []
            : List<dynamic>.from(bedGroupStatics!.map((x) => x.toJson())),
        "views": views == null ? [] : List<dynamic>.from(views!.map((x) => x)),
        "occupancyAllowed": occupancyAllowed?.toJson(),
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x.toJson())),
      };
}

class OccupancyAllowed {
  RoomMaxAllowed? roomMaxAllowed;
  List<dynamic>? roomAgeCategories;

  OccupancyAllowed({
    this.roomMaxAllowed,
    this.roomAgeCategories,
  });

  factory OccupancyAllowed.fromJson(Map<String, dynamic> json) =>
      OccupancyAllowed(
        roomMaxAllowed: json["roomMaxAllowed"] == null
            ? null
            : RoomMaxAllowed.fromJson(json["roomMaxAllowed"]),
        roomAgeCategories: json["roomAgeCategories"] == null
            ? []
            : List<dynamic>.from(json["roomAgeCategories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "roomMaxAllowed": roomMaxAllowed?.toJson(),
        "roomAgeCategories": roomAgeCategories == null
            ? []
            : List<dynamic>.from(roomAgeCategories!.map((x) => x)),
      };
}

class RoomMaxAllowed {
  int? total;
  int? children;
  int? adult;

  RoomMaxAllowed({
    this.total,
    this.children,
    this.adult,
  });

  factory RoomMaxAllowed.fromJson(Map<String, dynamic> json) => RoomMaxAllowed(
        total: json["total"],
        children: json["children"],
        adult: json["adult"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "children": children,
        "adult": adult,
      };
}

class RatePlan {
  String? ratePlanId;
  String? ratePlanName;
  int? totalRooms;
  bool? breakfastIncluded;
  bool? refundable;
  bool? cancelFree;
  num? basePrice;
  bool? promo;
  num? basePriceBeforePromo;
  List<Amenity>? amenities;
  List<GtdBedGroup>? bedGroups;
  List<GtdHotelCancelPenalty>? cancelPenalties;
  List<GtdHotelPaxPrice>? paxPrice;
  num? totalPrice;
  num? totalPriceByHotelCurrency;
  num? taxAndFees;
  num? additionPrice;
  dynamic fees;
  String? promoDescription;
  String? cancelFreeBeforeDate;
  List<Amenity>? meals;
  dynamic salesEnv;
  dynamic rateOption;
  dynamic adjustNetPrices;
  dynamic adjustSellPrices;
  bool? nonAllotment;

  RatePlan({
    this.ratePlanId,
    this.ratePlanName,
    this.totalRooms,
    this.breakfastIncluded,
    this.refundable,
    this.cancelFree,
    this.basePrice,
    this.promo,
    this.basePriceBeforePromo,
    this.amenities,
    this.bedGroups,
    this.cancelPenalties,
    this.paxPrice,
    this.totalPrice,
    this.totalPriceByHotelCurrency,
    this.taxAndFees,
    this.additionPrice,
    this.fees,
    this.promoDescription,
    this.cancelFreeBeforeDate,
    this.meals,
    this.salesEnv,
    this.rateOption,
    this.adjustNetPrices,
    this.adjustSellPrices,
    this.nonAllotment,
  });

  factory RatePlan.fromJson(Map<String, dynamic> json) => RatePlan(
        ratePlanId: json["ratePlanId"],
        ratePlanName: json["ratePlanName"],
        totalRooms: json["totalRooms"],
        breakfastIncluded: json["breakfastIncluded"],
        refundable: json["refundable"],
        cancelFree: json["cancelFree"],
        basePrice: json["basePrice"],
        promo: json["promo"],
        basePriceBeforePromo: json["basePriceBeforePromo"],
        amenities: json["amenities"] == null
            ? []
            : List<Amenity>.from(
                json["amenities"]!.map((x) => Amenity.fromJson(x))),
        bedGroups: json["bedGroups"] == null
            ? []
            : List<GtdBedGroup>.from(
                json["bedGroups"]!.map((x) => Amenity.fromJson(x))),
        cancelPenalties: json["cancelPenalties"] == null
            ? []
            : List<GtdHotelCancelPenalty>.from(json["cancelPenalties"]!
                .map((x) => GtdHotelCancelPenalty.fromJson(x))),
        paxPrice: json["paxPrice"] == null
            ? []
            : List<GtdHotelPaxPrice>.from(
                json["paxPrice"]!.map((x) => GtdHotelPaxPrice.fromJson(x))),
        totalPrice: json["totalPrice"],
        totalPriceByHotelCurrency: json["totalPriceByHotelCurrency"],
        taxAndFees: json["taxAndFees"],
        additionPrice: json["additionPrice"],
        fees: json["fees"],
        promoDescription: json["promoDescription"],
        cancelFreeBeforeDate: json["cancelFreeBeforeDate"],
        meals: json["meals"] == null
            ? []
            : List<Amenity>.from(
                json["meals"]!.map((x) => Amenity.fromJson(x))),
        salesEnv: json["salesEnv"],
        rateOption: json["rateOption"],
        adjustNetPrices: json["adjustNetPrices"],
        adjustSellPrices: json["adjustSellPrices"],
        nonAllotment: json["nonAllotment"],
      );

  Map<String, dynamic> toJson() => {
        "ratePlanId": ratePlanId,
        "ratePlanName": ratePlanName,
        "totalRooms": totalRooms,
        "breakfastIncluded": breakfastIncluded,
        "refundable": refundable,
        "cancelFree": cancelFree,
        "basePrice": basePrice,
        "promo": promo,
        "basePriceBeforePromo": basePriceBeforePromo,
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x)),
        "bedGroups": bedGroups == null
            ? []
            : List<dynamic>.from(bedGroups!.map((x) => x)),
        "cancelPenalties": cancelPenalties == null
            ? []
            : List<dynamic>.from(cancelPenalties!.map((x) => x)),
        "paxPrice": paxPrice == null
            ? []
            : List<dynamic>.from(paxPrice!.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "totalPriceByHotelCurrency": totalPriceByHotelCurrency,
        "taxAndFees": taxAndFees,
        "additionPrice": additionPrice,
        "fees": fees,
        "promoDescription": promoDescription,
        "cancelFreeBeforeDate": cancelFreeBeforeDate,
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) => x.toJson())),
        "salesEnv": salesEnv,
        "rateOption": rateOption,
        "adjustNetPrices": adjustNetPrices,
        "adjustSellPrices": adjustSellPrices,
        "nonAllotment": nonAllotment,
      };

  double discountPercent() {
    if (totalPrice == basePriceBeforePromo) return 0;
    if ((basePriceBeforePromo ?? 0) == 0) return 0;
    final discountAmount = (basePriceBeforePromo ?? 0) - (totalPrice ?? 0);
    return discountAmount / (basePriceBeforePromo ?? 1) * 100;
  }
}

class GtdBedGroup {
  String? bedGroupDescription;
  String? id;

  GtdBedGroup({
    this.bedGroupDescription,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': bedGroupDescription,
      'id': id,
    };
  }

  factory GtdBedGroup.fromJson(Map<String, dynamic> map) {
    return GtdBedGroup(
      bedGroupDescription:
          map['description'] != null ? map['description'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }
}

class GtdBedConfiguration {
  String? size;
  String? type;
  int? quantity;

  GtdBedConfiguration({
    this.size,
    this.type,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'size': size,
      'type': type,
      'quantity': quantity,
    };
  }

  factory GtdBedConfiguration.fromJson(Map<String, dynamic> map) {
    return GtdBedConfiguration(
      size: map['size'] != null ? map['size'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }
}

class GtdHotelCancelPenalty {
  String? startDate; // Format: 11/09/2023 17:00
  String? endDate;
  String? type; ///PERCENT/AMOUNT
  String? currency;
  String? percent;
  String? nights;
  String? amount;
  String? description;

  GtdHotelCancelPenalty({
    this.startDate,
    this.endDate,
    this.type,
    this.currency,
    this.percent,
    this.nights,
    this.amount,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'type': type,
      'currency': currency,
      'percent': percent,
      'nights': nights,
      'amount': amount,
      'description': description,
    };
  }

  factory GtdHotelCancelPenalty.fromJson(Map<String, dynamic> map) {
    return GtdHotelCancelPenalty(
      startDate: map['startDate'],
      endDate: map['endDate'],
      type: map['type'] != null ? map['type'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      percent: map['percent'] != null ? map['percent'] as String : null,
      nights: map['nights'] != null ? map['nights'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }
}

class Fees {
  Fees();

  factory Fees.fromJson(Map<String, dynamic> json) => Fees();

  Map<String, dynamic> toJson() => {};
}

class GtdHotelPaxPrice {
  GtdHotelPaxInfo? paxInfo;
  List<NightPrice>? nightPrices;

  GtdHotelPaxPrice({
    this.paxInfo,
    this.nightPrices,
  });

  factory GtdHotelPaxPrice.fromJson(Map<String, dynamic> json) =>
      GtdHotelPaxPrice(
        paxInfo: json["paxInfo"] == null
            ? null
            : GtdHotelPaxInfo.fromJson(json["paxInfo"]),
        nightPrices: json["nightPrices"] == null
            ? []
            : List<NightPrice>.from(
                json["nightPrices"]!.map((x) => NightPrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paxInfo": paxInfo?.toJson(),
        "nightPrices": nightPrices == null
            ? []
            : List<dynamic>.from(nightPrices!.map((x) => x.toJson())),
      };
}

class NightPrice {
  String? nightKey;
  List<NightPriceDetail>? nightPriceDetails;

  NightPrice({
    this.nightKey,
    this.nightPriceDetails,
  });

  factory NightPrice.fromJson(Map<String, dynamic> json) => NightPrice(
        nightKey: json["nightKey"],
        nightPriceDetails: json["nightPriceDetails"] == null
            ? []
            : List<NightPriceDetail>.from(json["nightPriceDetails"]!
                .map((x) => NightPriceDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nightKey": nightKey,
        "nightPriceDetails": nightPriceDetails == null
            ? []
            : List<dynamic>.from(nightPriceDetails!.map((x) => x.toJson())),
      };
}

class NightPriceDetail {
  String? name;
  double? value;
  String? valueByHotelCurrency;
  dynamic adjustNetValues;
  dynamic adjustSellValues;

  NightPriceDetail({
    this.name,
    this.value,
    this.valueByHotelCurrency,
    this.adjustNetValues,
    this.adjustSellValues,
  });

  factory NightPriceDetail.fromJson(Map<String, dynamic> json) =>
      NightPriceDetail(
        name: json["name"],
        value: json["value"],
        valueByHotelCurrency: json["valueByHotelCurrency"],
        adjustNetValues: json["adjustNetValues"],
        adjustSellValues: json["adjustSellValues"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "valueByHotelCurrency": valueByHotelCurrency,
        "adjustNetValues": adjustNetValues,
        "adjustSellValues": adjustSellValues,
      };
}

class GtdHotelPaxInfo {
  int? adultQuantity;
  int? childQuantity;
  int? infantQuantity;
  List<dynamic>? childAges;

  GtdHotelPaxInfo({
    this.adultQuantity,
    this.childQuantity,
    this.infantQuantity,
    this.childAges,
  });

  factory GtdHotelPaxInfo.fromJson(Map<String, dynamic> json) =>
      GtdHotelPaxInfo(
        adultQuantity: json["adultQuantity"],
        childQuantity: json["childQuantity"],
        infantQuantity: json["infantQuantity"],
        childAges: json["childAges"] == null
            ? []
            : List<dynamic>.from(json["childAges"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adultQuantity": adultQuantity,
        "childQuantity": childQuantity,
        "infantQuantity": infantQuantity,
        "childAges": childAges == null
            ? []
            : List<dynamic>.from(childAges!.map((x) => x)),
      };

  int get totalGuest {
    return (adultQuantity ?? 0) + (childQuantity ?? 0) + (infantQuantity ?? 0);
  }
}

class RoomArea {
  int? squareMeters;
  int? squareFeet;

  RoomArea({
    this.squareMeters,
    this.squareFeet,
  });

  factory RoomArea.fromJson(Map<String, dynamic> json) => RoomArea(
        squareMeters: json["squareMeters"],
        squareFeet: json["squareFeet"],
      );

  Map<String, dynamic> toJson() => {
        "squareMeters": squareMeters,
        "squareFeet": squareFeet,
      };
}
