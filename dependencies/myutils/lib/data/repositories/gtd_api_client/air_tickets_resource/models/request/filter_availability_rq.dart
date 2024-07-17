import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/filter_Itinerary_rq.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/gtd_flight_repository_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/sort_value.dart';

FilterAvailabilityRq filterAvailabilityRqFromJson(String str) => FilterAvailabilityRq.fromJson(json.decode(str));

String filterAvailabilityRqToJson(FilterAvailabilityRq data) => json.encode(data.toJson());

class FilterAvailabilityRq {
  FilterAvailabilityRq(
      {required this.searchId, this.filter, this.departureItinerary, this.sort, this.page = 0, this.size = 5});

  String searchId;
  FlightFilter? filter;
  FilterItineraryRq? departureItinerary;
  FlightSortValue? sort;
  int page = 0;
  int size = 10;

  FilterAvailabilityRq.createFilterRq(
      {required this.searchId,
      FlightDirection flightDirection = FlightDirection.d,
      FlightType flightType = FlightType.dom,
      this.departureItinerary,
      this.filter,
      this.sort}) {
    filter = filter ?? FlightFilter.initDefault(flightDirection, flightType: flightType);
    sort = sort ?? FlightSortValue.departureDateAsc;
    page = 0;
    size = 5;
  }

  FilterAvailabilityRq createFilterGroupItenaryRq() {
    FilterAvailabilityRq filterRq = FilterAvailabilityRq(searchId: searchId);
    filterRq.departureItinerary = FilterItineraryRq(fareSourceCode: departureItinerary?.fareSourceCode);
    filterRq.filter = filter;
    filterRq.filter?.groupId = departureItinerary?.groupId ?? filter?.groupId;
    filterRq.sort = sort = sort ?? FlightSortValue.departureDateAsc;
    return filterRq;
  }

  factory FilterAvailabilityRq.fromJson(Map<String, dynamic> json) => FilterAvailabilityRq(
        searchId: json["searchId"],
        filter: json["filter"] == null ? null : FlightFilter.fromJson(json["filter"]),
        departureItinerary: json["departureItinerary"],
      );

  Map<String, dynamic> toJson() => {
        "searchId": searchId,
        "filter": filter?.toJson(),
        "departureItinerary": departureItinerary,
      };
  Map<String, dynamic> toJsonQueryParams() => {
        "page": page,
        "size": size,
        "sort": sort?.value,
      };

  Map<String, dynamic> toQueryBody() => {
        "searchId": searchId,
        "filter": filter?.toJson(),
        "departureItinerary": departureItinerary,
      };
}

class FlightFilter {
  FlightFilter({
    this.cabinClassOptions,
    this.ticketPolicyOptions,
    this.airlineOptions,
    this.stopOptions,
    this.step,
    this.flightType,
    this.departureDateTimeOptions,
    this.arrivalDateTimeReturnOptions,
    this.arrivalDateTimeOptions,
    this.priceItineraryId,
    this.loadMore,
    this.departureDateTimeReturnOptions,
    this.filterFromPrice,
    this.filterToPrice,
    this.groupId,
  });

  List<dynamic>? cabinClassOptions;
  List<dynamic>? ticketPolicyOptions;
  List<dynamic>? airlineOptions;
  List<dynamic>? stopOptions;
  String? step;
  String? flightType;
  String? groupId;
  List<dynamic>? departureDateTimeOptions;
  List<dynamic>? arrivalDateTimeReturnOptions;
  List<dynamic>? arrivalDateTimeOptions;
  String? priceItineraryId;
  bool? loadMore;
  List<dynamic>? departureDateTimeReturnOptions;
  dynamic filterFromPrice;
  dynamic filterToPrice;

  factory FlightFilter.initDefault(FlightDirection flightDirection, {FlightType flightType = FlightType.dom}) =>
      FlightFilter(
          cabinClassOptions: [],
          ticketPolicyOptions: [],
          airlineOptions: [],
          stopOptions: [],
          step: (flightDirection == FlightDirection.d) ? '1' : '2',
          flightType: flightType.value,
          departureDateTimeOptions: [],
          arrivalDateTimeReturnOptions: [],
          arrivalDateTimeOptions: [],
          priceItineraryId: '',
          groupId: '',
          loadMore: false,
          departureDateTimeReturnOptions: [],
          filterFromPrice: null,
          filterToPrice: null);

  factory FlightFilter.toGtdFilterOptions(FilterAvailabilityRq? filterAvailabilityRq,
          List<AllFilterOptionsDTO> filterOptionsDTO, FlightDirection flightDirection) =>
      getFilterOptions(filterAvailabilityRq, filterOptionsDTO, flightDirection);

  factory FlightFilter.fromJson(Map<String, dynamic> json) => FlightFilter(
        cabinClassOptions:
            json["cabinClassOptions"] == null ? [] : List<dynamic>.from(json["cabinClassOptions"]!.map((x) => x)),
        ticketPolicyOptions:
            json["ticketPolicyOptions"] == null ? [] : List<dynamic>.from(json["ticketPolicyOptions"]!.map((x) => x)),
        airlineOptions: json["airlineOptions"] == null ? [] : List<dynamic>.from(json["airlineOptions"]!.map((x) => x)),
        stopOptions: json["stopOptions"] == null ? [] : List<dynamic>.from(json["stopOptions"]!.map((x) => x)),
        step: json["step"],
        departureDateTimeOptions: json["departureDateTimeOptions"] == null
            ? []
            : List<dynamic>.from(json["departureDateTimeOptions"]!.map((x) => x)),
        arrivalDateTimeReturnOptions: json["arrivalDateTimeReturnOptions"] == null
            ? []
            : List<dynamic>.from(json["arrivalDateTimeReturnOptions"]!.map((x) => x)),
        arrivalDateTimeOptions: json["arrivalDateTimeOptions"] == null
            ? []
            : List<dynamic>.from(json["arrivalDateTimeOptions"]!.map((x) => x)),
        priceItineraryId: json["priceItineraryId"],
        loadMore: json["loadMore"],
        departureDateTimeReturnOptions: json["departureDateTimeReturnOptions"] == null
            ? []
            : List<dynamic>.from(json["departureDateTimeReturnOptions"]!.map((x) => x)),
        filterFromPrice: json["filterFromPrice"],
        filterToPrice: json["filterToPrice"],
        groupId: json["groupId"],
      );

  Map<String, dynamic> toJson() => {
        "cabinClassOptions": cabinClassOptions == null ? [] : List<dynamic>.from(cabinClassOptions!.map((x) => x)),
        "ticketPolicyOptions":
            ticketPolicyOptions == null ? [] : List<dynamic>.from(ticketPolicyOptions!.map((x) => x)),
        "airlineOptions": airlineOptions == null ? [] : List<dynamic>.from(airlineOptions!.map((x) => x)),
        "stopOptions": stopOptions == null ? [] : List<dynamic>.from(stopOptions!.map((x) => x)),
        "step": step,
        "departureDateTimeOptions":
            departureDateTimeOptions == null ? [] : List<dynamic>.from(departureDateTimeOptions!.map((x) => x)),
        "arrivalDateTimeReturnOptions":
            arrivalDateTimeReturnOptions == null ? [] : List<dynamic>.from(arrivalDateTimeReturnOptions!.map((x) => x)),
        "arrivalDateTimeOptions":
            arrivalDateTimeOptions == null ? [] : List<dynamic>.from(arrivalDateTimeOptions!.map((x) => x)),
        "priceItineraryId": priceItineraryId,
        "loadMore": loadMore,
        "departureDateTimeReturnOptions": departureDateTimeReturnOptions == null
            ? []
            : List<dynamic>.from(departureDateTimeReturnOptions!.map((x) => x)),
        "filterFromPrice": filterFromPrice,
        "filterToPrice": filterToPrice,
        "groupId": groupId,
      };
}

getFilterOptions(FilterAvailabilityRq? filterAvailabilityRq, List<AllFilterOptionsDTO> filterOptionsDTO,
    FlightDirection flightDirection) {
  List<dynamic> cabinClassOptions = <dynamic>[];
  List<dynamic> airlineOptions = <dynamic>[];
  List<dynamic> departureDateTimeOptions = <dynamic>[];
  List<dynamic> arrivalDateTimeOptions = <dynamic>[];

  filterOptionsDTO.map((element) {
    switch (element.type) {
      case TypeFilter.cabin:
        cabinClassOptions = genarateFilter(element.filterOptions!);
        break;
      case TypeFilter.airline:
        airlineOptions = genarateFilter(element.filterOptions!);
        break;
      case TypeFilter.departureDateTime:
        departureDateTimeOptions = genarateFilter(element.filterOptions!);
        break;
      case TypeFilter.arrivalDateTime:
        arrivalDateTimeOptions = genarateFilter(element.filterOptions!);
        break;
      default:
        break;
    }
  }).toList();

  return FlightFilter(
      cabinClassOptions: cabinClassOptions,
      airlineOptions: airlineOptions,
      step: (flightDirection == FlightDirection.d) ? "1" : "2",
      flightType: filterAvailabilityRq?.filter?.flightType,
      departureDateTimeOptions: departureDateTimeOptions,
      arrivalDateTimeOptions: arrivalDateTimeOptions,
      groupId: filterAvailabilityRq?.filter?.groupId);
}

List<dynamic> genarateFilter(List<FilterOption> filterOptions) {
  List<dynamic> dataFilterOptions = <dynamic>[];
  for (var filterOption in filterOptions) {
    if (filterOption.isSelected) {
      dataFilterOptions.add(filterOption.value);
    }
  }
  return dataFilterOptions;
}
