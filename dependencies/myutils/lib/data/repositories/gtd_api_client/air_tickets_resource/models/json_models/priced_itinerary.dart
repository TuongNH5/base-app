import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/air_itinerary_pricing_info.dart';
import 'package:collection/collection.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/origin_destination_option.dart';

class PricedItinerary {
  PricedItinerary({
    this.airItineraryPricingInfo,
    this.allowHold,
    this.baggageItems,
    this.cabinClassName,
    this.directionInd,
    this.fightNo,
    this.mealItems,
    this.onlyPayLater,
    this.originDestinationOptions,
    this.passportMandatory,
    this.refundable,
    this.sequenceNumber,
    this.ticketType,
    this.validReturnCabinClasses,
    this.validatingAirlineCode,
    this.validatingAirlineName,
  });

  AirItineraryPricingInfo? airItineraryPricingInfo;
  bool? allowHold;
  List<ItemServiceRequest>? baggageItems;
  String? cabinClassName;
  String? directionInd;
  String? fightNo;
  List<ItemServiceRequest>? mealItems;
  bool? onlyPayLater;
  List<OriginDestinationOption>? originDestinationOptions;
  bool? passportMandatory;
  bool? refundable;
  String? sequenceNumber;
  String? ticketType;
  dynamic validReturnCabinClasses;
  String? validatingAirlineCode;
  String? validatingAirlineName;

  factory PricedItinerary.fromJson(Map<String, dynamic> json) => PricedItinerary(
        airItineraryPricingInfo: json["airItineraryPricingInfo"] == null
            ? null
            : AirItineraryPricingInfo.fromJson(json["airItineraryPricingInfo"]),
        allowHold: json["allowHold"],
        baggageItems: json["baggageItems"] == null
            ? []
            : List<ItemServiceRequest>.from(json["baggageItems"]!.map((x) => ItemServiceRequest.fromJson(x))),
        cabinClassName: json["cabinClassName"],
        directionInd: json["directionInd"],
        fightNo: json["fightNo"],
        mealItems: json["mealItems"] == null
            ? []
            : List<ItemServiceRequest>.from(json["mealItems"]!.map((x) => ItemServiceRequest.fromJson(x))),
        onlyPayLater: json["onlyPayLater"],
        originDestinationOptions: json["originDestinationOptions"] == null
            ? []
            : List<OriginDestinationOption>.from(
                json["originDestinationOptions"]!.map((x) => OriginDestinationOption.fromJson(x))),
        passportMandatory: json["passportMandatory"],
        refundable: json["refundable"],
        sequenceNumber: json["sequenceNumber"],
        ticketType: json["ticketType"],
        validReturnCabinClasses: json["validReturnCabinClasses"],
        validatingAirlineCode: json["validatingAirlineCode"],
        validatingAirlineName: json["validatingAirlineName"],
      );

  Map<String, dynamic> toJson() => {
        "airItineraryPricingInfo": airItineraryPricingInfo?.toJson(),
        "allowHold": allowHold,
        "baggageItems": baggageItems == null ? [] : List<dynamic>.from(baggageItems!.map((x) => x.toJson())),
        "cabinClassName": cabinClassName,
        "directionInd": directionInd,
        "fightNo": fightNo,
        "mealItems": mealItems,
        "onlyPayLater": onlyPayLater,
        "originDestinationOptions": originDestinationOptions == null
            ? []
            : List<dynamic>.from(originDestinationOptions!.map((x) => x.toJson())),
        "passportMandatory": passportMandatory,
        "refundable": refundable,
        "sequenceNumber": sequenceNumber,
        "ticketType": ticketType,
        "validReturnCabinClasses": validReturnCabinClasses,
        "validatingAirlineCode": validatingAirlineCode,
        "validatingAirlineName": validatingAirlineName,
      };
}

extension PricedItineraryMapper on PricedItinerary {
  OriginDestinationOption? originDestinationOptionDirection(String direction) {
    OriginDestinationOption? originDestinationOption = originDestinationOptions
        ?.firstWhereOrNull((element) => element.flightDirection?.toUpperCase() == direction.toUpperCase());
    return originDestinationOption;
  }
}
