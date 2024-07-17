import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/booking_code.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/itin_total_fare.dart';

import 'gtd_error_rs.dart';
import 'gtd_info_rs.dart';

class DraftBookingRs extends GtdResponse {
  DraftBookingRs({
    this.bookingCode,
    this.bookingType,
    this.departDraftItineraryInfo,
    this.isPerBookingType,
    this.isRoundTripType,
    this.markupType,
    this.returnDraftItineraryInfo,
    this.roundType,
    super.isSuccess,
    super.duration,
    super.errors,
    super.infos,
    super.success,
    super.textMessage,
  });

  BookingCode? bookingCode;
  String? bookingType;
  DraftItineraryInfo? departDraftItineraryInfo;
  bool? isPerBookingType;
  bool? isRoundTripType;
  String? markupType;
  DraftItineraryInfo? returnDraftItineraryInfo;
  String? roundType;

  factory DraftBookingRs.fromJson(Map<String, dynamic> json) => DraftBookingRs(
        bookingCode: json["bookingCode"] == null ? null : BookingCode.fromJson(json["bookingCode"]),
        bookingType: json["bookingType"],
        departDraftItineraryInfo: json["departDraftItineraryInfo"] == null
            ? null
            : DraftItineraryInfo.fromJson(json["departDraftItineraryInfo"]),
        duration: json["duration"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        isPerBookingType: json["isPerBookingType"],
        isRoundTripType: json["isRoundTripType"],
        isSuccess: json["isSuccess"],
        markupType: json["markupType"],
        returnDraftItineraryInfo: json["returnDraftItineraryInfo"] == null
            ? null
            : DraftItineraryInfo.fromJson(json["returnDraftItineraryInfo"]),
        roundType: json["roundType"],
        success: json["success"],
        textMessage: json["textMessage"],
      );

  Map<String, dynamic> toJson() => {
        "bookingCode": bookingCode?.toJson(),
        "bookingType": bookingType,
        "departDraftItineraryInfo": departDraftItineraryInfo?.toJson(),
        "duration": duration,
        "errors": errors,
        "infos": infos,
        "isPerBookingType": isPerBookingType,
        "isRoundTripType": isRoundTripType,
        "isSuccess": isSuccess,
        "markupType": markupType,
        "returnDraftItineraryInfo": returnDraftItineraryInfo?.toJson(),
        "roundType": roundType,
        "success": success,
        "textMessage": textMessage,
      };
}

class DraftItineraryInfo {
  DraftItineraryInfo({
    this.bookingDirection,
    this.fareSourceCode,
    this.groupId,
    this.itinTotalFare,
    this.searchId,
  });

  String? bookingDirection;
  String? fareSourceCode;
  String? groupId;
  ItinTotalFare? itinTotalFare;
  String? searchId;

  factory DraftItineraryInfo.fromJson(Map<String, dynamic> json) => DraftItineraryInfo(
        bookingDirection: json["bookingDirection"],
        fareSourceCode: json["fareSourceCode"],
        groupId: json["groupId"],
        itinTotalFare: json["itinTotalFare"] == null ? null : ItinTotalFare.fromJson(json["itinTotalFare"]),
        searchId: json["searchId"],
      );

  Map<String, dynamic> toJson() => {
        "bookingDirection": bookingDirection,
        "fareSourceCode": fareSourceCode,
        "groupId": groupId,
        "itinTotalFare": itinTotalFare?.toJson(),
        "searchId": searchId,
      };
}
