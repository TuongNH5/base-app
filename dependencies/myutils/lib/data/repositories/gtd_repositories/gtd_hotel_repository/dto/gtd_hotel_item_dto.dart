import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_location_address.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_all_rates_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_result_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_hotel_repository/models/gt_hotel_room_detail_dto.dart';


class GtdHotelItemDTO {
  String propertyId = "";
  int? masterPropertyId;
  String hotelName = "Ocean Star Hotel Vũng Tàu";
  double rating = 0;
  String guestRating = "";
  HotelLocationAddress? address;
  String language = "";
  String currency = "";
  double? latitude;
  double? longitude;
  String checkin = "";
  String checkout = "";
  String hotelType = "Khách sạn";
  List<String> hotelUrlImgs = [];
  List<Amenity> amenities = [];
  List<Amenity> descriptions = [];
  List<Amenity> policies = [];
  List<Amenity> inclusions = [];
  List<Amenity> statistics = [];
  List<Amenity> themes = [];
  List<String> additionAmenities = ["Bao gồm bữa sáng", "Huỷ miễn phí"];
  String supplier = "";
  List<String> tags = [];
  List<dynamic> inclusionTags = [];
  TripAdvisor? tripAdvisor;
  String? rateOption; //TA or OTA
  List<GtdHotelRoomDetailDTO> rooms = [];
  bool hasPromo = false;
  int totalRooms = 0;
  double? totalPrice;
  double? basePrice;
  double? taxServiceFee;
  double? basePriceBeforePromo;
  double? additionPrice;
  String? availableType;

  GtdHotelItemDTO();

  factory GtdHotelItemDTO.fromHotelPropertyAvailable(PropertyAvailable property) {
    List<String> additionAmenitiesTemp = [];
    if (property.breakfastIncluded == true) {
      additionAmenitiesTemp.add("hotel.includesBreakfast".tr());
    }
    if (property.cancelFree == true) {
      additionAmenitiesTemp.add("hotel.freeCancellation".tr());
    } else if (property.cancelFree == false && property.refundable == true) {
      additionAmenitiesTemp.add("hotel.cancelPenalties.policies".tr());
    }
    GtdHotelItemDTO hotelItemDTO = GtdHotelItemDTO()
      ..propertyId = property.propertyId ?? ""
      ..masterPropertyId = property.masterPropertyId
      ..hotelName = property.propertyName ?? ""
      ..rating = double.tryParse(property.stars ?? "0")?.toDouble() ?? 0
      ..address = property.address
      ..language = property.language ?? "vi"
      ..currency = property.currency ?? "VND"
      ..latitude = property.latitude
      ..longitude = property.longitude
      ..hotelType = property.propertyCategory?.name ?? ""
      ..hotelUrlImgs = (property.images ?? [])
          .sorted((a, b) => (a.position ?? 0).compareTo(b.position ?? 0))
          .map((e) => e.link)
          .whereType<String>()
          .toList()
      ..amenities = (property.amenities ?? [])
      ..supplier = property.supplier ?? ""
      ..additionAmenities = additionAmenitiesTemp
      ..tags = property.tags ?? []
      ..inclusionTags = property.inclusionTags ?? []
      ..tripAdvisor = property.tripAdvisor
      ..rateOption = property.rateOption
      ..totalRooms = property.totalRooms ?? 0
      ..totalPrice = property.totalPrice?.toDouble()
      ..basePrice = property.basePrice?.toDouble()
      ..taxServiceFee = property.taxAndServiceFree?.toDouble()
      ..basePriceBeforePromo = property.basePriceBeforePromo?.toDouble()
      ..hasPromo = property.promo ?? false
      ..availableType = property.availableType
      ..additionPrice = property.additionPrice?.toDouble();
    return hotelItemDTO;
  }

  factory GtdHotelItemDTO.fromHotelPropertyAllRate(HotelPropertyAllRate property) {
    GtdHotelItemDTO hotelItemDTO = GtdHotelItemDTO()
      ..propertyId = property.propertyId ?? ""
      ..masterPropertyId = property.masterPropertyId
      ..hotelName = property.propertyName ?? ""
      ..checkin = property.checkin?.beginTime ?? ""
      ..checkout = property.checkout?.endTime ?? ""
      ..rating = double.tryParse(property.rating?.ratingProperty?.rating ?? "0")?.toDouble() ?? 0
      ..guestRating = property.rating?.ratingGuest?.score ?? ""
      ..address = property.address
      ..language = property.language ?? "vi"
      ..currency = property.currency ?? "VND"
      ..latitude = property.latitude
      ..longitude = property.longitude
      ..hotelType = property.propertyCategory?.name ?? ""
      ..hotelUrlImgs = (property.images ?? [])
          .sorted((a, b) => (a.position ?? 0).compareTo(b.position ?? 0))
          .map((e) => e.link)
          .whereType<String>()
          .toList()
      ..amenities = (property.amenities ?? [])
      ..inclusions = property.inclusions ?? []
      ..policies = property.policies ?? []
      ..descriptions = property.descriptions ?? []
      ..themes = property.themes ?? []
      ..statistics = property.statistics ?? []
      ..supplier = property.supplier ?? ""
      ..tags = property.tags ?? []
      ..rateOption = property.rateOption
      ..rooms = (property.rooms ?? []).map((e) => GtdHotelRoomDetailDTO.fromGtdHotelRoom(e)).toList()
      ..totalRooms = (property.rooms ?? [])
          .map((e) => e.ratePlans ?? [])
          .flattened
          .map((e) => e.totalRooms ?? 0)
          .fold(0, (previousValue, element) => previousValue + element);
    return hotelItemDTO;
  }

  String get hotelIntroContent {
    return descriptions.map((e) => e.value).toList().join(".");
  }
}

extension GtdHotelItemDTOHelper on GtdHotelItemDTO {
}