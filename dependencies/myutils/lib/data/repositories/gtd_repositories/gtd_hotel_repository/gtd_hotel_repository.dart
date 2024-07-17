import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/add_booking_traveller_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/add_booking_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/api/booking_resource_api.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/hotel_resource.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_model/gtd_paging_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_booking_repository/dto/booking_detail_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_hotel_repository/dto/gtd_hotel_location_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_hotel_repository/dto/gtd_hotel_search_detail_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_hotel_repository/dto/gtd_hotel_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_hotel_repository/dto/gtd_hotel_filter_option_dto.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class GtdHotelRepository {
  final HotelResourceApi hotelResourceApi = HotelResourceApi.shared;
  final BookingResourceApi bookingResourceApi = BookingResourceApi.shared;

  GtdHotelRepository._();
  static final shared = GtdHotelRepository._();

  Future<Result<GtdPagingDTO<GtdHotelLocationDTO>, GtdApiError>> getHotelPopularLocation() async {
    try {
      final response = await hotelResourceApi.getHotelPopularLocation();
      var popularHotelLocations = response.map((e) => GtdHotelLocationDTO.fromHotelPropertyValue(e)).toList();
      popularHotelLocations.sort(((a, b) => (a.piorityKey ?? "").compareTo(b.piorityKey ?? "")));
      return Success(GtdPagingDTO(data: popularHotelLocations));
    } on GtdApiError catch (e) {
      Logger.e("getHotelPopularLocation: $e");
      return Error(e);
    }
  }

  Future<Result<GtdPagingDTO<GtdHotelLocationDTO>, GtdApiError>> findHotelLocationByKeyword(String keyword) async {
    try {
      final response = await hotelResourceApi.findHotelLocationByKeyword(keyword: keyword);
      var hotelLocationDTOs =
          (response.contents ?? []).map((e) => GtdHotelLocationDTO.fromHotelLocatioContent(e)).toList();
      GtdPagingDTO<GtdHotelLocationDTO> pagingDTO = GtdPagingDTO(
          data: hotelLocationDTOs,
          page: response.page?.pageNumber ?? 0,
          totalPage: response.page?.totalPage ?? 0,
          totalItem: response.page?.totalItems ?? 0);
      return Success(pagingDTO);
    } on GtdApiError catch (e) {
      Logger.e("findHotelLocationByKeyword: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdHotelFilterOptionDTO>, GtdApiError>> getHotelFilterOptions() async {
    try {
      final response = await hotelResourceApi.getHotelFilterOptions();
      var hotelFilterOptions = GtdHotelFilterOptionDTO.hotelFilterOptions(response);
      return Success(hotelFilterOptions);
    } on GtdApiError catch (e) {
      Logger.e("findHotelLocationByKeyword: $e");
      return Error(e);
    }
  }

  Future<Result<GtdHotelSearchResultDTO, GtdApiError>> searchHotelBestRate(Map<String, dynamic> request) async {
    try {
      final response = await hotelResourceApi.searchHotelBestRate(request);

      // final response = GtdHotelSearchResultRs.fromJson(hotelSearchResultFakeData);
      GtdHotelSearchResultDTO hotelSearchResultDTO = GtdHotelSearchResultDTO.fromGtdHotelSearchResult(response);
      return Success(hotelSearchResultDTO);
    } on GtdApiError catch (e) {
      Logger.e("searchHotelBestRate: $e");
      return Error(e);
    }
  }

  Future<Result<GtdHotelSearchDetailDTO, GtdApiError>> searchHotelAllRate(
      GtdHotelSearchAllRateRq searchAllRateRq) async {
    try {
      // final response = GtdSearchAllRatesRs.fromJson(hotelSearchAllRateFakeData).result!;
      final response = await hotelResourceApi.searchHotelAllRate(searchAllRateRq);
      GtdHotelSearchDetailDTO hotelSearchDetailDTO = GtdHotelSearchDetailDTO.fromHotelSearchAllRate(response);
      return Success(hotelSearchDetailDTO);
    } on GtdApiError catch (e) {
      Logger.e("searchHotelAllRate: $e");
      return Error(e);
    }
  }

  Future<Result<BookingDetailDTO, GtdApiError>> draftBookingHotel(GtdHotelCheckoutRq hotelCheckoutRq) async {
    try {
      // final response = GtdSearchAllRatesRs.fromJson(hotelSearchAllRateFakeData).result!;
      final response = await hotelResourceApi
          .checkoutHotel(hotelCheckoutRq)
          .then((value) => hotelResourceApi.draftBookingHotel(hotelCheckoutRq))
          .then((value) => bookingResourceApi.getBookingDetailByBookingNumber(value.bookingNumber!));
      if (response.bookingNumber == null) {
        throw GtdApiError(message: "Booking number is empty");
      }
      var bookingDetailDTO = BookingDetailDTO()..mappingBookingDetail(response);
      return Success(bookingDetailDTO);
    } on GtdApiError catch (e) {
      Logger.e("draftBookingHotel: $e");
      return Error(e);
    }
  }

  Future<Result<AddBookingTravellerRs, GtdApiError>> addBookingTraveller(
      AddBookingTravellerRq addBookingTravellerRq) async {
    try {
      AddBookingTravellerRs addBookingTravellerRs =
          await hotelResourceApi.addBookingTravellerHotel(addBookingTravellerRq);
      // Handle error from draftBookingRs
      if (addBookingTravellerRs.success == false || addBookingTravellerRs.errors?.isNotEmpty == true) {
        return Error(GtdApiError.fromErrorRs(addBookingTravellerRs.errors ?? []));
      }
      return Success(addBookingTravellerRs);
    } on GtdApiError catch (e) {
      Logger.e("addBookingTraveller: $e");
      return Error(e);
    }
  }
}
