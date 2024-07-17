import 'package:myutils/helpers/extension/date_time_extension.dart';

import 'airport_segment.dart';
import 'operating_airline.dart';

class FlightSegment {
  FlightSegment({
    this.adultBaggage,
    this.aircraft,
    this.arrivalAirport,
    this.arrivalAirportLocationCode,
    this.arrivalAirportLocationName,
    this.arrivalCity,
    this.arrivalDateTime,
    this.cabinClassCode,
    this.cabinClassName,
    this.cabinClassText,
    this.childBaggage,
    this.departureAirport,
    this.departureAirportLocationCode,
    this.departureAirportLocationName,
    this.departureCity,
    this.departureDateTime,
    this.eticket,
    this.fareBasicCode,
    this.fareCode,
    this.flightDirection,
    this.flightNumber,
    this.infantBaggage,
    this.journeyDuration,
    this.marketingAirlineCode,
    this.marriageGroup,
    this.mealCode,
    this.operatingAirline,
    this.resBookDesignCode,
    this.seatsRemaining,
    this.stopQuantity,
    this.stopQuantityInfo,
    this.supplierFareKey,
    this.supplierJourneyKey,
  });

  dynamic adultBaggage;
  String? aircraft;
  AirportSegment? arrivalAirport;
  String? arrivalAirportLocationCode;
  String? arrivalAirportLocationName;
  String? arrivalCity;
  DateTime? arrivalDateTime;
  String? cabinClassCode;
  String? cabinClassName;
  String? cabinClassText;
  dynamic childBaggage;
  AirportSegment? departureAirport;
  String? departureAirportLocationCode;
  String? departureAirportLocationName;
  String? departureCity;
  DateTime? departureDateTime;
  bool? eticket;
  String? fareBasicCode;
  String? fareCode;
  String? flightDirection;
  String? flightNumber;
  dynamic infantBaggage;
  int? journeyDuration;
  String? marketingAirlineCode;
  dynamic marriageGroup;
  dynamic mealCode;
  OperatingAirline? operatingAirline;
  String? resBookDesignCode;
  dynamic seatsRemaining;
  int? stopQuantity;
  StopQuantityInfo? stopQuantityInfo;
  String? supplierFareKey;
  String? supplierJourneyKey;

  factory FlightSegment.fromJson(Map<String, dynamic> json) => FlightSegment(
        adultBaggage: json["adultBaggage"],
        aircraft: json["aircraft"],
        arrivalAirport: json["arrivalAirport"] == null ? null : AirportSegment.fromJson(json["arrivalAirport"]),
        arrivalAirportLocationCode: json["arrivalAirportLocationCode"],
        arrivalAirportLocationName: json["arrivalAirportLocationName"],
        arrivalCity: json["arrivalCity"],
        arrivalDateTime: json["arrivalDateTime"] == null ? null : DateTime.parse(json["arrivalDateTime"]),
        cabinClassCode: json["cabinClassCode"],
        cabinClassName: json["cabinClassName"],
        cabinClassText: json["cabinClassText"],
        childBaggage: json["childBaggage"],
        departureAirport: json["departureAirport"] == null ? null : AirportSegment.fromJson(json["departureAirport"]),
        departureAirportLocationCode: json["departureAirportLocationCode"],
        departureAirportLocationName: json["departureAirportLocationName"],
        departureCity: json["departureCity"],
        departureDateTime: json["departureDateTime"] == null ? null : DateTime.parse(json["departureDateTime"]),
        eticket: json["eticket"],
        fareBasicCode: json["fareBasicCode"],
        fareCode: json["fareCode"],
        flightDirection: json["flightDirection"],
        flightNumber: json["flightNumber"],
        infantBaggage: json["infantBaggage"],
        journeyDuration: json["journeyDuration"],
        marketingAirlineCode: json["marketingAirlineCode"],
        marriageGroup: json["marriageGroup"],
        mealCode: json["mealCode"],
        operatingAirline: json["operatingAirline"] == null ? null : OperatingAirline.fromJson(json["operatingAirline"]),
        resBookDesignCode: json["resBookDesignCode"],
        seatsRemaining: json["seatsRemaining"],
        stopQuantity: json["stopQuantity"],
        stopQuantityInfo: json["stopQuantityInfo"] == null ? null : StopQuantityInfo.fromJson(json["stopQuantityInfo"]),
        supplierFareKey: json["supplierFareKey"],
        supplierJourneyKey: json["supplierJourneyKey"],
      );

  Map<String, dynamic> toJson() => {
        "adultBaggage": adultBaggage,
        "aircraft": aircraft,
        "arrivalAirport": arrivalAirport?.toJson(),
        "arrivalAirportLocationCode": arrivalAirportLocationCode,
        "arrivalAirportLocationName": arrivalAirportLocationName,
        "arrivalCity": arrivalCity,
        "arrivalDateTime": arrivalDateTime?.toIso8601String(),
        "cabinClassCode": cabinClassCode,
        "cabinClassName": cabinClassName,
        "cabinClassText": cabinClassText,
        "childBaggage": childBaggage,
        "departureAirport": departureAirport?.toJson(),
        "departureAirportLocationCode": departureAirportLocationCode,
        "departureAirportLocationName": departureAirportLocationName,
        "departureCity": departureCity,
        "departureDateTime": departureDateTime?.toIso8601String(),
        "eticket": eticket,
        "fareBasicCode": fareBasicCode,
        "fareCode": fareCode,
        "flightDirection": flightDirection,
        "flightNumber": flightNumber,
        "infantBaggage": infantBaggage,
        "journeyDuration": journeyDuration,
        "marketingAirlineCode": marketingAirlineCode,
        "marriageGroup": marriageGroup,
        "mealCode": mealCode,
        "operatingAirline": operatingAirline?.toJson(),
        "resBookDesignCode": resBookDesignCode,
        "seatsRemaining": seatsRemaining,
        "stopQuantity": stopQuantity,
        "stopQuantityInfo": stopQuantityInfo,
        "supplierFareKey": supplierFareKey,
        "supplierJourneyKey": supplierJourneyKey,
      };
}

class StopQuantityInfo {
  String? locationCode;
  dynamic locationName;
  dynamic city;
  int? duration;
  DateTime? arrivalDateTime;
  DateTime? departureDateTime;

  StopQuantityInfo({
    this.locationCode,
    this.locationName,
    this.city,
    this.duration,
    this.arrivalDateTime,
    this.departureDateTime,
  });

  factory StopQuantityInfo.fromJson(Map<String, dynamic> json) => StopQuantityInfo(
        locationCode: json["locationCode"],
        locationName: json["locationName"],
        city: json["city"],
        duration: json["duration"],
        arrivalDateTime: json["arrivalDateTime"] == null ? null : DateTime.parse(json["arrivalDateTime"]),
        departureDateTime: json["departureDateTime"] == null ? null : DateTime.parse(json["departureDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "locationCode": locationCode,
        "locationName": locationName,
        "city": city,
        "duration": duration,
        "arrivalDateTime": arrivalDateTime?.toIso8601String(),
        "departureDateTime": departureDateTime?.toIso8601String(),
      };
}

extension FlightSegmentHelpper on FlightSegment {
  String get flightDetailSubtitle {
    return "${operatingAirline?.code}$flightNumber | $aircraft";
  }

  String journeyDurationDate() {
    return GtdDateTime.timeStampToDateString(journeyDuration ?? 0);
  }

  String stopQuantityDurationHour() {
    return GtdDateTime.timeStampToDateString(stopQuantityInfo?.duration ?? 0);
  }

  String get airlineLogo {
    String airline = operatingAirline?.code ?? "";
    String? airlineCode = (airline == "VFC" || airline == "0V" || airline == "BL") ? "VN" : airline;
    if (airlineCode == "BL" || airlineCode == "VN" || airlineCode == "QH" || airlineCode == "VJ") {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.png';
    } else {
      return 'https://750bc7d3dc6109b.cmccloud.com.vn/Booking/AirBooking/images/AirLogos/$airlineCode.gif';
    }
  }

  String get departureTime {
    return departureDateTime?.utcDate("HH:mm") ?? "";
  }

  String get departureDate {
    return departureDateTime?.utcDate("EEE, dd/MM/yyyy") ?? "";
  }

  String get arrivalTime {
    return arrivalDateTime?.utcDate("HH:mm") ?? "";
  }

  String get arrivalDate {
    return arrivalDateTime?.utcDate("EEE, dd/MM/yyyy") ?? "";
  }
}
