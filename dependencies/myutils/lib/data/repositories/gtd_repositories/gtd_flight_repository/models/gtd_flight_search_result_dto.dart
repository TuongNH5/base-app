import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/gtd_flight_draft_booking_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/filter_Itinerary_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/filter_availability_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_flight_low_search_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_item.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_itinerary.dart';

enum FlightType {
  dom('DOMESTIC'),
  inte('INTERNATIONAL');

  final String value;

  const FlightType(this.value);
}

enum FlightAdultType {
  adult('ADT'),
  child('CHD'),
  infant('INF');

  final String value;

  const FlightAdultType(this.value);

  static FlightAdultType? findByCode(String adultType) {
    switch (adultType) {
      case "ADT":
        return FlightAdultType.adult;
      case "CHD":
        return FlightAdultType.child;
      case "INF":
        return FlightAdultType.child;

      default:
        return null;
    }
  }
}

enum FlightDirection {
  d('DEPARTURE'),
  r('RETURN'),
  trip('TRIP');

  final String value;

  const FlightDirection(this.value);
}

enum FlightRoundType {
  roundTrip('RoundTrip'),
  oneWay('OneWay');

  final String value;

  const FlightRoundType(this.value);
}

enum SupplierType {
  air('AIR'),
  hotel('HOTEL'),
  combo('COMBO');

  final String value;

  const SupplierType(this.value);
}

class GtdFlightSearchResultDTO {
  String? returnSearchId;
  String? departureSearchId;
  FlightType? flightType;
  bool isRoundTrip = false;
  GtdFlightItinerary? departureItinerary;
  GtdFlightItinerary? returnItinerary;
  String? searchId;

  GtdFlightSearchResultDTO();

  factory GtdFlightSearchResultDTO.fromGtdFlightLowSearchRs(GtdFlightLowSearchRs result) {
    GtdFlightSearchResultDTO resultDTO = GtdFlightSearchResultDTO();
    FlightType flightType = FlightType.dom;
    if (result.flightType == null) {
      final firstItemType = result.groupPricedItineraries?.firstOrNull?.flightType;
      if (firstItemType != null) {
        flightType = firstItemType == "DOMESTIC" ? FlightType.dom : FlightType.inte;
      }
    } else {
      flightType = result.flightType == "DOMESTIC" ? FlightType.dom : FlightType.inte;
    }
    resultDTO.departureSearchId = result.departureSearchId;
    resultDTO.returnSearchId = result.returnSearchId;
    resultDTO.searchId = result.searchId;
    resultDTO.flightType = flightType;
    return resultDTO;
  }
}

extension GtdFlightSearchResultDTOMapper on GtdFlightSearchResultDTO {
  //MARK: Func for update departure and return flight for API: filter-option
  void updateFlightSearchResult(
      GtdFlightLowSearchRs result, FilterAvailabilityRq? filterOptions, FlightDirection flightDirection) {
    GtdFlightItinerary flightItinerary =
        GtdFlightItinerary.fromGtdFlightLowSearchRs(result, filterOptions, flightDirection);
    if (flightDirection == FlightDirection.d) {
      departureItinerary = flightItinerary;
    } else {
      returnItinerary = flightItinerary;
    }
  }

  GtdFlightSearchResultDTO updateFlightItinerary(GtdFlightItinerary flightItinerary, FlightDirection flightDirection) {
    if (flightDirection == FlightDirection.d) {
      departureItinerary = flightItinerary;
    } else {
      returnItinerary = flightItinerary;
    }
    return this;
  }

  void updateFlightSearchResultDTO(GtdFlightSearchResultDTO result, FlightDirection flightDirection) {
    if (flightDirection == FlightDirection.d) {
      departureItinerary = result.departureItinerary;
    } else {
      returnItinerary = result.returnItinerary;
    }
  }

  //MARK:Remove case not use  Func for update cabinclass when select option cabin
  // void updateFlightCabinOptions(GroupPricedItinerary groupPricedItinerary,
  //     FlightDirection flightDirection) {
  //   GtdFlightItem flightItem = GtdFlightItem.fromGroupPricedItinerary(
  //       groupPricedItinerary, flightDirection);
  //   departureItinerary?.flightItems?.map((e) => e.groupId == flightItem.groupId ? flightItem : e).toList();
  // }

  void updateFilterOptions(FilterAvailabilityRq filterAvailability, FlightDirection flightDirection) {
    if (flightDirection == FlightDirection.d) {
      departureItinerary?.filterOptions = filterAvailability;
    } else {
      returnItinerary?.filterOptions = filterAvailability;
    }
  }

  FilterItineraryRq get initDepartureItineraryRq {
    GtdFlightItem? selectedFlightItem = departureItinerary?.selectedFlightItem;
    return FilterItineraryRq(
        airlineCode: selectedFlightItem?.flightItemInfo?.airline,
        groupId: selectedFlightItem?.groupId,
        searchId: departureSearchId,
        supplierCode: selectedFlightItem?.flightItemInfo?.airSupplier,
        fareSourceCode: selectedFlightItem?.selectedCabinOption?.fareSourceCode);
  }

  FilterAvailabilityRq createFilterRq(FlightDirection flightDirection) {
    FilterAvailabilityRq request = FilterAvailabilityRq.createFilterRq(
        searchId: searchId!, flightDirection: flightDirection, flightType: flightType!);
    if (flightDirection == FlightDirection.r) {
      request.departureItinerary = initDepartureItineraryRq;
    }
    return request;
  }

  GtdFlightDraftBookingRq createDraftBookingRq() {
    List<ItineraryInfo> infos = [];
    GtdFlightItem? departFlightItem = departureItinerary?.selectedFlightItem;
    GtdFlightItem? returnFlightItem = returnItinerary?.selectedFlightItem;
    if (departFlightItem != null) {
      ItineraryInfo departInfo = ItineraryInfo(
          fareSourceCode: departFlightItem.selectedCabinOption!.fareSourceCode!,
          groupId: departFlightItem.groupId!,
          searchId: departureSearchId!);
      infos.add(departInfo);
    }
    if (returnFlightItem != null && returnSearchId != null) {
      ItineraryInfo returnInfo = ItineraryInfo(
          fareSourceCode: returnFlightItem.selectedCabinOption!.fareSourceCode!,
          groupId: returnFlightItem.groupId!,
          searchId: returnSearchId!);
      infos.add(returnInfo);
    }
    return GtdFlightDraftBookingRq(itineraryInfos: infos);
  }
}
