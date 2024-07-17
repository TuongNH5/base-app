import 'package:myutils/data/network/gtd_app_logger.dart';
import 'package:myutils/data/network/models/wrapped_result/result.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/booking_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/meta_resource.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/form_search_model.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

import 'gtd_flight_repository_dto.dart';
import 'models/gtd_flight_itinerary.dart';

class GtdFlightRepository {
  final MetaResourceApi metaApiClient = MetaResourceApi.shared;
  final AirTicketResourceApi airTicketResourceApi = AirTicketResourceApi.shared;
  final BookingResourceApi bookingResourceApi = BookingResourceApi.shared;

  GtdFlightRepository._();
  static final shared = GtdFlightRepository._();

  Future<void> cancelRequestTicket() async {
    return airTicketResourceApi.cancelRequest();
  }

  Future<Result<List<SearchAirport>, GtdApiError>> searchAirports(String keyword) async {
    try {
      final response = await metaApiClient.searchAirports(keyword);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("searchAirports: $e");
      return Error(e);
    }
  }

  Future<Result<GtdPopularAirportRS, GtdApiError>> getPopularAirports() async {
    try {
      final response = await metaApiClient.getCitiPopular();
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getPopularAirports: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdCountryCodeRs>, GtdApiError>> getCountries() async {
    try {
      final response = await metaApiClient.getcountryCodes();
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCountries: $e");
      return Error(e);
    }
  }

  Future<Result<GtdFlightSearchResultDTO, GtdApiError>> searchFlightCombine(FormSearchPayloadModel payload) async {
    try {
      GtdFlightLowSearchRq gtdFlightLowSearchRq = payload.toGtdFlightLowSearchRq();
      gtdFlightLowSearchRq.skipFilter = true;
      final resultSearch = await airTicketResourceApi.getFlightLowSearch(gtdFlightLowSearchRq).then((value) {
        if (value.success == false) {
          // throw GtdApiError(message: "Empty result ??");
          throw GtdApiError.fromErrorRs(value.errors ?? []);
        }
        // return GtdFlightSearchResultDTO.fromGtdFlightLowSearchRs(value);
        return value;
      });
      GtdFlightSearchResultDTO lowSearchDTO = GtdFlightSearchResultDTO.fromGtdFlightLowSearchRs(resultSearch);
      FilterAvailabilityRq filterRq = FilterAvailabilityRq.createFilterRq(
          searchId: lowSearchDTO.searchId??'', flightDirection: FlightDirection.d, flightType: lowSearchDTO.flightType!);
      final resultDTO = await flightFilterAvailabilityPaging(filterRq, FlightDirection.d);
      resultDTO.when((success) {
        lowSearchDTO.updateFlightSearchResultDTO(success, FlightDirection.d);
      }, (error) {
        // throw GtdApiError(message: "filter avaibility failed ");
        throw error;
      });
      return Success(lowSearchDTO);
    } on GtdApiError catch (e) {
      Logger.e("searchFlightCombine: $e");
      return Error(e);
    }
  }

  Future<Result<List<AllFilterOptionsDTO>, GtdApiError>> getAllFilterOptions(
      FilterAvailabilityRq filterOptionsRq) async {
    try {
      List<AllFilterOptionsDTO> allFilterOptions = [];
      filterOptionsRq.filter = null;
      await airTicketResourceApi.getAllFilterOptions(filterOptionsRq).then((value) {
        if (value.success == false) {
          throw GtdApiError(message: "Empty result ??");
        }
        allFilterOptions = fromAllFilterOptionsRs(value);
        return allFilterOptions;
      });
      return Success(allFilterOptions);
    } on GtdApiError catch (e) {
      Logger.e("getAllFilterOptions: $e");
      return Error(e);
    }
  }

  Future<Result<GtdFlightSearchResultDTO, GtdApiError>> flightFilterAvailabilityPaging(
      FilterAvailabilityRq filterAvailabilityRq, FlightDirection flightDirection) async {
    try {
      GtdFlightSearchResultDTO result =
          await airTicketResourceApi.filterAvailability(filterAvailabilityRq).then((value) {
        //MARK:: Handle error here
        if (value.success == false) {
          throw GtdApiError.fromErrorRs(value.errors ?? []);
        }
        GtdFlightSearchResultDTO resultDTO = GtdFlightSearchResultDTO.fromGtdFlightLowSearchRs(value);
        resultDTO.updateFlightSearchResult(value, filterAvailabilityRq, flightDirection);
        return resultDTO;
      });

      return Success(result);
    } on GtdApiError catch (e) {
      Logger.e("flightFilterAvailabilityPaging: $e");
      return Error(e);
    }
  }

  Future<Result<GroupPricedItinerary, GtdApiError>> groupItinerary(
      FilterAvailabilityRq filterAvailabilityRq, String groupId) async {
    try {
      //MARK:: Apply filter from flightSearchResultDTO
      GroupPricedItinerary groupPricedItinerary = GroupPricedItinerary();
      await airTicketResourceApi.groupItinerary(filterAvailabilityRq, groupId).then((value) {
        //MARK:: Handle error here
        if (value.success == false) {
          throw GtdApiError.fromErrorRs(value.errors ?? []);
        }
        groupPricedItinerary = value.groupPricedItinerary!;
        return groupPricedItinerary;
      });
      return Success(groupPricedItinerary);
    } on GtdApiError catch (e) {
      Logger.e("groupItinerary: $e");
      return Error(e);
    }
  }

  // Search-Flight-Combo
  Future<Result<GtdFlightSearchResultDTO, GtdApiError>> searchFlightCombo(FormSearchPayloadModel payload) async {
    bool isRoundtrip = payload.dateItinerary?.routeType == "ROUNDTRIP";
    var departResult = await searchFlightCombine(payload);
    try {
      var finalResult = await departResult.when((success) async {
        var departFlightResult = success;
        //Selected first cabinclass for depart
        departFlightResult.departureItinerary?.flightItems?.firstOrNull?.cabinOptions?.firstOrNull?.isSelected = true;
        if (isRoundtrip) {
          var departureItinerary = departFlightResult.initDepartureItineraryRq;
          FilterAvailabilityRq filterRq = FilterAvailabilityRq.createFilterRq(
              searchId: departFlightResult.returnSearchId!,
              flightDirection: FlightDirection.r,
              flightType: departFlightResult.flightType!,
              departureItinerary: departureItinerary);
          var returnFlightResult = await airTicketResourceApi.filterAvailability(filterRq).then((value) {
            GtdFlightItinerary returnFlightItinerary =
                GtdFlightItinerary.fromGtdFlightLowSearchRs(value, filterRq, FlightDirection.r);
            //Selected first cabinclass for return
            returnFlightItinerary.flightItems?.firstOrNull?.cabinOptions?.firstOrNull?.isSelected = true;
            return returnFlightItinerary;
          });
          departFlightResult.returnItinerary = returnFlightResult;
        }
        return departFlightResult;
      }, (error) => throw error);
      return Success(finalResult);
    } on GtdApiError catch (e) {
      Logger.e("searchFlightCombo: $e");
      return Error(e);
    }
  }

  // Draft-booking
  Future<Result<DraftBookingDTO, GtdApiError>> draftBooking(GtdFlightDraftBookingRq draftBookingRq) async {
    try {
      DraftBookingRs draftBookingRs = await airTicketResourceApi.draftBooking(draftBookingRq);
      // Handle error from draftBookingRs
      if (draftBookingRs.success == false || draftBookingRs.errors != null) {
        return Error(GtdApiError.fromErrorRs(draftBookingRs.errors ?? []));
      }
      DraftBookingDTO draftBookingDTO = draftBookingRs.toDraftBookingDTO();
      return Success(draftBookingDTO);
    } on GtdApiError catch (e) {
      Logger.e("draftBooking: $e");
      return Error(e);
    }
  }

  // Add-booking Traveller
  Future<Result<AddBookingTravellerRs, GtdApiError>> addBookingTraveller(
      AddBookingTravellerRq addBookingTravellerRq) async {
    try {
      AddBookingTravellerRs addBookingTravellerRs =
          await airTicketResourceApi.addBookingTraveller(addBookingTravellerRq);
      // Handle error from draftBookingRs
      if (addBookingTravellerRs.errors?.isNotEmpty == true) {
        return Error(GtdApiError.fromErrorRs(addBookingTravellerRs.errors ?? []));
      }
      return Success(addBookingTravellerRs);
    } on GtdApiError catch (e) {
      Logger.e("addBookingTraveller: $e");
      return Error(e);
    }
  }

  Future<Result<List<SsrOfferDTO>, GtdApiError>> getServiceRequests(String bookingNumber) async {
    try {
      List<SsrOfferDTO> ssrOfferDTOs = await airTicketResourceApi.ssrOffers(bookingNumber).then((value) {
        List<SsrOfferDTO> items = SsrOfferDTOMapper.fromSSrOfferRs(value);
        return items;
      });
      return Success(ssrOfferDTOs);
    } on GtdApiError catch (e) {
      Logger.e("getServiceRequests: $e");
      return Error(e);
    }
  }

  Future<Result<List<BookedFareRule>, GtdApiError>> flightFareRuleByBooking(String bookingNumber) async {
    try {
      GtdFlightFareRulesRs flightFareRulesRs = await airTicketResourceApi.flightFareRules(bookingNumber);
      if (flightFareRulesRs.success == false || flightFareRulesRs.errors != null) {
        return Error(GtdApiError.fromErrorRs(flightFareRulesRs.errors ?? []));
      }
      return Success(flightFareRulesRs.bookedFareRules ?? []);
    } on GtdApiError catch (e) {
      Logger.e("flightFareRuleByBooking: $e");
      return Error(e);
    }
  }
}
