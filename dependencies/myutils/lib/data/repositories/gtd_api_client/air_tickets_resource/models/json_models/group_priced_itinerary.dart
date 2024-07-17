
import 'package:myutils/data/network/models/gtd_json_model.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/priced_itinerary.dart';


class GroupPricedItinerary extends GTDJsonModel {
    GroupPricedItinerary({
        this.airSupplier,
        this.aircraft,
        this.vnaArea,
        this.airline,
        this.airlineName,
        this.arrivalDateTime,
        this.departureDateTime,
        this.destinationCity,
        this.destinationCountry,
        this.destinationCountryCode,
        this.destinationLocationCode,
        this.destinationLocationName,
        this.fightNo,
        this.flightType,
        this.groupId,
        this.originCity,
        this.originCountry,
        this.originCountryCode,
        this.originLocationCode,
        this.originLocationName,
        this.pricedItineraries,
        this.requiredFields,
        this.returnDateTime,
        this.roundType,
        this.totalPricedItinerary,
    });

    String? airSupplier;
    String? aircraft;
    dynamic vnaArea;
    String? airline;
    String? airlineName;
    DateTime? arrivalDateTime;
    DateTime? departureDateTime;
    String? destinationCity;
    String? destinationCountry;
    String? destinationCountryCode;
    String? destinationLocationCode;
    String? destinationLocationName;
    String? fightNo;
    String? flightType;
    String? groupId;
    String? originCity;
    String? originCountry;
    String? originCountryCode;
    String? originLocationCode;
    String? originLocationName;
    List<PricedItinerary>? pricedItineraries;
    dynamic requiredFields;
    dynamic returnDateTime;
    String? roundType;
    int? totalPricedItinerary;

    factory GroupPricedItinerary.fromJson(Map<String, dynamic> json) => GroupPricedItinerary(
        airSupplier: json["airSupplier"],
        aircraft: json["aircraft"],
        vnaArea: json["vnaArea"],
        airline: json["airline"],
        airlineName: json["airlineName"],
        arrivalDateTime: json["arrivalDateTime"] == null ? null : DateTime.parse(json["arrivalDateTime"]),
        departureDateTime: json["departureDateTime"] == null ? null : DateTime.parse(json["departureDateTime"]),
        destinationCity: json["destinationCity"],
        destinationCountry: json["destinationCountry"],
        destinationCountryCode: json["destinationCountryCode"],
        destinationLocationCode: json["destinationLocationCode"],
        destinationLocationName: json["destinationLocationName"],
        fightNo: json["fightNo"],
        flightType: json["flightType"],
        groupId: json["groupId"],
        originCity: json["originCity"],
        originCountry: json["originCountry"],
        originCountryCode: json["originCountryCode"],
        originLocationCode: json["originLocationCode"],
        originLocationName: json["originLocationName"],
        pricedItineraries: json["pricedItineraries"] == null ? [] : List<PricedItinerary>.from(json["pricedItineraries"]!.map((x) => PricedItinerary.fromJson(x))),
        requiredFields: json["requiredFields"],
        returnDateTime: json["returnDateTime"],
        roundType: json["roundType"],
        totalPricedItinerary: json["totalPricedItinerary"],
    );

    Map<String, dynamic> toJson() => {
        "airSupplier": airSupplier,
        "aircraft": aircraft,
        "vnaArea": vnaArea,
        "airline": airline,
        "airlineName": airlineName,
        "arrivalDateTime": arrivalDateTime?.toIso8601String(),
        "departureDateTime": departureDateTime?.toIso8601String(),
        "destinationCity": destinationCity,
        "destinationCountry": destinationCountry,
        "destinationCountryCode": destinationCountryCode,
        "destinationLocationCode": destinationLocationCode,
        "destinationLocationName": destinationLocationName,
        "fightNo": fightNo,
        "flightType": flightType,
        "groupId": groupId,
        "originCity": originCity,
        "originCountry": originCountry,
        "originCountryCode": originCountryCode,
        "originLocationCode": originLocationCode,
        "originLocationName": originLocationName,
        "pricedItineraries": pricedItineraries == null ? [] : List<dynamic>.from(pricedItineraries!.map((x) => x.toJson())),
        "requiredFields": requiredFields,
        "returnDateTime": returnDateTime,
        "roundType": roundType,
        "totalPricedItinerary": totalPricedItinerary,
    };
}