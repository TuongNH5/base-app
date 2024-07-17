import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/add_booking_traveller_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/add_booking_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/gtd_hotel_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_checkout_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_draft_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_filter_options_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_location_search_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_popular_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_all_rates_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_result_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/request/gtd_hotel_checkout_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/request/gtd_hotel_search_all_rate_rq.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_error_constant.dart';


class HotelResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  HotelResourceApi._();
  static final shared = HotelResourceApi._();

  Future<List<HotelPropertyValue>> getHotelPopularLocation() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdHotelEndpoint.getPolularHotelLocation(envType));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelPolularRs hotelPolularRs = JsonParser.jsonToModel(GtdHotelPolularRs.fromJson, response.data);
      if ((hotelPolularRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelPolularRs.result?.propertyValues ?? [];
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getHotelPopularLocation: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<HotelLocationContentRs> findHotelLocationByKeyword({required String keyword, int pageNumber = 0}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdHotelEndpoint.findHotelByKeyword(envType));
      networkRequest.queryParams = {
        "keyword": keyword,
        "language": "vi",
        "pageNumber": pageNumber,
        "pageSize": 15,
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelLocationSearchRs hotelLocationSearchRs =
          JsonParser.jsonToModel(GtdHotelLocationSearchRs.fromJson, response.data);
      if ((hotelLocationSearchRs.errors ?? []).isNotEmpty || hotelLocationSearchRs.result == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelLocationSearchRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error findHotelLocationByKeyword: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdHotelFilterOptionJsonModel> getHotelFilterOptions() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdHotelEndpoint.getHotelFilterOptions(envType));
      networkRequest.queryParams = {
        "language": "vi",
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelFilterOptionRs hotelFilterOptionRs =
          JsonParser.jsonToModel(GtdHotelFilterOptionRs.fromJson, response.data);
      if ((hotelFilterOptionRs.errors ?? []).isNotEmpty || hotelFilterOptionRs.result == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelFilterOptionRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getHotelFilterOptions: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdHotelSearchResult> searchHotelBestRate(Map<String, dynamic> hotelSearchRequest) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdHotelEndpoint.searchHotelBestRate(envType));
      networkRequest.queryParams = hotelSearchRequest;
      networkRequest.connectTimeout = 40;
      networkRequest.receiveTimeout = 60;
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelSearchResultRs hotelSearchResultRs =
          JsonParser.jsonToModel(GtdHotelSearchResultRs.fromJson, response.data);
      if ((hotelSearchResultRs.errors ?? []).isNotEmpty || hotelSearchResultRs.result == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelSearchResultRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error searchHotelBestRate: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdSearchAllRateDetail> searchHotelAllRate(GtdHotelSearchAllRateRq searchAllRateRq) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdHotelEndpoint.searchHotelAllRate(envType));
      networkRequest.queryParams = searchAllRateRq.toMap();
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdSearchAllRatesRs hotelSearchResultRs = JsonParser.jsonToModel(GtdSearchAllRatesRs.fromJson, response.data);
      if ((hotelSearchResultRs.errors ?? []).isNotEmpty || hotelSearchResultRs.result == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelSearchResultRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error searchHotelAllRate: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdHotelCheckout> checkoutHotel(GtdHotelCheckoutRq hotelCheckoutRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdHotelEndpoint.checkoutHotel(envType), data: hotelCheckoutRq);

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelCheckoutRs hotelCheckoutRs = JsonParser.jsonToModel(GtdHotelCheckoutRs.fromJson, response.data);
      if ((hotelCheckoutRs.errors ?? []).isNotEmpty || hotelCheckoutRs.result == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelCheckoutRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error checkoutHotel: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdHotelDraftBookingResult> draftBookingHotel(GtdHotelCheckoutRq hotelCheckoutRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdHotelEndpoint.draftBookingHotel(envType), data: hotelCheckoutRq);

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdHotelDraftBookingRs hotelDraftBookingRs =
          JsonParser.jsonToModel(GtdHotelDraftBookingRs.fromJson, response.data);
      if ((hotelDraftBookingRs.errors ?? []).isNotEmpty ||
          hotelDraftBookingRs.result == null ||
          hotelDraftBookingRs.result?.bookingNumber == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelDraftBookingRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error draftBookingHotel: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AddBookingTravellerRs> addBookingTravellerHotel(AddBookingTravellerRq addBookingTravellerRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: GtdHotelEndpoint.addBookingTraveller(envType),
          data: addBookingTravellerRq.toJson());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final AddbookingResultRs addBookingTravellerRs =
          JsonParser.jsonToModel(AddbookingResultRs.fromJson, response.data);
      if ((addBookingTravellerRs.errors ?? []).isNotEmpty || addBookingTravellerRs.result == null) {
        throw GtdApiError.fromErrorRs(addBookingTravellerRs.errors ?? []);
      }
      return addBookingTravellerRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error addBookingTravellerHotel: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
