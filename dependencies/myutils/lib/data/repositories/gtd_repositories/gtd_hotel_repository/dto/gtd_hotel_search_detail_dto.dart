// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_all_rates_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_result_rs.dart';

import 'gtd_hotel_item_dto.dart';

class GtdHotelSearchDetailDTO {
  String tripId = "";
  String searchId = "";
  GtdHotelItemDTO? hotelItemDTO;
  GtdHotelSearchDetailDTO();

  factory GtdHotelSearchDetailDTO.fromHotelSearchAllRate(GtdSearchAllRateDetail searchAllRateDetail) {
    GtdHotelSearchDetailDTO hotelSearchDetailDTO = GtdHotelSearchDetailDTO()
      ..searchId = searchAllRateDetail.searchId ?? ""
      ..tripId = searchAllRateDetail.tripId ?? ""
      ..hotelItemDTO = GtdHotelItemDTO.fromHotelPropertyAllRate(searchAllRateDetail.propertyAllRate!);
    return hotelSearchDetailDTO;
  }

  List<Amenity> get hotelAmenities {
    return hotelItemDTO?.amenities ?? [];
  }
}
