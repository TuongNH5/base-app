// ignore_for_file: public_member_api_docs, sort_constructors_first

part of gtd_flight_repository_dto;

enum ServiceType {
  baggare("BAGGAGE"),
  meal("MEAL"),
  insurance("INSURANCE"),
  hotelAdditional("HOTEL_ADDITIONAL"),
  unknown("UNKNOWN");

  final String name;
  const ServiceType(this.name);
  static ServiceType typeByValue(String value) {
    switch (value) {
      case "BAGGAGE":
        return ServiceType.baggare;
      case "MEAL":
        return ServiceType.meal;
      case "INSURANCE":
        return ServiceType.insurance;
      case "HOTEL_ADDITIONAL":
        return ServiceType.hotelAdditional;
      default:
        return ServiceType.unknown;
    }
  }
}

class SsrOfferDTO {
  FlightDirection? bookingDirection;
  String bookingNumber;
  String? fareCode;
  ServiceType serviceType;
  double ssrAmount;
  String ssrCode;
  String ssrId;
  String ssrName;
  //SubType: DELAY | FLEXI
  String ssrSubType;
  int plandId;
  SsrOfferDTO({
    this.bookingDirection,
    this.bookingNumber = "",
    this.fareCode,
    this.serviceType = ServiceType.insurance,
    this.ssrAmount = 0,
    this.ssrCode = "",
    this.ssrId = "",
    this.ssrName = "",
    this.ssrSubType = "",
    this.plandId = 0,
  });
  factory SsrOfferDTO.fromSsrOfferRs(ItemServiceRequest itemRs,
      {String bookingNumber = "", FlightDirection? flightDirection}) {
    SsrOfferDTO ssrOfferDTO = SsrOfferDTO(
        bookingDirection: flightDirection,
        bookingNumber: bookingNumber,
        fareCode: itemRs.fareCode,
        serviceType: ServiceType.typeByValue(itemRs.serviceType ?? ""),
        ssrAmount: itemRs.amount ?? 0,
        ssrCode: itemRs.code ?? "",
        ssrId: itemRs.id ?? "",
        ssrName: itemRs.name ?? "",
        ssrSubType: itemRs.note ?? "");
    return ssrOfferDTO;
  }

  factory SsrOfferDTO.fromJson(Map<String, dynamic> json) => SsrOfferDTO(
        bookingDirection: json["bookingDirection"],
        bookingNumber: json["bookingNumber"],
        fareCode: json["fareCode"],
        serviceType: json["serviceType"],
        ssrAmount: json["ssrAmount"],
        ssrCode: json["ssrCode"],
        ssrId: json["ssrId"],
        ssrName: json["ssrName"],
      );

  Map<String, dynamic> toJson() => {
        "bookingDirection": bookingDirection?.value,
        "bookingNumber": bookingNumber,
        "fareCode": fareCode,
        "serviceType": serviceType.name,
        "ssrAmount": ssrAmount,
        "ssrCode": ssrCode,
        "ssrId": ssrId,
        "ssrName": ssrName,
      };
}

extension SsrOfferDTOMapper on SsrOfferDTO {
  static List<SsrOfferDTO> fromSSrOfferRs(SsrOfferRs ssrOfferRs) {
    List<SsrOfferDTO> departSsrDTOs = (ssrOfferRs.departSsrOfferItems ?? [])
        .map((e) => e.ssrItems)
        .whereType<List<ItemServiceRequest>>()
        .flattened
        .map((e) => SsrOfferDTO.fromSsrOfferRs(e,
            bookingNumber: ssrOfferRs.bookingNumber ?? "", flightDirection: FlightDirection.d))
        .toList();
    List<SsrOfferDTO> returnSsrDTOs = (ssrOfferRs.returnSsrOfferItems ?? [])
        .map((e) => e.ssrItems)
        .whereType<List<ItemServiceRequest>>()
        .flattened
        .map((e) => SsrOfferDTO.fromSsrOfferRs(e,
            bookingNumber: ssrOfferRs.bookingNumber ?? "", flightDirection: FlightDirection.r))
        .toList();
    List<SsrOfferDTO> dtos = [...departSsrDTOs, ...returnSsrDTOs];
    return dtos;
  }

  static SsrOfferDTO fromInsurancePlan(InsurancePlan insurancePlan, FlightDirection flightDirection, {double? amount}) {
    SsrOfferDTO offerDTO = SsrOfferDTO(
        bookingDirection: flightDirection,
        ssrAmount: amount ?? (insurancePlan.extras?.insuranceBreakdown?.firstOrNull?.premiumAmount ?? 0),
        ssrCode: insurancePlan.code!,
        ssrId: insurancePlan.id!,
        ssrName: insurancePlan.name!,
        serviceType: ServiceType.insurance,
        ssrSubType: insurancePlan.extras!.insuranceType!);
    return offerDTO;
  }

  ServiceRequest toServiceRequest() {
    ServiceRequest serviceRequest = ServiceRequest(
        bookingDirection: bookingDirection?.value,
        bookingNumber: bookingNumber,
        fareCode: fareCode,
        serviceType: serviceType.name,
        ssrAmount: ssrAmount,
        ssrCode: ssrCode,
        ssrId: ssrId,
        ssrName: ssrName);
    return serviceRequest;
  }
}
