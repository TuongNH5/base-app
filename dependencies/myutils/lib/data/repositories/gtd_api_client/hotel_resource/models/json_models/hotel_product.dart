import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_location_address.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_all_rates_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_result_rs.dart';

class HotelProduct {
  String? productId;
  String? searchId;
  String? tripId;
  String? propertyId;
  String? propertyName;
  String? supplier;
  String? currency;
  String? language;
  HotelLocationAddress? address;
  PropertyCategory? propertyCategory;
  double? latitude;
  double? longitude;
  int? rank;
  CombineRating? rating;
  GtdHotelTime? checkin;
  GtdHotelTime? checkout;
  List<dynamic>? fees;
  List<Amenity>? inclusions;
  List<Amenity>? policies;
  List<Amenity>? descriptions;
  List<Amenity>? themes;
  List<Amenity>? statistics;
  List<Amenity>? amenities;
  List<Image>? images;
  List<GtdHotelRoom>? rooms;
  String? customerIp;
  HotelContact? hotelContact;
  List<Amenity>? mealPlans;
  //None parse JSON
  DateTime? checkinDate;
  DateTime? checkoutDate;
  RatePlan? ratePlan;

  HotelProduct({
    this.productId,
    this.searchId,
    this.tripId,
    this.propertyId,
    this.propertyName,
    this.supplier,
    this.currency,
    this.language,
    this.address,
    this.propertyCategory,
    this.latitude,
    this.longitude,
    this.rank,
    this.rating,
    this.checkin,
    this.checkout,
    this.fees,
    this.inclusions,
    this.policies,
    this.descriptions,
    this.themes,
    this.statistics,
    this.amenities,
    this.images,
    this.rooms,
    this.customerIp,
    this.hotelContact,
    this.mealPlans,
    this.ratePlan,
  });

  factory HotelProduct.fromJson(Map<String, dynamic> json) => HotelProduct(
        productId: json["productId"],
        searchId: json["searchId"],
        tripId: json["tripId"],
        propertyId: json["propertyId"],
        propertyName: json["propertyName"],
        supplier: json["supplier"],
        currency: json["currency"],
        language: json["language"],
        address: json["address"] == null ? null : HotelLocationAddress.fromJson(json["address"]),
        propertyCategory: json["propertyCategory"] == null ? null : PropertyCategory.fromJson(json["propertyCategory"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        rank: json["rank"],
        rating: json["rating"] == null ? null : CombineRating.fromJson(json["rating"]),
        checkin: json["checkin"] == null ? null : GtdHotelTime.fromJson(json["checkin"]),
        checkout: json["checkout"] == null ? null : GtdHotelTime.fromJson(json["checkout"]),
        fees: json["fees"] == null ? [] : List<dynamic>.from(json["fees"]!.map((x) => x)),
        inclusions:
            json["inclusions"] == null ? [] : List<Amenity>.from(json["inclusions"]!.map((x) => Amenity.fromJson(x))),
        policies: json["policies"] == null ? [] : List<Amenity>.from(json["policies"]!.map((x) => Amenity.fromJson(x))),
        descriptions: json["descriptions"] == null
            ? []
            : List<Amenity>.from(json["descriptions"]!.map((x) => Amenity.fromJson(x))),
        themes: json["themes"] == null ? [] : List<Amenity>.from(json["themes"]!.map((x) => Amenity.fromJson(x))),
        statistics:
            json["statistics"] == null ? [] : List<Amenity>.from(json["statistics"]!.map((x) => Amenity.fromJson(x))),
        amenities:
            json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        rooms:
            json["rooms"] == null ? [] : List<GtdHotelRoom>.from(json["rooms"]!.map((x) => GtdHotelRoom.fromJson(x))),
        customerIp: json["customerIp"],
        hotelContact: json["hotelContact"] == null ? null : HotelContact.fromJson(json["hotelContact"]),
        mealPlans:
            json["mealPlans"] == null ? [] : List<Amenity>.from(json["mealPlans"]!.map((x) => Amenity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "searchId": searchId,
        "tripId": tripId,
        "propertyId": propertyId,
        "propertyName": propertyName,
        "supplier": supplier,
        "currency": currency,
        "language": language,
        "address": address?.toJson(),
        "propertyCategory": propertyCategory?.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "rank": rank,
        "rating": rating?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
        "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x)),
        "inclusions": inclusions == null ? [] : List<dynamic>.from(inclusions!.map((x) => x)),
        "policies": policies == null ? [] : List<dynamic>.from(policies!.map((x) => x)),
        "descriptions": descriptions == null ? [] : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "themes": themes == null ? [] : List<dynamic>.from(themes!.map((x) => x.toJson())),
        "statistics": statistics == null ? [] : List<dynamic>.from(statistics!.map((x) => x.toJson())),
        "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "customerIp": customerIp,
        "hotelContact": hotelContact?.toJson(),
        "mealPlans": mealPlans == null ? [] : List<dynamic>.from(mealPlans!.map((x) => x.toJson())),
      };
}

class HotelContact {
  String? phone;
  String? email;
  String? fax;

  HotelContact({
    this.phone,
    this.email,
    this.fax,
  });

  factory HotelContact.fromJson(Map<String, dynamic> json) => HotelContact(
        phone: json["phone"],
        email: json["email"],
        fax: json["fax"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "fax": fax,
      };
}
