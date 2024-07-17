

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_error_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_info_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_response.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_draft_booking_rs.dart';


class GtdComboDraftBookingRs extends GtdResponse {
  GtdHotelDraftBookingResult? booking;

  GtdComboDraftBookingRs({
    this.booking,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdComboDraftBookingRs.fromJson(Map<String, dynamic> json) => GtdComboDraftBookingRs(
        booking: json["booking"] == null ? null : GtdHotelDraftBookingResult.fromJson(json["booking"]),
        duration: json["duration"],
        textMessage: json["textMessage"],
        success: json["success"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": booking?.toJson(),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}
