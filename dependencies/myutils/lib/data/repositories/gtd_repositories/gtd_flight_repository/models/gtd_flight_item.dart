// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/flight_segment.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_airline_cabin_class.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_item_info.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_item_price_info.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class GtdFlightItem {
  String? groupId;
  GtdFlightItemInfo? flightItemInfo;
  GtdFlightItemPriceInfo? flightItemPriceInfo;
  List<GtdAirlineCabinClass>? cabinOptions;
  int? totalPricedItinerary = 0;
  bool isExpand = false;
  List<FlightSegment> get transitInfos => flightItemInfo?.flightSegments ?? [];

  GtdFlightItem();

  factory GtdFlightItem.fromGroupPricedItinerary(
      GroupPricedItinerary groupPricedItinerary,
      FlightDirection flightDirection) {
    GtdFlightItem flightItem = GtdFlightItem();
    flightItem.groupId = groupPricedItinerary.groupId;
    flightItem.totalPricedItinerary = groupPricedItinerary.totalPricedItinerary;
    flightItem.flightItemInfo = GtdFlightItemInfo.fromGroupPricedItinerary(
        groupPricedItinerary, flightDirection);
    flightItem.cabinOptions = groupPricedItinerary.pricedItineraries
        ?.map(
            (e) => GtdAirlineCabinClass.fromPricedItinerary(e, flightDirection))
        .toList();
    double? itemPrice = flightItem.cabinOptions?.firstOrNull?.getDisplayPrice();
    flightItem.flightItemPriceInfo =
        GtdFlightItemPriceInfo(price: itemPrice ?? 0);
    return flightItem;
  }

  GtdFlightItem copyWith({
    String? groupId,
    List<GtdAirlineCabinClass>? cabinOptions,
    int? totalPricedItinerary,
  }) {
    GtdFlightItem item = GtdFlightItem();
    item.groupId = groupId ?? this.groupId;
    item.cabinOptions = cabinOptions ?? this.cabinOptions;
    item.totalPricedItinerary =
        totalPricedItinerary ?? this.totalPricedItinerary;
    item.flightItemInfo = flightItemInfo;
    double? itemPrice = item.cabinOptions?.firstOrNull?.getDisplayPrice();
    item.flightItemPriceInfo = GtdFlightItemPriceInfo(price: itemPrice ?? 0);
    item.totalPricedItinerary =
        totalPricedItinerary ?? (item.cabinOptions?.length ?? 1);
    return item;
  }

  int compareDepartureDate(GtdFlightItem other) {
    try {
      return flightItemInfo!.originDateTime!
          .compareTo(other.flightItemInfo!.originDateTime!);
    } catch (e) {
      throw GtdApiError(message: "Cannot compare departure date FlightItem");
    }
  }

  int comparePrice(GtdFlightItem other) {
    try {
      return flightItemPriceInfo!.price!
          .compareTo(other.flightItemPriceInfo!.price!);
    } catch (e) {
      throw GtdApiError(message: "Cannot compare Price FlightItem");
    }
  }

  int compareDuration(GtdFlightItem other) {
    try {
      return flightItemInfo!.journeyDuration!
          .compareTo(other.flightItemInfo!.journeyDuration!);
    } catch (e) {
      throw GtdApiError(message: "Cannot compare duration FlightItem");
    }
  }
}

extension GtdFlightItemMapper on GtdFlightItem {
  void updateCabinOptions(GroupPricedItinerary groupPricedItinerary,
      FlightDirection flightDirection) {
    cabinOptions = groupPricedItinerary.pricedItineraries
        ?.map(
            (e) => GtdAirlineCabinClass.fromPricedItinerary(e, flightDirection))
        .toList();
  }

  void chooseCabinClass(
    GtdAirlineCabinClass cabinOption,
  ) {
    cabinOptions = cabinOptions?.map((e) => e).whereNotNull().map((e) {
      e.isSelected = (e.sequenceNumber == cabinOption.sequenceNumber);
      return e;
    }).toList();

  }

  GtdAirlineCabinClass? get selectedCabinOption {
    return cabinOptions
        ?.where((element) => element.isSelected == true)
        .firstOrNull;
  }
}
