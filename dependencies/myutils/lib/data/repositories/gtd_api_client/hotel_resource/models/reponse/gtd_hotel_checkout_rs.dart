import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_error_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_info_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_product.dart';

class GtdHotelCheckoutRs extends GtdResponse {
  GtdHotelCheckout? result;

  GtdHotelCheckoutRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelCheckoutRs.fromJson(Map<String, dynamic> json) => GtdHotelCheckoutRs(
        result: json["result"] == null ? null : GtdHotelCheckout.fromJson(json["result"]),
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

class GtdHotelCheckout {
  HotelProduct? hotelProduct;
  String? status;

  GtdHotelCheckout({
    this.hotelProduct,
    this.status,
  });

  factory GtdHotelCheckout.fromJson(Map<String, dynamic> json) => GtdHotelCheckout(
        hotelProduct: json["hotelProduct"] == null ? null : HotelProduct.fromJson(json["hotelProduct"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "hotelProduct": hotelProduct?.toJson(),
        "status": status,
      };
}

// class HotelProduct {
//   HotelLocationAddress? address;
//   List<Amenity>? amenities;
//   GtdHotelTime? checkin;
//   GtdHotelTime? checkout;
//   String? currency;
//   String? customerIp;
//   List<Amenity>? descriptions;
//   List<dynamic>? fees;
//   List<Image>? images;
//   List<Amenity>? inclusions;
//   String? language;
//   double? latitude;
//   double? longitude;
//   List<Amenity>? policies;
//   String? productId;
//   PropertyCategory? propertyCategory;
//   String? propertyId;
//   String? propertyName;
//   int? rank;
//   Rating? rating;
//   List<GtdHotelRoom>? rooms;
//   String? searchId;
//   List<Amenity>? statistics;
//   String? supplier;
//   List<Amenity>? themes;
//   String? tripId;

//   HotelProduct({
//     this.address,
//     this.amenities,
//     this.checkin,
//     this.checkout,
//     this.currency,
//     this.customerIp,
//     this.descriptions,
//     this.fees,
//     this.images,
//     this.inclusions,
//     this.language,
//     this.latitude,
//     this.longitude,
//     this.policies,
//     this.productId,
//     this.propertyCategory,
//     this.propertyId,
//     this.propertyName,
//     this.rank,
//     this.rating,
//     this.rooms,
//     this.searchId,
//     this.statistics,
//     this.supplier,
//     this.themes,
//     this.tripId,
//   });

//   factory HotelProduct.fromJson(Map<String, dynamic> json) => HotelProduct(
//         address: json["address"] == null ? null : HotelLocationAddress.fromJson(json["address"]),
//         amenities:
//             json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
//         checkin: json["checkin"] == null ? null : GtdHotelTime.fromJson(json["checkin"]),
//         checkout: json["checkout"] == null ? null : GtdHotelTime.fromJson(json["checkout"]),
//         currency: json["currency"],
//         customerIp: json["customerIp"],
//         descriptions: json["descriptions"] == null
//             ? []
//             : List<Amenity>.from(json["descriptions"]!.map((x) => Amenity.fromJson(x))),
//         fees: json["fees"] == null ? [] : List<dynamic>.from(json["fees"]!.map((x) => x)),
//         images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
//         inclusions: json["inclusions"] == null ? [] : List<Amenity>.from(json["inclusions"]!.map((x) => x)),
//         language: json["language"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         policies: json["policies"] == null ? [] : List<Amenity>.from(json["policies"]!.map((x) => Amenity.fromJson(x))),
//         productId: json["productId"],
//         propertyCategory: json["propertyCategory"] == null ? null : PropertyCategory.fromJson(json["propertyCategory"]),
//         propertyId: json["propertyId"],
//         propertyName: json["propertyName"],
//         rank: json["rank"],
//         rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//         rooms: json["rooms"] == null ? [] : List<GtdHotelRoom>.from(json["rooms"]!.map((x) => GtdHotelRoom.fromJson(x))),
//         searchId: json["searchId"],
//         statistics:
//             json["statistics"] == null ? [] : List<Amenity>.from(json["statistics"]!.map((x) => Amenity.fromJson(x))),
//         supplier: json["supplier"],
//         themes: json["themes"] == null ? [] : List<Amenity>.from(json["themes"]!.map((x) => Amenity.fromJson(x))),
//         tripId: json["tripId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "address": address?.toJson(),
//         "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
//         "checkin": checkin?.toJson(),
//         "checkout": checkout?.toJson(),
//         "currency": currency,
//         "customerIp": customerIp,
//         "descriptions": descriptions == null ? [] : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
//         "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x)),
//         "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
//         "inclusions": inclusions == null ? [] : List<dynamic>.from(inclusions!.map((x) => x)),
//         "language": language,
//         "latitude": latitude,
//         "longitude": longitude,
//         "policies": policies == null ? [] : List<dynamic>.from(policies!.map((x) => x.toJson())),
//         "productId": productId,
//         "propertyCategory": propertyCategory?.toJson(),
//         "propertyId": propertyId,
//         "propertyName": propertyName,
//         "rank": rank,
//         "rating": rating?.toJson(),
//         "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
//         "searchId": searchId,
//         "statistics": statistics == null ? [] : List<dynamic>.from(statistics!.map((x) => x.toJson())),
//         "supplier": supplier,
//         "themes": themes == null ? [] : List<dynamic>.from(themes!.map((x) => x.toJson())),
//         "tripId": tripId,
//       };
// }







