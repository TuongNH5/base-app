import 'package:collection/collection.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/flight_segment.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/origin_destination_option.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_location.dart';
import 'package:myutils/helpers/extension/date_time_extension.dart';

class GtdFlightItemInfo {
  String? logo;
  String? pnr;
  String? flightNo;
  // String? flightNumber;
  List<FlightSegment>? flightSegments;
  String? airline;
  String? airlineName;
  String? airSupplier;
  String? aircraft;
  String? validatingAirlineCode;
  int? journeyDuration;
  DateTime? originDateTime;
  DateTime? destinationDateTime;
  DateTime? arrivalDateTime;
  GtdLocation? originLocation;
  GtdLocation? arrivalLocation;
  GtdLocation? destinationLocation;

  GtdFlightItemInfo();

  factory GtdFlightItemInfo.fromGroupPricedItinerary(
      GroupPricedItinerary groupPricedItinerary, FlightDirection flightDirection) {
    GtdFlightItemInfo flightItemInfo = GtdFlightItemInfo();
    OriginDestinationOption? originDestinationOptionDirection = groupPricedItinerary.pricedItineraries
        ?.map((e) => e.originDestinationOptionDirection(flightDirection.name))
        .firstOrNull;
    flightItemInfo.airline = groupPricedItinerary.airline;
    flightItemInfo.aircraft =
        groupPricedItinerary.aircraft ?? originDestinationOptionDirection?.flightSegments?.firstOrNull?.aircraft;
    flightItemInfo.airlineName = groupPricedItinerary.airlineName;
    flightItemInfo.flightNo = groupPricedItinerary.fightNo;
    flightItemInfo.airSupplier = groupPricedItinerary.airSupplier;
    flightItemInfo.validatingAirlineCode = groupPricedItinerary.pricedItineraries?.firstOrNull?.validatingAirlineCode;
    var originLocation = GtdLocation(
        locationCode: groupPricedItinerary.originLocationCode,
        locationName: groupPricedItinerary.originLocationName,
        countryCode: groupPricedItinerary.originCountryCode,
        countryName: groupPricedItinerary.originCountry,
        city: groupPricedItinerary.originCity);
    var destinationLocation = GtdLocation(
        locationCode: groupPricedItinerary.destinationLocationCode,
        locationName: groupPricedItinerary.destinationLocationName,
        countryCode: groupPricedItinerary.destinationCountryCode,
        countryName: groupPricedItinerary.destinationCountry,
        city: groupPricedItinerary.destinationCity);
    //Update flightItem - Swap origin FlightDirectionReturn with destination location if flightType== INTERNATIONAL && roundType == ROUNDTRIP
    if (groupPricedItinerary.flightType == "INTERNATIONAL" &&
        groupPricedItinerary.roundType == "ROUNDTRIP" &&
        flightDirection == FlightDirection.r) {
      flightItemInfo.originLocation = destinationLocation;
      flightItemInfo.destinationLocation = originLocation;
    } else {
      flightItemInfo.originLocation = originLocation;
      flightItemInfo.destinationLocation = destinationLocation;
    }
    // flightItemInfo.flightNumber = originDestinationOptionDirection?.flightSegments?.firstOrNull?.flightNumber;
    flightItemInfo.flightSegments = originDestinationOptionDirection?.flightSegments;
    flightItemInfo.journeyDuration = originDestinationOptionDirection?.journeyDuration;
    flightItemInfo.originDateTime = originDestinationOptionDirection?.originDateTime;
    flightItemInfo.destinationDateTime = originDestinationOptionDirection?.destinationDateTime;

    return flightItemInfo;
  }

  String get airlineLogo {
    String? airlineCode = (airline == "VFC" || airline == "0V" || airline == "BL") ? "VN" : airline;
    if (airlineCode == "BL" || airlineCode == "VN" || airlineCode == "QH" || airlineCode == "VJ") {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.png';
    } else {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.gif';
    }
  }

  String journeyDurationDate() {
    return GtdDateTime.timeStampToDateString(journeyDuration ?? 0);
  }

  String get flightDetailSubtitle {
    return "$airline$flightNo | $aircraft";
  }

  String get flightLocationTitle {
    return "${originLocation?.locationCode} - ${destinationLocation?.locationCode}";
  }

  String get originTime {
    return originDateTime?.utcDate("HH:mm") ?? "";
  }

  String get destinationTime {
    return destinationDateTime?.utcDate("HH:mm") ?? "";
  }
}
