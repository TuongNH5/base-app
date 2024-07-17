import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

class SsrOfferRs extends GtdResponse {
  String? bookingNumber;
  List<SsrOfferItemRs>? departSsrOfferItems;

  List<SsrOfferItemRs>? returnSsrOfferItems;


  SsrOfferRs({
    this.bookingNumber,
    this.departSsrOfferItems,
    super.duration,
    super.errors,
    super.infos,
    this.returnSsrOfferItems,
    super.success,
    super.textMessage,
  });

  factory SsrOfferRs.fromRawJson(String str) => SsrOfferRs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SsrOfferRs.fromJson(Map<String, dynamic> json) => SsrOfferRs(
        bookingNumber: json["bookingNumber"],
        departSsrOfferItems: json["departSsrOfferItems"] == null
            ? []
            : List<SsrOfferItemRs>.from(
                json["departSsrOfferItems"]!.map((x) => SsrOfferItemRs.fromJson(x))),
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        returnSsrOfferItems: json["returnSsrOfferItems"] == null
            ? []
            : List<SsrOfferItemRs>.from(
                json["returnSsrOfferItems"]!.map((x) => SsrOfferItemRs.fromJson(x))),
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "bookingNumber": bookingNumber,
        "departSsrOfferItems": departSsrOfferItems == null
            ? []
            : List<dynamic>.from(departSsrOfferItems!.map((x) => x.toJson())),
        "duration": duration,
        "errors": errors,
        "infos": infos,
        "returnSsrOfferItems": returnSsrOfferItems == null
            ? []
            : List<dynamic>.from(returnSsrOfferItems!.map((x) => x.toJson())),
        "success": success,
        "textMessage": textMessage,
      };
}

class SsrOfferItemRs {
  String? arrivalAirportLocationCode;
  String? arrivalAirportLocationName;
  String? arrivalCity;
  DateTime? arrivalDateTime;
  String? departureAirportLocationCode;
  String? departureAirportLocationName;
  String? departureCity;
  DateTime? departureDateTime;
  List<ItemServiceRequest>? ssrItems;

  SsrOfferItemRs({
    this.arrivalAirportLocationCode,
    this.arrivalAirportLocationName,
    this.arrivalCity,
    this.arrivalDateTime,
    this.departureAirportLocationCode,
    this.departureAirportLocationName,
    this.departureCity,
    this.departureDateTime,
    this.ssrItems,
  });

  factory SsrOfferItemRs.fromRawJson(String str) => SsrOfferItemRs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SsrOfferItemRs.fromJson(Map<String, dynamic> json) => SsrOfferItemRs(
        arrivalAirportLocationCode: json["arrivalAirportLocationCode"],
        arrivalAirportLocationName: json["arrivalAirportLocationName"],
        arrivalCity: json["arrivalCity"],
        arrivalDateTime:
            json["arrivalDateTime"] == null ? null : DateTime.parse(json["arrivalDateTime"]),
        departureAirportLocationCode: json["departureAirportLocationCode"],
        departureAirportLocationName: json["departureAirportLocationName"],
        departureCity: json["departureCity"],
        departureDateTime:
            json["departureDateTime"] == null ? null : DateTime.parse(json["departureDateTime"]),
        ssrItems: json["ssrItems"] == null
            ? []
            : List<ItemServiceRequest>.from(
                json["ssrItems"]!.map((x) => ItemServiceRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "arrivalAirportLocationCode": arrivalAirportLocationCode,
        "arrivalAirportLocationName": arrivalAirportLocationName,
        "arrivalCity": arrivalCity,
        "arrivalDateTime": arrivalDateTime?.toIso8601String(),
        "departureAirportLocationCode": departureAirportLocationCode,
        "departureAirportLocationName": departureAirportLocationName,
        "departureCity": departureCity,
        "departureDateTime": departureDateTime?.toIso8601String(),
        "ssrItems": ssrItems == null ? [] : List<dynamic>.from(ssrItems!.map((x) => x.toJson())),
      };
}

// class SsrItem {
//   int? amount;
//   String? code;
//   String? direction;
//   String? fareCode;
//   String? id;
//   String? name;
//   String? serviceType;

//   SsrItem({
//     this.amount,
//     this.code,
//     this.direction,
//     this.fareCode,
//     this.id,
//     this.name,
//     this.serviceType,
//   });

//   factory SsrItem.fromRawJson(String str) => SsrItem.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory SsrItem.fromJson(Map<String, dynamic> json) => SsrItem(
//         amount: json["amount"],
//         code: json["code"],
//         direction: json["direction"],
//         fareCode: json["fareCode"],
//         id: json["id"],
//         name: json["name"],
//         serviceType: json["serviceType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "amount": amount,
//         "code": code,
//         "direction": direction,
//         "fareCode": fareCode,
//         "id": id,
//         "name": name,
//         "serviceType": serviceType,
//       };
// }
