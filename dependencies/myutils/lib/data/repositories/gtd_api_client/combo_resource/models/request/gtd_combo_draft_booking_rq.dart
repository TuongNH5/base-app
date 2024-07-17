

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/gtd_flight_draft_booking_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/request/gtd_hotel_checkout_rq.dart';

class GtdComboDraftBookingRq {
    GtdHotelCheckoutRq createDraftBookingHotelPayload;
    GtdFlightDraftBookingRq ticketDraftBookingVm;

    GtdComboDraftBookingRq({
        required this.createDraftBookingHotelPayload,
        required this.ticketDraftBookingVm,
    });

    factory GtdComboDraftBookingRq.fromJson(Map<String, dynamic> json) => GtdComboDraftBookingRq(
        createDraftBookingHotelPayload: GtdHotelCheckoutRq.fromJson(json["createDraftBookingHotelPayload"]),
        ticketDraftBookingVm: GtdFlightDraftBookingRq.fromJson(json["ticketDraftBookingVM"]),
    );

    Map<String, dynamic> toJson() => {
        "createDraftBookingHotelPayload": createDraftBookingHotelPayload.toJson(),
        "ticketDraftBookingVM": ticketDraftBookingVm.toJson(),
    };
}