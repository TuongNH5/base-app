// ignore_for_file: public_member_api_docs, sort_constructors_first

part of gtd_flight_repository_dto;

enum BookingFlightType { dom, inte, trip, unknown }

class DraftBookingDTO {
  String bookingCode;
  String bookingNumber;
  BookingFlightType bookingType;
  List<DraftItineraryInfoDTO> itineraryInfos;
  DraftBookingDTO({
    required this.bookingCode,
    required this.bookingNumber,
    required this.bookingType,
    this.itineraryInfos = const [],
  });
}

class DraftItineraryInfoDTO {
  FlightDirection direction;
  String fareSourceCode;
  String groupId;
  String searchId;
  BaseFare totalFare;
  DraftItineraryInfoDTO({
    required this.direction,
    required this.fareSourceCode,
    required this.groupId,
    required this.searchId,
    required this.totalFare,
  });
}

//Extension
extension DraftItineraryInfoMapper on DraftItineraryInfo {
  DraftItineraryInfoDTO toDraftItineraryInfoDTO() {
    FlightDirection flightDirection = FlightDirection.values.map((e) {
          e.value.toLowerCase() == bookingDirection?.toLowerCase();
          return e;
        }).firstOrNull ??
        FlightDirection.d;
    BaseFare totalFare = itinTotalFare?.totalFare ?? BaseFare(amount: 0.0);
    DraftItineraryInfoDTO draftItineraryInfoDTO = DraftItineraryInfoDTO(
        direction: flightDirection,
        fareSourceCode: fareSourceCode ?? "",
        groupId: groupId ?? "",
        searchId: searchId ?? "",
        totalFare: totalFare);
    return draftItineraryInfoDTO;
  }
}

extension DraftBookingRSMapper on DraftBookingRs {
  DraftBookingDTO toDraftBookingDTO() {
    BookingFlightType bookingFlightType = BookingFlightType.unknown;
    switch (bookingType) {
      case "DOME":
        bookingFlightType = BookingFlightType.dom;
        break;
      case "INTE":
        bookingFlightType = BookingFlightType.inte;
        break;
      case "TRIP":
        bookingFlightType = BookingFlightType.trip;
        break;
      default:
        bookingFlightType = BookingFlightType.unknown;
        break;
    }
    List<DraftItineraryInfoDTO> itineraryInfoDTOs = [];
    itineraryInfoDTOs.addAll([departDraftItineraryInfo?.toDraftItineraryInfoDTO()]
        .map((e) => e)
        .whereType<DraftItineraryInfoDTO>()
        .toList());
    itineraryInfoDTOs.addAll([returnDraftItineraryInfo?.toDraftItineraryInfoDTO()]
        .map((e) => e)
        .whereType<DraftItineraryInfoDTO>()
        .toList());
    DraftBookingDTO draftBookingDTO = DraftBookingDTO(
        bookingCode: bookingCode?.bookingCode ?? "",
        bookingNumber: bookingCode?.bookingNumber ?? "",
        bookingType: bookingFlightType,
        itineraryInfos: itineraryInfoDTOs);
    return draftBookingDTO;
  }
}
