import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/air_itinerary_pricing_info.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/fare.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/origin_destination_option.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_passenger_fare_info.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_price.dart';
import 'package:collection/collection.dart';
import 'package:myutils/helpers/extension/number_extension.dart';
import 'gtd_flight_search_result_dto.dart';

class GtdItineraryDisplayPriceInfo {
  double tempPrice = 0;
  double totalPrice = 0;
  double basePrice = 0;
  double netAdultPrice = 0;
  double netChildPrice = 0;
  double netInfantPrice = 0;
  double baseAdultPrice = 0;
  double baseChildPrice = 0;
  double baseInfantPrice = 0;
  double totalAdultPrice = 0;
  double totalChildPrice = 0;
  double totalInfantPrice = 0;
  double taxFee = 0;
  int countAdult = 0;
  int countChild = 0;
  int countInfant = 0;
  GtdItineraryDisplayPriceInfo({
    required this.tempPrice,
    required this.totalPrice,
    required this.basePrice,
    required this.netAdultPrice,
    required this.netChildPrice,
    required this.netInfantPrice,
    required this.totalAdultPrice,
    required this.totalChildPrice,
    required this.totalInfantPrice,
    required this.baseAdultPrice,
    required this.baseChildPrice,
    required this.baseInfantPrice,
    required this.countAdult,
    required this.countChild,
    required this.countInfant,
    required this.taxFee,
  });

  factory GtdItineraryDisplayPriceInfo.fromAirItineraryPricingInfo(AirItineraryPricingInfo info) {
    GtdItineraryDisplayPriceInfo displayPriceInfo = GtdItineraryDisplayPriceInfo(
        tempPrice: info.totalTempAmount,
        totalPrice: info.totalAmount,
        basePrice: info.baseAmount,
        baseAdultPrice: info.baseAdultPerPerson,
        baseChildPrice: info.baseChildPerPerson,
        baseInfantPrice: info.baseInfantPerPerson,
        netAdultPrice: info.netAdultPerPerson,
        netChildPrice: info.netChildPerPerson,
        netInfantPrice: info.netInfantPerPerson,
        totalAdultPrice: info.totalAdultPerPerson,
        totalChildPrice: info.totalChildPerPerson,
        totalInfantPrice: info.totalInfantPerPerson,
        taxFee: info.taxFee,
        countAdult: info.countAdult,
        countChild: info.countChild,
        countInfant: info.countInfant);
    return displayPriceInfo;
  }

  double get totalBaseFareAdult => baseAdultPrice * countAdult;
  double get totalBaseFareChild => baseChildPrice * countChild;
  double get totalBaseFareInfant => baseInfantPrice * countInfant;
}

class GtdAirlineCabinClass {
  String? cabinClassName;
  String? cabinClassCode;
  String? cabinClassText;
  String? sequenceNumber;
  String? fareSourceCode;
  String? fareType;
  GtdPrice? totalFare;
  bool? isSelected;
  List<GtdPassengerFareInfo>? passengerFareInfos;
  GtdItineraryDisplayPriceInfo? priceInfo;
  GtdAirlineCabinClass();
  factory GtdAirlineCabinClass.fromPricedItinerary(PricedItinerary pricedItinerary, FlightDirection flightDirection) {
    GtdAirlineCabinClass airlineCabinClass = GtdAirlineCabinClass();
    OriginDestinationOption? originDestinationOption =
        pricedItinerary.originDestinationOptionDirection(flightDirection.name);
    airlineCabinClass.cabinClassName = originDestinationOption?.cabinClassName;
    airlineCabinClass.cabinClassCode = originDestinationOption?.flightSegments?.firstOrNull?.cabinClassCode;
    airlineCabinClass.cabinClassText = originDestinationOption?.flightSegments?.firstOrNull?.cabinClassText;
    List<Fare?> fares = [
      pricedItinerary.airItineraryPricingInfo?.adultFare,
      pricedItinerary.airItineraryPricingInfo?.childFare,
      pricedItinerary.airItineraryPricingInfo?.infantFare
    ];
    airlineCabinClass.fareSourceCode = pricedItinerary.airItineraryPricingInfo?.fareSourceCode;
    airlineCabinClass.fareType = pricedItinerary.airItineraryPricingInfo?.fareType;
    airlineCabinClass.sequenceNumber = pricedItinerary.sequenceNumber;
    airlineCabinClass.passengerFareInfos =
        fares.map((e) => e).whereType<Fare>().map((e) => GtdPassengerFareInfo.fromFare(e)).toList();

    if (pricedItinerary.airItineraryPricingInfo != null) {
      airlineCabinClass.priceInfo =
          GtdItineraryDisplayPriceInfo.fromAirItineraryPricingInfo(pricedItinerary.airItineraryPricingInfo!);
    }

    return airlineCabinClass;
  }
}

extension GtdAirlineCabinClassHelper on GtdAirlineCabinClass {
  double getDisplayPrice() {
    GtdPassengerFareInfo? adultFare =
        passengerFareInfos?.firstWhere((element) => element.adultType == FlightAdultType.adult);
    double price = (adultFare?.passengerFare?.totalFare ?? 0) / (adultFare?.quantity ?? 1);
    return price;
  }

  GtdPrice? getPassengerFare(FlightAdultType adultType) {
    return passengerFareInfos?.firstWhere((element) => element.adultType == adultType).passengerFare;
  }

  String? get adultPrice {
    double? priceAdult = getDisplayPrice();
    return priceAdult.toCurrency();
  }
}
