// To parse this JSON data, do
//
//     final bookingDetailRs = bookingDetailRsFromJson(jsonString);

import 'package:collection/collection.dart';

import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/group_priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/json_models/priced_itinerary.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/search_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_product.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/origin_destination_option.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';


// BookingDetailRs bookingDetailRsFromJson(String str) => BookingDetailRs.fromJson(json.decode(str));

// String bookingDetailRsToJson(BookingDetailRs data) => json.encode(data.toJson());

class BookingDetailRs {
  BookingDetailRs({
    this.id,
    this.updatedDate,
    this.cacheType,
    this.orgCode,
    this.agencyCode,
    this.branchCode,
    this.saleChannel,
    this.channelType,
    this.supplierType,
    this.bookingCode,
    this.bookingType,
    this.agentCode,
    this.customerCode,
    this.bookingNumber,
    this.bookingDate,
    this.markupType,
    this.bookingInfo,
    this.groupPricedItineraries,
    this.hotelAvailability,
    this.hotelProductPayload,
    this.hotelProduct,
    this.tourActivityProduct,
    this.tourActivityBookingPayload,
    this.offlineBooking,
    this.offlineBookingRequest,
    this.travelerInfo,
    this.isPerBookingType,
  });

  String? id;
  String? updatedDate;
  String? cacheType;
  String? orgCode;
  String? agencyCode;
  dynamic branchCode;
  String? saleChannel;
  String? channelType;
  String? supplierType;
  String? bookingCode;
  String? bookingType;
  String? agentCode;
  String? customerCode;
  String? bookingNumber;
  String? bookingDate;
  String? markupType;
  BookingInfoElement? bookingInfo;
  List<GroupPricedItinerary>? groupPricedItineraries;
  dynamic hotelAvailability;
  dynamic hotelProductPayload;
  HotelProduct? hotelProduct;
  dynamic tourActivityProduct;
  dynamic tourActivityBookingPayload;
  dynamic offlineBooking;
  dynamic offlineBookingRequest;
  BookingDetailRsTravelerInfo? travelerInfo;
  bool? isPerBookingType;

  factory BookingDetailRs.fromJson(Map<String, dynamic> json) => BookingDetailRs(
        id: json["id"],
        updatedDate: json["updatedDate"],
        cacheType: json["cacheType"],
        orgCode: json["orgCode"],
        agencyCode: json["agencyCode"],
        branchCode: json["branchCode"],
        saleChannel: json["saleChannel"],
        channelType: json["channelType"],
        supplierType: json["supplierType"],
        bookingCode: json["bookingCode"],
        bookingType: json["bookingType"],
        agentCode: json["agentCode"],
        customerCode: json["customerCode"],
        bookingNumber: json["bookingNumber"],
        bookingDate: json["bookingDate"],
        markupType: json["markupType"],
        bookingInfo: json["bookingInfo"] == null ? null : BookingInfoElement.fromJson(json["bookingInfo"]),
        groupPricedItineraries: json["groupPricedItineraries"] == null
            ? []
            : List<GroupPricedItinerary>.from(
                json["groupPricedItineraries"]!.map((x) => GroupPricedItinerary.fromJson(x))),
        hotelAvailability: json["hotelAvailability"],
        hotelProductPayload: json["hotelProductPayload"],
        hotelProduct: json["hotelProduct"] == null ? null : HotelProduct.fromJson(json["hotelProduct"]),
        tourActivityProduct: json["tourActivityProduct"],
        tourActivityBookingPayload: json["tourActivityBookingPayload"],
        offlineBooking: json["offlineBooking"],
        offlineBookingRequest: json["offlineBookingRequest"],
        travelerInfo: json["travelerInfo"] == null ? null : BookingDetailRsTravelerInfo.fromJson(json["travelerInfo"]),
        isPerBookingType: json["isPerBookingType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updatedDate": updatedDate,
        "cacheType": cacheType,
        "orgCode": orgCode,
        "agencyCode": agencyCode,
        "branchCode": branchCode,
        "saleChannel": saleChannel,
        "channelType": channelType,
        "supplierType": supplierType,
        "bookingCode": bookingCode,
        "bookingType": bookingType,
        "agentCode": agentCode,
        "customerCode": customerCode,
        "bookingNumber": bookingNumber,
        "bookingDate": bookingDate,
        "markupType": markupType,
        "bookingInfo": bookingInfo?.toJson(),
        "groupPricedItineraries":
            groupPricedItineraries == null ? [] : List<GroupPricedItinerary>.from(groupPricedItineraries!.map((x) => x.toJson())),
        "hotelAvailability": hotelAvailability,
        "hotelProductPayload": hotelProductPayload,
        "hotelProduct": hotelProduct,
        "tourActivityProduct": tourActivityProduct,
        "tourActivityBookingPayload": tourActivityBookingPayload,
        "offlineBooking": offlineBooking,
        "offlineBookingRequest": offlineBookingRequest,
        "travelerInfo": travelerInfo?.toJson(),
        "isPerBookingType": isPerBookingType,
      };
}

class AgencyMarkupInfo {
  AgencyMarkupInfo({
    this.agencyCode,
    this.baseFare,
    this.equivFare,
    this.serviceTax,
    this.totalFare,
    this.totalTax,
    this.markupValue,
    this.agencyMarkupValue,
  });

  String? agencyCode;
  double? baseFare;
  double? equivFare;
  double? serviceTax;
  double? totalFare;
  double? totalTax;
  double? markupValue;
  double? agencyMarkupValue;

  factory AgencyMarkupInfo.fromJson(Map<String, dynamic> json) => AgencyMarkupInfo(
        agencyCode: json["agencyCode"],
        baseFare: json["baseFare"],
        equivFare: json["equivFare"],
        serviceTax: json["serviceTax"],
        totalFare: json["totalFare"],
        totalTax: json["totalTax"],
        markupValue: json["markupValue"],
        agencyMarkupValue: json["agencyMarkupValue"],
      );

  Map<String, dynamic> toJson() => {
        "agencyCode": agencyCode,
        "baseFare": baseFare,
        "equivFare": equivFare,
        "serviceTax": serviceTax,
        "totalFare": totalFare,
        "totalTax": totalTax,
        "markupValue": markupValue,
        "agencyMarkupValue": agencyMarkupValue,
      };
}

class BookingInfoContactInfo {
  int? id;
  String? bookingNumber;
  String? contactType;
  String? contactLevel;
  String? gender;
  String? firstName;
  String? surName;
  String? email;
  String? ccEmail;
  String? country;
  String? city;
  String? address1;
  String? address2;
  String? postalCode;
  String? phoneCode1;
  String? phoneNumber1;
  String? phoneCode2;
  String? phoneNumber2;
  dynamic bookingId;
  DateTime? dob;

  BookingInfoContactInfo({
    this.id,
    this.bookingNumber,
    this.contactType,
    this.contactLevel,
    this.gender,
    this.firstName,
    this.surName,
    this.email,
    this.ccEmail,
    this.country,
    this.city,
    this.address1,
    this.address2,
    this.postalCode,
    this.phoneCode1,
    this.phoneNumber1,
    this.phoneCode2,
    this.phoneNumber2,
    this.bookingId,
    this.dob,
  });

  factory BookingInfoContactInfo.fromJson(Map<String, dynamic> json) => BookingInfoContactInfo(
        id: json["id"],
        bookingNumber: json["bookingNumber"],
        contactType: json["contactType"],
        contactLevel: json["contactLevel"],
        gender: json["gender"],
        firstName: json["firstName"],
        surName: json["surName"],
        email: json["email"],
        ccEmail: json["ccEmail"],
        country: json["country"],
        city: json["city"],
        address1: json["address1"],
        address2: json["address2"],
        postalCode: json["postalCode"],
        phoneCode1: json["phoneCode1"],
        phoneNumber1: json["phoneNumber1"],
        phoneCode2: json["phoneCode2"],
        phoneNumber2: json["phoneNumber2"],
        bookingId: json["bookingId"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingNumber": bookingNumber,
        "contactType": contactType,
        "contactLevel": contactLevel,
        "gender": gender,
        "firstName": firstName,
        "surName": surName,
        "email": email,
        "ccEmail": ccEmail,
        "country": country,
        "city": city,
        "address1": address1,
        "address2": address2,
        "postalCode": postalCode,
        "phoneCode1": phoneCode1,
        "phoneNumber1": phoneNumber1,
        "phoneCode2": phoneCode2,
        "phoneNumber2": phoneNumber2,
        "bookingId": bookingId,
        "dob": dob?.toIso8601String(),
      };
}

class DisplayPriceInfo {
  DisplayPriceInfo({
    this.bookingNumber,
    this.baseFare,
    this.equivFare,
    this.serviceTax,
    this.totalFare,
    this.totalTax,
    this.agencyMarkupValue,
    this.markupValue,
    this.totalSsrValue,
    this.cancellationFee,
    this.paymentFee,
    this.discountAmount,
    this.additionalFee,
    this.additionalTaxPerTraveler,
    this.vat,
  });

  String? bookingNumber;
  double? baseFare;
  double? equivFare;
  double? serviceTax;
  double? totalFare;
  double? totalTax;
  double? agencyMarkupValue;
  double? markupValue;
  double? totalSsrValue;
  double? cancellationFee;
  double? paymentFee;
  double? discountAmount;
  double? additionalFee;
  double? additionalTaxPerTraveler;
  dynamic vat;

  factory DisplayPriceInfo.fromJson(Map<String, dynamic> json) => DisplayPriceInfo(
        bookingNumber: json["bookingNumber"],
        baseFare: json["baseFare"],
        equivFare: json["equivFare"],
        serviceTax: json["serviceTax"],
        totalFare: json["totalFare"],
        totalTax: json["totalTax"],
        agencyMarkupValue: json["agencyMarkupValue"],
        markupValue: json["markupValue"],
        totalSsrValue: json["totalSsrValue"],
        cancellationFee: json["cancellationFee"],
        paymentFee: json["paymentFee"],
        discountAmount: json["discountAmount"],
        additionalFee: json["additionalFee"],
        additionalTaxPerTraveler: json["additionalTaxPerTraveler"],
        vat: json["vat"],
      );

  Map<String, dynamic> toJson() => {
        "bookingNumber": bookingNumber,
        "baseFare": baseFare,
        "equivFare": equivFare,
        "serviceTax": serviceTax,
        "totalFare": totalFare,
        "totalTax": totalTax,
        "agencyMarkupValue": agencyMarkupValue,
        "markupValue": markupValue,
        "totalSsrValue": totalSsrValue,
        "cancellationFee": cancellationFee,
        "paymentFee": paymentFee,
        "discountAmount": discountAmount,
        "additionalFee": additionalFee,
        "additionalTaxPerTraveler": additionalTaxPerTraveler,
        "vat": vat,
      };
}

class TransactionInfo {
  TransactionInfo({
    this.id,
    this.saleChannel,
    this.channelType,
    this.supplierType,
    this.bookingCode,
    this.bookingNumber,
    this.status,
    this.bookingDate,
    this.supplierCode,
    this.supplierName,
    this.bookingRefNo,
    this.passengerNameRecord,
    this.timeToLive,
    this.signature,
    this.detail,
    this.originLocationCode,
    this.destinationLocationCode,
    this.carrierNo,
    this.checkIn,
    this.checkOut,
    this.baseFare,
    this.equivFare,
    this.serviceTax,
    this.totalFare,
    this.totalTax,
    this.agencyMarkupValue,
    this.markupValue,
    this.totalSsrValue,
    this.markupKey,
    this.markupCode,
    this.markupFormula,
    this.paymentAmount,
    this.issuedStatus,
    this.issuedDate,
    this.etickets,
    this.listETickets,
    this.productSeqNumber,
    this.productClass,
    this.bookingDirection,
    this.noAdult,
    this.noChild,
    this.noInfant,
    this.quantity,
    this.unitId,
    this.b2CBasePrice,
    this.b2CTaxAndFees,
    this.adjustNet,
    this.adjustContract,
    this.b2CTotalPrice,
    this.supplierBookingStatus,
    this.supplierPaymentStatus,
    this.onlyPayLater,
    this.allowHold,
    this.refundable,
  });

  int? id;
  String? saleChannel;
  String? channelType;
  String? supplierType;
  String? bookingCode;
  String? bookingNumber;
  String? status;
  String? bookingDate;
  String? supplierCode;
  String? supplierName;
  String? bookingRefNo;
  String? passengerNameRecord;
  dynamic timeToLive;
  dynamic signature;
  String? detail;
  String? originLocationCode;
  String? destinationLocationCode;
  String? carrierNo;
  DateTime? checkIn;
  DateTime? checkOut;
  double? baseFare;
  double? equivFare;
  double? serviceTax;
  double? totalFare;
  double? totalTax;
  double? agencyMarkupValue;
  dynamic markupValue;
  double? totalSsrValue;
  String? markupKey;
  dynamic markupCode;
  dynamic markupFormula;
  dynamic paymentAmount;
  String? issuedStatus;
  dynamic issuedDate;
  dynamic etickets;
  dynamic listETickets;
  String? productSeqNumber;
  String? productClass;
  String? bookingDirection;
  int? noAdult;
  int? noChild;
  int? noInfant;
  int? quantity;
  dynamic unitId;
  double? b2CBasePrice;
  double? b2CTaxAndFees;
  double? adjustNet;
  double? adjustContract;
  double? b2CTotalPrice;
  String? supplierBookingStatus;
  dynamic supplierPaymentStatus;
  bool? onlyPayLater;
  bool? allowHold;
  bool? refundable;

  factory TransactionInfo.fromJson(Map<String, dynamic> json) => TransactionInfo(
        id: json["id"],
        saleChannel: json["saleChannel"],
        channelType: json["channelType"],
        supplierType: json["supplierType"],
        bookingCode: json["bookingCode"],
        bookingNumber: json["bookingNumber"],
        status: json["status"],
        bookingDate: json["bookingDate"],
        supplierCode: json["supplierCode"],
        supplierName: json["supplierName"],
        bookingRefNo: json["bookingRefNo"],
        passengerNameRecord: json["passengerNameRecord"],
        timeToLive: json["timeToLive"],
        signature: json["signature"],
        detail: json["detail"],
        originLocationCode: json["originLocationCode"],
        destinationLocationCode: json["destinationLocationCode"],
        carrierNo: json["carrierNo"],
        checkIn: json["checkIn"] == null ? null : DateTime.parse(json["checkIn"]),
        checkOut: json["checkOut"] == null ? null : DateTime.parse(json["checkOut"]),
        baseFare: json["baseFare"],
        equivFare: json["equivFare"],
        serviceTax: json["serviceTax"],
        totalFare: json["totalFare"],
        totalTax: json["totalTax"],
        agencyMarkupValue: json["agencyMarkupValue"],
        markupValue: json["markupValue"],
        totalSsrValue: json["totalSsrValue"],
        markupKey: json["markupKey"],
        markupCode: json["markupCode"],
        markupFormula: json["markupFormula"],
        paymentAmount: json["paymentAmount"],
        issuedStatus: json["issuedStatus"],
        issuedDate: json["issuedDate"],
        etickets: json["etickets"],
        listETickets: json["listETickets"],
        productSeqNumber: json["productSeqNumber"],
        productClass: json["productClass"],
        bookingDirection: json["bookingDirection"],
        noAdult: json["noAdult"],
        noChild: json["noChild"],
        noInfant: json["noInfant"],
        quantity: json["quantity"],
        unitId: json["unitId"],
        b2CBasePrice: json["b2cBasePrice"],
        b2CTaxAndFees: json["b2cTaxAndFees"],
        adjustNet: json["adjustNet"],
        adjustContract: json["adjustContract"],
        b2CTotalPrice: json["b2cTotalPrice"],
        supplierBookingStatus: json["supplierBookingStatus"],
        supplierPaymentStatus: json["supplierPaymentStatus"],
        onlyPayLater: json["onlyPayLater"],
        allowHold: json["allowHold"],
        refundable: json["refundable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "saleChannel": saleChannel,
        "channelType": channelType,
        "supplierType": supplierType,
        "bookingCode": bookingCode,
        "bookingNumber": bookingNumber,
        "status": status,
        "bookingDate": bookingDate,
        "supplierCode": supplierCode,
        "supplierName": supplierName,
        "bookingRefNo": bookingRefNo,
        "passengerNameRecord": passengerNameRecord,
        "timeToLive": timeToLive,
        "signature": signature,
        "detail": detail,
        "originLocationCode": originLocationCode,
        "destinationLocationCode": destinationLocationCode,
        "carrierNo": carrierNo,
        "checkIn": checkIn?.toIso8601String(),
        "checkOut": checkOut?.toIso8601String(),
        "baseFare": baseFare,
        "equivFare": equivFare,
        "serviceTax": serviceTax,
        "totalFare": totalFare,
        "totalTax": totalTax,
        "agencyMarkupValue": agencyMarkupValue,
        "markupValue": markupValue,
        "totalSsrValue": totalSsrValue,
        "markupKey": markupKey,
        "markupCode": markupCode,
        "markupFormula": markupFormula,
        "paymentAmount": paymentAmount,
        "issuedStatus": issuedStatus,
        "issuedDate": issuedDate,
        "etickets": etickets,
        "listETickets": listETickets,
        "productSeqNumber": productSeqNumber,
        "productClass": productClass,
        "bookingDirection": bookingDirection,
        "noAdult": noAdult,
        "noChild": noChild,
        "noInfant": noInfant,
        "quantity": quantity,
        "unitId": unitId,
        "b2cBasePrice": b2CBasePrice,
        "b2cTaxAndFees": b2CTaxAndFees,
        "adjustNet": adjustNet,
        "adjustContract": adjustContract,
        "b2cTotalPrice": b2CTotalPrice,
        "supplierBookingStatus": supplierBookingStatus,
        "supplierPaymentStatus": supplierPaymentStatus,
        "onlyPayLater": onlyPayLater,
        "allowHold": allowHold,
        "refundable": refundable,
      };
}

class TravelerInfoElement {
  int? id;
  String? bookingNumber;
  String? bookingTransCode;
  String? email;
  String? gender;
  String? firstName;
  String? surName;
  DateTime? dob;
  String? adultType;
  String? country;
  String? city;
  String? address1;
  String? address2;
  String? postalCode;
  String? phoneNumber1;
  String? phoneNumber2;
  String? phoneNumber3;
  String? phoneNumber4;
  String? phoneNumber5;
  String? documentType;
  String? nationality;
  String? documentNumber;
  String? documentExpiredDate;
  String? documentIssuedDate;
  String? documentIssuingCountry;
  bool? memberCard;
  String? memberCardType;
  String? memberCardNumber;
  String? memberCardExpiredDate;
  int? orderIdx;
  dynamic eticket;
  AdminFee? eTicketList;
  AdminFee? adminFee;
  String? bookingId;
  double? paxFee;
  double? baseFare;
  double? baseTax;
  dynamic personRepresentation;
  String? travelerCode;
  List<ServiceRequest>? serviceRequests;

  TravelerInfoElement({
    this.id,
    this.bookingNumber,
    this.bookingTransCode,
    this.email,
    this.gender,
    this.firstName,
    this.surName,
    this.dob,
    this.adultType,
    this.country,
    this.city,
    this.address1,
    this.address2,
    this.postalCode,
    this.phoneNumber1,
    this.phoneNumber2,
    this.phoneNumber3,
    this.phoneNumber4,
    this.phoneNumber5,
    this.documentType,
    this.nationality,
    this.documentNumber,
    this.documentExpiredDate,
    this.documentIssuedDate,
    this.documentIssuingCountry,
    this.memberCard,
    this.memberCardType,
    this.memberCardNumber,
    this.memberCardExpiredDate,
    this.orderIdx,
    this.eticket,
    this.eTicketList,
    this.adminFee,
    this.bookingId,
    this.paxFee,
    this.baseFare,
    this.baseTax,
    this.personRepresentation,
    this.travelerCode,
    this.serviceRequests,
  });

  factory TravelerInfoElement.fromJson(Map<String, dynamic> json) => TravelerInfoElement(
        id: json["id"],
        bookingNumber: json["bookingNumber"],
        bookingTransCode: json["bookingTransCode"],
        email: json["email"],
        gender: json["gender"],
        firstName: json["firstName"],
        surName: json["surName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        adultType: json["adultType"],
        country: json["country"],
        city: json["city"],
        address1: json["address1"],
        address2: json["address2"],
        postalCode: json["postalCode"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        phoneNumber3: json["phoneNumber3"],
        phoneNumber4: json["phoneNumber4"],
        phoneNumber5: json["phoneNumber5"],
        documentType: json["documentType"],
        nationality: json["nationality"],
        documentNumber: json["documentNumber"],
        documentExpiredDate: json["documentExpiredDate"],
        documentIssuedDate: json["documentIssuedDate"],
        documentIssuingCountry: json["documentIssuingCountry"],
        memberCard: json["memberCard"],
        memberCardType: json["memberCardType"],
        memberCardNumber: json["memberCardNumber"],
        memberCardExpiredDate: json["memberCardExpiredDate"],
        orderIdx: json["orderIdx"],
        eticket: json["eticket"],
        eTicketList: json["eTicketList"] == null ? null : AdminFee.fromJson(json["eTicketList"]),
        adminFee: json["adminFee"] == null ? null : AdminFee.fromJson(json["adminFee"]),
        bookingId: json["bookingId"],
        paxFee: json["paxFee"],
        baseFare: json["baseFare"],
        baseTax: json["baseTax"],
        personRepresentation: json["personRepresentation"],
        travelerCode: json["travelerCode"],
        serviceRequests: json["serviceRequests"] == null
            ? []
            : List<ServiceRequest>.from(json["serviceRequests"]!.map((x) => ServiceRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingNumber": bookingNumber,
        "bookingTransCode": bookingTransCode,
        "email": email,
        "gender": gender,
        "firstName": firstName,
        "surName": surName,
        "dob": dob?.toIso8601String(),
        "adultType": adultType,
        "country": country,
        "city": city,
        "address1": address1,
        "address2": address2,
        "postalCode": postalCode,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "phoneNumber3": phoneNumber3,
        "phoneNumber4": phoneNumber4,
        "phoneNumber5": phoneNumber5,
        "documentType": documentType,
        "nationality": nationality,
        "documentNumber": documentNumber,
        "documentExpiredDate": documentExpiredDate,
        "documentIssuedDate": documentIssuedDate,
        "documentIssuingCountry": documentIssuingCountry,
        "memberCard": memberCard,
        "memberCardType": memberCardType,
        "memberCardNumber": memberCardNumber,
        "memberCardExpiredDate": memberCardExpiredDate,
        "orderIdx": orderIdx,
        "eticket": eticket,
        "eTicketList": eTicketList?.toJson(),
        "adminFee": adminFee?.toJson(),
        "bookingId": bookingId,
        "paxFee": paxFee,
        "baseFare": baseFare,
        "baseTax": baseTax,
        "personRepresentation": personRepresentation,
        "travelerCode": travelerCode,
        "serviceRequests": serviceRequests == null ? [] : List<ServiceRequest>.from(serviceRequests!.map((x) => x.toJson())),
      };
}

class ServiceRequest {
  ServiceRequest({
    this.id,
    this.bookingNumber,
    this.bookingTransCode,
    this.bookingTravelerId,
    this.serviceType,
    this.fareCode,
    this.ssrId,
    this.ssrCode,
    this.ssrName,
    this.ssrAmount,
    this.bookingId,
    this.eTicket,
    this.bookingDirection,
  });

  int? id;
  String? bookingNumber;
  String? bookingTransCode;
  int? bookingTravelerId;
  String? serviceType;
  String? fareCode;
  String? ssrId;
  String? ssrCode;
  String? ssrName;
  double? ssrAmount;
  dynamic bookingId;
  dynamic eTicket;
  String? bookingDirection;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
        id: json["id"],
        bookingNumber: json["bookingNumber"],
        bookingTransCode: json["bookingTransCode"],
        bookingTravelerId: json["bookingTravelerId"],
        serviceType: json["serviceType"],
        fareCode: json["fareCode"],
        ssrId: json["ssrId"],
        ssrCode: json["ssrCode"],
        ssrName: json["ssrName"],
        ssrAmount: json["ssrAmount"],
        bookingId: json["bookingId"],
        eTicket: json["eTicket"],
        bookingDirection: json["bookingDirection"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingNumber": bookingNumber,
        "bookingTransCode": bookingTransCode,
        "bookingTravelerId": bookingTravelerId,
        "serviceType": serviceType,
        "fareCode": fareCode,
        "ssrId": ssrId,
        "ssrCode": ssrCode,
        "ssrName": ssrName,
        "ssrAmount": ssrAmount,
        "bookingId": bookingId,
        "eTicket": eTicket,
        "bookingDirection": bookingDirection,
      };
}

class BookingDetailRsTravelerInfo {
  BookingDetailRsTravelerInfo({
    this.airTravelers,
    this.contactInfos,
  });

  List<AirTraveler>? airTravelers;
  List<TravelerInfoContactInfo>? contactInfos;

  factory BookingDetailRsTravelerInfo.fromJson(Map<String, dynamic> json) => BookingDetailRsTravelerInfo(
        airTravelers: json["airTravelers"] == null
            ? []
            : List<AirTraveler>.from(json["airTravelers"]!.map((x) => AirTraveler.fromJson(x))),
        contactInfos: json["contactInfos"] == null
            ? []
            : List<TravelerInfoContactInfo>.from(json["contactInfos"]!.map((x) => TravelerInfoContactInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "airTravelers": airTravelers == null ? [] : List<AirTraveler>.from(airTravelers!.map((x) => x.toJson())),
        "contactInfos": contactInfos == null ? [] : List<TravelerInfoContactInfo>.from(contactInfos!.map((x) => x.toJson())),
      };
}

class AirTraveler {
  AirTraveler({
    this.idx,
    this.transCode,
    this.productCode,
    this.passengerId,
    this.passengerType,
    this.gender,
    this.passengerName,
    this.dateOfBirth,
    this.passport,
    this.frequentFlyerType,
    this.frequentFlyerNumber,
    this.phone1,
    this.phone2,
    this.email,
    this.specialServiceRequest,
    this.extraServicesRequest,
    this.eticket,
  });

  int? idx;
  String? transCode;
  String? productCode;
  String? passengerId;
  String? passengerType;
  String? gender;
  PassengerName? passengerName;
  DateTime? dateOfBirth;
  Passport? passport;
  String? frequentFlyerType;
  String? frequentFlyerNumber;
  String? phone1;
  String? phone2;
  String? email;
  SpecialServiceRequest? specialServiceRequest;
  dynamic extraServicesRequest;
  dynamic eticket;

  factory AirTraveler.fromJson(Map<String, dynamic> json) => AirTraveler(
        idx: json["idx"],
        transCode: json["transCode"],
        productCode: json["productCode"],
        passengerId: json["passengerId"],
        passengerType: json["passengerType"],
        gender: json["gender"],
        passengerName: json["passengerName"] == null ? null : PassengerName.fromJson(json["passengerName"]),
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        passport: json["passport"] == null ? null : Passport.fromJson(json["passport"]),
        frequentFlyerType: json["frequentFlyerType"],
        frequentFlyerNumber: json["frequentFlyerNumber"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        email: json["email"],
        specialServiceRequest: json["specialServiceRequest"] == null
            ? null
            : SpecialServiceRequest.fromJson(json["specialServiceRequest"]),
        extraServicesRequest: json["extraServicesRequest"],
        eticket: json["eticket"],
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "transCode": transCode,
        "productCode": productCode,
        "passengerId": passengerId,
        "passengerType": passengerType,
        "gender": gender,
        "passengerName": passengerName?.toJson(),
        "dateOfBirth": dateOfBirth,
        "passport": passport?.toJson(),
        "frequentFlyerType": frequentFlyerType,
        "frequentFlyerNumber": frequentFlyerNumber,
        "phone1": phone1,
        "phone2": phone2,
        "email": email,
        "specialServiceRequest": specialServiceRequest?.toJson(),
        "extraServicesRequest": extraServicesRequest,
        "eticket": eticket,
      };
}

class ItemServiceRequest {
  ItemServiceRequest({
    this.id,
    this.name,
    this.code,
    this.amount,
    this.serviceType,
    this.fareCode,
    this.direction,
    this.note,
  });

  String? id;
  String? name;
  String? code;
  double? amount;
  String? serviceType;
  String? fareCode;
  String? direction;
  String? note;

  factory ItemServiceRequest.fromJson(Map<String, dynamic> json) => ItemServiceRequest(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        amount: json["amount"],
        serviceType: json["serviceType"],
        fareCode: json["fareCode"],
        direction: json["direction"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "amount": amount,
        "serviceType": serviceType,
        "fareCode": fareCode,
        "direction": direction,
        "note": note,
      };
}

class SpecialServiceRequest {
  SpecialServiceRequest({
    this.ssrItems,
    this.mealPreference,
    this.seatPreference,
  });

  List<ItemServiceRequest>? ssrItems;
  String? mealPreference;
  String? seatPreference;

  factory SpecialServiceRequest.fromJson(Map<String, dynamic> json) => SpecialServiceRequest(
        ssrItems: json["ssrItems"] == null
            ? []
            : List<ItemServiceRequest>.from(json["ssrItems"]!.map((x) => ItemServiceRequest.fromJson(x))),
        mealPreference: json["mealPreference"],
        seatPreference: json["seatPreference"],
      );

  Map<String, dynamic> toJson() => {
        "ssrItems": ssrItems == null ? [] : List<ItemServiceRequest>.from(ssrItems!.map((x) => x.toJson())),
        "mealPreference": mealPreference,
        "seatPreference": seatPreference,
      };
}

class Passport {
  Passport({
    this.passportNumber,
    this.passportType,
    this.country,
    this.expiryDate,
  });

  dynamic passportNumber;
  dynamic passportType;
  dynamic country;
  dynamic expiryDate;

  factory Passport.fromJson(Map<String, dynamic> json) => Passport(
        passportNumber: json["passportNumber"],
        passportType: json["passportType"],
        country: json["country"],
        expiryDate: json["expiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "passportNumber": passportNumber,
        "passportType": passportType,
        "country": country,
        "expiryDate": expiryDate,
      };
}

class TravelerInfoContactInfo {
  TravelerInfoContactInfo({
    this.title,
    this.firstName,
    this.lastName,
    this.areaCode,
    this.countryCode,
    this.city,
    this.phoneNumber1,
    this.phoneNumber2,
    this.email,
    this.postCode,
  });

  dynamic title;
  String? firstName;
  String? lastName;
  String? areaCode;
  dynamic countryCode;
  dynamic city;
  String? phoneNumber1;
  dynamic phoneNumber2;
  String? email;
  dynamic postCode;

  factory TravelerInfoContactInfo.fromJson(Map<String, dynamic> json) => TravelerInfoContactInfo(
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        areaCode: json["areaCode"],
        countryCode: json["countryCode"],
        city: json["city"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        email: json["email"],
        postCode: json["postCode"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "areaCode": areaCode,
        "countryCode": countryCode,
        "city": city,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "email": email,
        "postCode": postCode,
      };
}

class PassengerName {
  PassengerName({
    this.title,
    this.firstName,
    this.lastName,
  });

  String? title;
  String? firstName;
  String? lastName;

  factory PassengerName.fromJson(Map<String, dynamic> json) => PassengerName(
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class AdminFee {
  AdminFee();

  factory AdminFee.fromJson(Map<String, dynamic> json) => AdminFee();

  Map<String, dynamic> toJson() => {};
}

extension AirTravelerMapper on AirTraveler {
  //NOTE: NON DEEP COPY CAUSE BY REFERENCE
  // AirTraveler airTravelers(AirTraveler airTraveler, FlightDirection flightDirection) {
  //   AirTraveler airTravelerMapper = airTraveler;
  //   airTravelerMapper.specialServiceRequest?.ssrItems =
  //       airTraveler.specialServiceRequest?.ssrItems?.where((ssr) => ssr.direction == flightDirection.value).toList();
  //   return airTravelerMapper;
  // }
}

extension BookingDetailRsHelper on BookingDetailRs {
  GroupPricedItinerary? groupPricedItineraryDirection(FlightDirection flightDirection) {
    var groupPricedItineriesDirection = (groupPricedItineraries ?? []).where((e) {
      OriginDestinationOption? originDestinationOptionDirection = e.pricedItineraries
          ?.map((pricedItinerary) => pricedItinerary.originDestinationOptionDirection(flightDirection.name))
          .firstOrNull;
      return originDestinationOptionDirection != null;
    }).toList();
    return groupPricedItineriesDirection.firstOrNull;
  }

  double get tempTotalPrice {
    DisplayPriceInfo? displayPriceInfo = bookingInfo?.displayPriceInfo;
    if (displayPriceInfo != null) {
      double tempPrice = (displayPriceInfo.baseFare ?? 0) + (displayPriceInfo.serviceTax ?? 0);
      return tempPrice;
    } else {
      return 0;
    }
  }

  double get totalPrice {
    DisplayPriceInfo? displayPriceInfo = bookingInfo?.displayPriceInfo;
    if (displayPriceInfo != null) {
      double totalPrice = (displayPriceInfo.baseFare ?? 0) +
          (displayPriceInfo.serviceTax ?? 0) +
          (displayPriceInfo.totalSsrValue ?? 0) +
          (displayPriceInfo.paymentFee ?? 0) +
          (displayPriceInfo.equivFare ?? 0) -
          (displayPriceInfo.discountAmount ?? 0);
      return totalPrice;
    } else {
      return 0;
    }
  }
}
