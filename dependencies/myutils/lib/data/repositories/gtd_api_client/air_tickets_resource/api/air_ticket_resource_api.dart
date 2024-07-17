import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_ticket_api_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/add_booking_traveller_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/gtd_flight_draft_booking_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/filter_availability_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/add_booking_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/draft_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_all_filter_options_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_flight_fare_rules_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_flight_low_search_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/gtd_flight_low_search_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_group_itinerary_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/ssr_offers_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_error_constant.dart';

/// API Client for call API
class AirTicketResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;
  CancelToken cancelToken = CancelToken();

  AirTicketResourceApi._();
  static final shared = AirTicketResourceApi._();

  void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("cancelled");
    }
  }

  Future<AllFilterOptionsRs> getAllFilterOptions(FilterAvailabilityRq filterOptionsRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.post,
        enpoint: AirTicketApiEndpoint.getAllFilterOptions(envType),
        data: filterOptionsRq,
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute(cancelToken: cancelToken);
      AllFilterOptionsRs allFilterOptionsRs = JsonParser.jsonToModel(AllFilterOptionsRs.fromJson, response.data);
      if ((allFilterOptionsRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(allFilterOptionsRs.errors ?? []);
      }
      return allFilterOptionsRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getAllFilterOptions: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdFlightLowSearchRs> getFlightLowSearch(GtdFlightLowSearchRq flightLowSearchRq) async {
    try {
      flightLowSearchRq.updateTimeStampRequest();
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get,
          receiveTimeout: 120,
          connectTimeout: 120,
          enpoint: AirTicketApiEndpoint.getFlightLowSearch(envType),
          queryParams: flightLowSearchRq.toJson());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdFlightLowSearchRs gtdFlightLowSearchRs = JsonParser.jsonToModel(GtdFlightLowSearchRs.fromJson, response.data);
      if ((gtdFlightLowSearchRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(gtdFlightLowSearchRs.errors ?? []);
      }
      return gtdFlightLowSearchRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getFlightLowSearch: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdFlightLowSearchRs> filterAvailability(FilterAvailabilityRq filterAvailabilityRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: AirTicketApiEndpoint.filterAvailability(envType),
          data: filterAvailabilityRq.toQueryBody(),
          queryParams: filterAvailabilityRq.toJsonQueryParams());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdFlightLowSearchRs gtdFlightLowSearchRs = JsonParser.jsonToModel(GtdFlightLowSearchRs.fromJson, response.data);
      if ((gtdFlightLowSearchRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(gtdFlightLowSearchRs.errors ?? []);
      }
      return gtdFlightLowSearchRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error filterAvailability: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GroupItineraryRs> groupItinerary(FilterAvailabilityRq filterAvailabilityRq, String groupId) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: AirTicketApiEndpoint.groupItineraryEndpoint(envType, groupId),
          data: filterAvailabilityRq.toQueryBody(),
          queryParams: filterAvailabilityRq.toJsonQueryParams());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GroupItineraryRs groupItineraryRs = JsonParser.jsonToModel(GroupItineraryRs.fromJson, response.data);
      if ((groupItineraryRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(groupItineraryRs.errors ?? []);
      }
      return groupItineraryRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
    }
  }

  Future<DraftBookingRs> draftBooking(GtdFlightDraftBookingRq draftBookingRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: AirTicketApiEndpoint.draftBooking(envType), data: draftBookingRq.toJson());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final DraftBookingRs draftBookingRs = JsonParser.jsonToModel(DraftBookingRs.fromJson, response.data);
      if ((draftBookingRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(draftBookingRs.errors ?? []);
      }
      return draftBookingRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error draftBooking: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AddBookingTravellerRs> addBookingTraveller(AddBookingTravellerRq addBookingTravellerRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: AirTicketApiEndpoint.addBookingTraveller(envType),
          data: addBookingTravellerRq.toJson());
      networkRequest.connectTimeout = 120;
      networkRequest.receiveTimeout = 120;
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final AddBookingTravellerRs addBookingTravellerRs =
          JsonParser.jsonToModel(AddBookingTravellerRs.fromJson, response.data);
      if ((addBookingTravellerRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(addBookingTravellerRs.errors ?? []);
      }
      return addBookingTravellerRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error addBookingTraveller: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<SsrOfferRs> ssrOffers(String bookingNumber) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AirTicketApiEndpoint.ssrOffers(envType, bookingNumber),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final SsrOfferRs ssrOfferRs = JsonParser.jsonToModel(SsrOfferRs.fromJson, response.data);
      if ((ssrOfferRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(ssrOfferRs.errors ?? []);
      }
      return ssrOfferRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error ssrOffers: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdFlightFareRulesRs> flightFareRules(String bookingNumber) async {
    try {
      final networkRequest = GTDNetworkRequest(
        type: GtdMethod.get,
        enpoint: AirTicketApiEndpoint.flightFareRule(envType, bookingNumber),
      );
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final GtdFlightFareRulesRs flightFareRulesRs =
          JsonParser.jsonToModel(GtdFlightFareRulesRs.fromJson, response.data);
      if ((flightFareRulesRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(flightFareRulesRs.errors ?? []);
      }
      return flightFareRulesRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error ssrOffers: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
