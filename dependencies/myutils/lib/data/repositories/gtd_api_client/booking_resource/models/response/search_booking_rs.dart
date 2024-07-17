// To parse this JSON data, do
//
//     final searchBookingRs = searchBookingRsFromJson(jsonString);

import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';

// SearchBookingRs searchBookingRsFromJson(String str) => SearchBookingRs.fromJson(json.decode(str));

// String searchBookingRsToJson(SearchBookingRs data) => json.encode(data.toJson());
// {"fname":"Tên người nhận hóa đơn nè","phone":"0382960988","email1":"tuongnh@gmail.com","phoneCode3":"84","buyerName":"Tên người mua","note":"Đây là ghi chú của thông tin xuất hóa đơn"}

class SearchBookingRs {
  SearchBookingRs({
    this.content,
    this.totalPages,
    this.totalElements,
    this.last,
    this.numberOfElements,
    this.sort,
    this.first,
    this.size,
    this.number,
  });

  List<BookingInfoElement>? content;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? numberOfElements;
  dynamic sort;
  bool? first;
  int? size;
  int? number;

  factory SearchBookingRs.fromJson(Map<String, dynamic> json) => SearchBookingRs(
        content: json["content"] == null
            ? []
            : List<BookingInfoElement>.from(json["content"]!.map((x) => BookingInfoElement.fromJson(x))),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        numberOfElements: json["numberOfElements"],
        sort: json["sort"],
        first: json["first"],
        size: json["size"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? [] : List<BookingInfoElement>.from(content!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "numberOfElements": numberOfElements,
        "sort": sort,
        "first": first,
        "size": size,
        "number": number,
      };
}

class BookingInfoElement {
  int? id;
  String? orgCode;
  String? agencyCode;
  String? saleChannel;
  String? channelType;
  String? supplierType;
  String? bookingCode;
  String? bookingType;
  String? agentCode;
  int? agentId;
  String? agentName;
  String? branchCode;
  String? customerCode;
  int? customerId;
  String? bookingNumber;
  String? roundType;
  String? fromLocationCode;
  String? fromLocationName;
  String? fromCity;
  String? toLocationCode;
  String? toLocationName;
  String? toCity;
  String? status;
  DateTime? bookingDate;
  DateTime? departureDate;
  DateTime? returnDate;
  double? baseFare;
  double? equivFare;
  double? serviceTax;
  double? vat;
  double? totalFare;
  double? totalTax;
  double? agencyMarkupValue;
  double? markupValue;
  double? totalSsrValue;
  double? totalCombo;
  double? paymentTotalAmount;
  double? paymentFee;
  String? paymentType;
  String? paymentStatus;
  DateTime? paymentDate;
  String? paymentRefNumber;
  String? partnerOrderId;
  String? issuedStatus;
  DateTime? issuedDate;
  String? customerFirstName;
  String? customerLastName;
  String? customerPhoneNumber1;
  dynamic customerPhoneNumber2;
  String? customerEmail;
  bool? taxReceiptRequest;
  String? taxCompanyName;
  String? taxAddress1;
  String? taxAddress2;
  String? taxNumber;
  String? paymentBy;
  String? paymentByCode;
  String? issuedByCode;
  String? refundBy;
  String? refundByCode;
  String? bookBy;
  String? bookByCode;
  DisplayPriceInfo? displayPriceInfo;
  List<TransactionInfo>? transactionInfos;
  List<AgencyMarkupInfo>? agencyMarkupInfos;
  int? numberOfTransactionMarkup;
  int? numberOfTransaction;
  List<BookingInfoContactInfo>? contactInfos;
  List<TravelerInfoElement>? travelerInfos;
  String? timeToLive;
  String? supplierBookingStatus;
  String? passengerNameRecords;
  String? etickets;
  String? cancellationStatus;
  double? cancellationFee;
  String? cancellationNotes;
  String? cancellationBy;
  DateTime? cancellationDate;
  double? discountAmount;
  String? discountVoucherCode;
  String? discountVoucherName;
  String? discountRedeemId;
  String? discountRedeemCode;
  DateTime? discountDate;
  dynamic additionalFee;
  String? taxPersonalInfoContact;
  String? bookingNote;
  String? internalBookingNote;
  String? promotionId;
  String? reasonCodePaymentFailed;
  String? bookingFinalStatus;
  String? bookingIssuedType;
  bool? ownerBooking;
  bool? deleted;
  bool? allowHold;
  bool? refundable;
  bool? showPayLaterOption;
  bool? showPayNowOption;
  bool? onlyPayLater;

  BookingInfoElement({
    this.id,
    this.orgCode,
    this.agencyCode,
    this.saleChannel,
    this.channelType,
    this.supplierType,
    this.bookingCode,
    this.bookingType,
    this.agentCode,
    this.agentId,
    this.agentName,
    this.branchCode,
    this.customerCode,
    this.customerId,
    this.bookingNumber,
    this.roundType,
    this.fromLocationCode,
    this.fromLocationName,
    this.fromCity,
    this.toLocationCode,
    this.toLocationName,
    this.toCity,
    this.status,
    this.bookingDate,
    this.departureDate,
    this.returnDate,
    this.baseFare,
    this.equivFare,
    this.serviceTax,
    this.vat,
    this.totalFare,
    this.totalTax,
    this.agencyMarkupValue,
    this.markupValue,
    this.totalSsrValue,
    this.totalCombo,
    this.paymentTotalAmount,
    this.paymentFee,
    this.paymentType,
    this.paymentStatus,
    this.paymentDate,
    this.paymentRefNumber,
    this.partnerOrderId,
    this.issuedStatus,
    this.issuedDate,
    this.customerFirstName,
    this.customerLastName,
    this.customerPhoneNumber1,
    this.customerPhoneNumber2,
    this.customerEmail,
    this.taxReceiptRequest,
    this.taxCompanyName,
    this.taxAddress1,
    this.taxAddress2,
    this.taxNumber,
    this.paymentBy,
    this.paymentByCode,
    this.issuedByCode,
    this.refundBy,
    this.refundByCode,
    this.bookBy,
    this.bookByCode,
    this.displayPriceInfo,
    this.transactionInfos,
    this.agencyMarkupInfos,
    this.numberOfTransactionMarkup,
    this.numberOfTransaction,
    this.contactInfos,
    this.travelerInfos,
    this.timeToLive,
    this.supplierBookingStatus,
    this.passengerNameRecords,
    this.etickets,
    this.cancellationStatus,
    this.cancellationFee,
    this.cancellationNotes,
    this.cancellationBy,
    this.cancellationDate,
    this.discountAmount,
    this.discountVoucherCode,
    this.discountVoucherName,
    this.discountRedeemId,
    this.discountRedeemCode,
    this.discountDate,
    this.additionalFee,
    this.taxPersonalInfoContact,
    this.bookingNote,
    this.internalBookingNote,
    this.promotionId,
    this.reasonCodePaymentFailed,
    this.bookingFinalStatus,
    this.bookingIssuedType,
    this.ownerBooking,
    this.deleted,
    this.allowHold,
    this.refundable,
    this.showPayLaterOption,
    this.showPayNowOption,
    this.onlyPayLater,
  });

  factory BookingInfoElement.fromJson(Map<String, dynamic> json) => BookingInfoElement(
        id: json["id"],
        orgCode: json["orgCode"],
        agencyCode: json["agencyCode"],
        saleChannel: json["saleChannel"],
        channelType: json["channelType"],
        supplierType: json["supplierType"],
        bookingCode: json["bookingCode"],
        bookingType: json["bookingType"],
        agentCode: json["agentCode"],
        agentId: json["agentId"],
        agentName: json["agentName"],
        branchCode: json["branchCode"],
        customerCode: json["customerCode"],
        customerId: json["customerId"],
        bookingNumber: json["bookingNumber"],
        roundType: json["roundType"],
        fromLocationCode: json["fromLocationCode"],
        fromLocationName: json["fromLocationName"],
        fromCity: json["fromCity"],
        toLocationCode: json["toLocationCode"],
        toLocationName: json["toLocationName"],
        toCity: json["toCity"],
        status: json["status"],
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        departureDate: json["departureDate"] == null ? null : DateTime.parse(json["departureDate"]),
        returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
        baseFare: json["baseFare"],
        equivFare: json["equivFare"],
        serviceTax: json["serviceTax"],
        vat: json["vat"],
        totalFare: json["totalFare"],
        totalTax: json["totalTax"],
        agencyMarkupValue: json["agencyMarkupValue"],
        markupValue: json["markupValue"],
        totalSsrValue: json["totalSsrValue"],
        totalCombo: json["totalCombo"],
        paymentTotalAmount: json["paymentTotalAmount"],
        paymentFee: json["paymentFee"],
        paymentType: json["paymentType"],
        paymentStatus: json["paymentStatus"],
        paymentDate: json["paymentDate"] == null ? null : DateTime.parse(json["paymentDate"]),
        paymentRefNumber: json["paymentRefNumber"],
        partnerOrderId: json["partnerOrderId"],
        issuedStatus: json["issuedStatus"],
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        customerFirstName: json["customerFirstName"],
        customerLastName: json["customerLastName"],
        customerPhoneNumber1: json["customerPhoneNumber1"],
        customerPhoneNumber2: json["customerPhoneNumber2"],
        customerEmail: json["customerEmail"],
        taxReceiptRequest: json["taxReceiptRequest"],
        taxCompanyName: json["taxCompanyName"],
        taxAddress1: json["taxAddress1"],
        taxAddress2: json["taxAddress2"],
        taxNumber: json["taxNumber"],
        paymentBy: json["paymentBy"],
        paymentByCode: json["paymentByCode"],
        issuedByCode: json["issuedByCode"],
        refundBy: json["refundBy"],
        refundByCode: json["refundByCode"],
        bookBy: json["bookBy"],
        bookByCode: json["bookByCode"],
        displayPriceInfo: json["displayPriceInfo"] == null ? null : DisplayPriceInfo.fromJson(json["displayPriceInfo"]),
        transactionInfos: json["transactionInfos"] == null
            ? []
            : List<TransactionInfo>.from(json["transactionInfos"]!.map((x) => TransactionInfo.fromJson(x))),
        agencyMarkupInfos: json["agencyMarkupInfos"] == null
            ? []
            : List<AgencyMarkupInfo>.from(json["agencyMarkupInfos"]!.map((x) => AgencyMarkupInfo.fromJson(x))),
        numberOfTransactionMarkup: json["numberOfTransactionMarkup"],
        numberOfTransaction: json["numberOfTransaction"],
        contactInfos: json["contactInfos"] == null
            ? []
            : List<BookingInfoContactInfo>.from(json["contactInfos"]!.map((x) => BookingInfoContactInfo.fromJson(x))),
        travelerInfos: json["travelerInfos"] == null
            ? []
            : List<TravelerInfoElement>.from(json["travelerInfos"]!.map((x) => TravelerInfoElement.fromJson(x))),
        timeToLive: json["timeToLive"] == null ? null : (json["timeToLive"]),
        supplierBookingStatus: json["supplierBookingStatus"],
        passengerNameRecords: json["passengerNameRecords"],
        etickets: json["etickets"],
        cancellationStatus: json["cancellationStatus"],
        cancellationFee: json["cancellationFee"],
        cancellationNotes: json["cancellationNotes"],
        cancellationBy: json["cancellationBy"],
        cancellationDate: json["cancellationDate"] == null ? null : DateTime.parse(json["cancellationDate"]),
        discountAmount: json["discountAmount"],
        discountVoucherCode: json["discountVoucherCode"],
        discountVoucherName: json["discountVoucherName"],
        discountRedeemId: json["discountRedeemId"],
        discountRedeemCode: json["discountRedeemCode"],
        discountDate: json["discountDate"] == null ? null : DateTime.parse(json["discountDate"]),
        additionalFee: json["additionalFee"],
        taxPersonalInfoContact: json["taxPersonalInfoContact"],
        bookingNote: json["bookingNote"],
        internalBookingNote: json["internalBookingNote"],
        promotionId: json["promotionID"],
        reasonCodePaymentFailed: json["reasonCodePaymentFailed"],
        bookingFinalStatus: json["bookingFinalStatus"],
        bookingIssuedType: json["bookingIssuedType"],
        ownerBooking: json["ownerBooking"],
        deleted: json["deleted"],
        allowHold: json["allowHold"],
        refundable: json["refundable"],
        showPayLaterOption: json["showPayLaterOption"],
        showPayNowOption: json["showPayNowOption"],
        onlyPayLater: json["onlyPayLater"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orgCode": orgCode,
        "agencyCode": agencyCode,
        "saleChannel": saleChannel,
        "channelType": channelType,
        "supplierType": supplierType,
        "bookingCode": bookingCode,
        "bookingType": bookingType,
        "agentCode": agentCode,
        "agentId": agentId,
        "agentName": agentName,
        "branchCode": branchCode,
        "customerCode": customerCode,
        "customerId": customerId,
        "bookingNumber": bookingNumber,
        "roundType": roundType,
        "fromLocationCode": fromLocationCode,
        "fromLocationName": fromLocationName,
        "fromCity": fromCity,
        "toLocationCode": toLocationCode,
        "toLocationName": toLocationName,
        "toCity": toCity,
        "status": status,
        "bookingDate": bookingDate?.toIso8601String(),
        "departureDate": departureDate?.toIso8601String(),
        "returnDate": returnDate?.toIso8601String(),
        "baseFare": baseFare,
        "equivFare": equivFare,
        "serviceTax": serviceTax,
        "vat": vat,
        "totalFare": totalFare,
        "totalTax": totalTax,
        "agencyMarkupValue": agencyMarkupValue,
        "markupValue": markupValue,
        "totalSsrValue": totalSsrValue,
        "totalCombo": totalCombo,
        "paymentTotalAmount": paymentTotalAmount,
        "paymentFee": paymentFee,
        "paymentType": paymentType,
        "paymentStatus": paymentStatus,
        "paymentDate": paymentDate?.toIso8601String(),
        "paymentRefNumber": paymentRefNumber,
        "partnerOrderId": partnerOrderId,
        "issuedStatus": issuedStatus,
        "issuedDate": issuedDate?.toIso8601String(),
        "customerFirstName": customerFirstName,
        "customerLastName": customerLastName,
        "customerPhoneNumber1": customerPhoneNumber1,
        "customerPhoneNumber2": customerPhoneNumber2,
        "customerEmail": customerEmail,
        "taxReceiptRequest": taxReceiptRequest,
        "taxCompanyName": taxCompanyName,
        "taxAddress1": taxAddress1,
        "taxAddress2": taxAddress2,
        "taxNumber": taxNumber,
        "paymentBy": paymentBy,
        "paymentByCode": paymentByCode,
        "issuedByCode": issuedByCode,
        "refundBy": refundBy,
        "refundByCode": refundByCode,
        "bookBy": bookBy,
        "bookByCode": bookByCode,
        "displayPriceInfo": displayPriceInfo?.toJson(),
        "transactionInfos":
            transactionInfos == null ? [] : List<TransactionInfo>.from(transactionInfos!.map((x) => x.toJson())),
        "agencyMarkupInfos":
            agencyMarkupInfos == null ? [] : List<AgencyMarkupInfo>.from(agencyMarkupInfos!.map((x) => x.toJson())),
        "numberOfTransactionMarkup": numberOfTransactionMarkup,
        "numberOfTransaction": numberOfTransaction,
        "contactInfos": contactInfos == null ? [] : List<BookingInfoContactInfo>.from(contactInfos!.map((x) => x.toJson())),
        "travelerInfos": travelerInfos == null ? [] : List<TravelerInfoElement>.from(travelerInfos!.map((x) => x.toJson())),
        "timeToLive": timeToLive,
        "supplierBookingStatus": supplierBookingStatus,
        "passengerNameRecords": passengerNameRecords,
        "etickets": etickets,
        "cancellationStatus": cancellationStatus,
        "cancellationFee": cancellationFee,
        "cancellationNotes": cancellationNotes,
        "cancellationBy": cancellationBy,
        "cancellationDate": cancellationDate,
        "discountAmount": discountAmount,
        "discountVoucherCode": discountVoucherCode,
        "discountVoucherName": discountVoucherName,
        "discountRedeemId": discountRedeemId,
        "discountRedeemCode": discountRedeemCode,
        "discountDate": discountDate,
        "additionalFee": additionalFee,
        "taxPersonalInfoContact": taxPersonalInfoContact,
        "bookingNote": bookingNote,
        "internalBookingNote": internalBookingNote,
        "promotionID": promotionId,
        "reasonCodePaymentFailed": reasonCodePaymentFailed,
        "bookingFinalStatus": bookingFinalStatus,
        "bookingIssuedType": bookingIssuedType,
        "ownerBooking": ownerBooking,
        "deleted": deleted,
        "allowHold": allowHold,
        "refundable": refundable,
        "showPayLaterOption": showPayLaterOption,
        "showPayNowOption": showPayNowOption,
        "onlyPayLater": onlyPayLater,
      };
}

class ContentMyBooking {
  ContentMyBooking({
    this.id,
    this.saleChannel,
    this.channelType,
    this.supplierType,
    this.bookingCode,
    this.bookingNumber,
    this.bookingContent,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.bookingId,
    this.groupBooking,
  });

  int? id;
  String? saleChannel;
  String? channelType;
  String? supplierType;
  String? bookingCode;
  String? bookingNumber;
  String? bookingContent;
  String? createdDate;
  String? createdBy;
  dynamic updatedDate;
  dynamic updatedBy;
  int? bookingId;
  dynamic groupBooking;

  factory ContentMyBooking.fromJson(Map<String, dynamic> json) => ContentMyBooking(
        id: json["id"],
        saleChannel: json["saleChannel"],
        channelType: json["channelType"],
        supplierType: json["supplierType"],
        bookingCode: json["bookingCode"],
        bookingNumber: json["bookingNumber"],
        bookingContent: json["bookingContent"],
        createdDate: json["createdDate"],
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"],
        updatedBy: json["updatedBy"],
        bookingId: json["bookingId"],
        groupBooking: json["groupBooking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "saleChannel": saleChannel,
        "channelType": channelType,
        "supplierType": supplierType,
        "bookingCode": bookingCode,
        "bookingNumber": bookingNumber,
        "bookingContent": bookingContent,
        "createdDate": createdDate,
        "createdBy": createdBy,
        "updatedDate": updatedDate,
        "updatedBy": updatedBy,
        "bookingId": bookingId,
        "groupBooking": groupBooking,
      };
}

extension GtdItemMyBookingMapper on BookingInfoElement {
  void updateStatusItemMyBooking(BookingInfoElement itemBooking) {
    //////// Global status

    if (itemBooking.status == 'PENDING') {
      status = 'PENDING';
    }

    if ((itemBooking.status == 'BOOKED' &&
            itemBooking.paymentStatus == 'PENDING' &&
            timeToLiveValid(itemBooking.timeToLive!)) ||
        (itemBooking.status == 'PARTLY_BOOKED' &&
            itemBooking.paymentStatus == 'PENDING' &&
            timeToLiveValid(itemBooking.timeToLive!))) {
      status = 'BOOKED';
    }

    if ((itemBooking.status == 'BOOKED' && itemBooking.issuedStatus == 'TICKET_ON_PROCESS') ||
        (itemBooking.status == 'PARTLY_BOOKED' && itemBooking.issuedStatus == 'TICKET_ON_PROCESS')) {
      status = 'TICKED_ON_PROCESS';
    }

    if (itemBooking.issuedStatus == 'SUCCEEDED' && itemBooking.status != 'CANCELLED') {
      status = 'SUCCEEDED';
    }

    if ((itemBooking.status == 'BOOKED' && itemBooking.paymentStatus == 'FAILED') ||
        (itemBooking.status == 'PARTLY_BOOKED' && itemBooking.paymentStatus == 'FAILED')) {
      status = 'PAYMENT_FAILED';
    }

    if (itemBooking.status == 'FAILED' || itemBooking.status == 'PARTLY_FAILED') {
      status = 'FAILED';
    }

    if (itemBooking.paymentStatus == 'SUCCEEDED' && itemBooking.issuedStatus == 'FAILED') {
      status = 'PAYMENT_SUCCESS_COMMIT_FAILED';
    }

    if (itemBooking.status == 'EXPIRED' ||
        (itemBooking.status == 'BOOKED' &&
            itemBooking.paymentStatus == 'PENDING' &&
            !timeToLiveValid(itemBooking.timeToLive!))) {
      status = 'EXPIRED';
    }

    if (itemBooking.paymentStatus == 'REFUNDED' && itemBooking.status == 'CANCELLED') {
      status = 'PAYMENT_REFUNDED';
    }

    if (itemBooking.paymentStatus != 'REFUNDED' && itemBooking.status == 'CANCELLED') {
      status = 'CANCELLED';
    }
  }

  bool timeToLiveValid(String dateTime) {
    DateTime parseDate = DateTime.parse(dateTime);
    return DateTime.now().isAfter(parseDate);
  }
}

extension BookingInfoElementHelper on BookingInfoElement {
  TransactionInfo? transactionInfoFlight(FlightDirection flightDirection) {
    if (roundType?.toLowerCase() == FlightRoundType.roundTrip.value.toLowerCase() &&
        bookingType?.toLowerCase() == FlightType.inte.name.toLowerCase()) {
      TransactionInfo? transactionInfo = transactionInfos
          ?.where((element) => (element.bookingDirection == "TRIP" && element.supplierType == "AIR"))
          .firstOrNull;
      if (flightDirection == FlightDirection.r) {
        List<String?> codes = [transactionInfo?.originLocationCode, transactionInfo?.destinationLocationCode];
        List<DateTime?> dateTimes = [transactionInfo?.checkIn, transactionInfo?.checkOut];
        transactionInfo?.originLocationCode = codes[1];
        transactionInfo?.destinationLocationCode = codes[0];
        transactionInfo?.checkIn = dateTimes.last;
      }
      return transactionInfo;
    } else {
      return transactionInfos
          ?.where((element) => (element.bookingDirection == flightDirection.value && element.supplierType == "AIR"))
          .firstOrNull;
    }
  }

  TransactionInfo? transactionInfoHotel() {
    return transactionInfos?.where((element) => (element.supplierType == "HOTEL")).firstOrNull;
  }
}
TaxPersonlInfoContact taxPersonlInfoContactFromJson(String str) => TaxPersonlInfoContact.fromJson(json.decode(str));

String taxPersonlInfoContactToJson(TaxPersonlInfoContact data) => json.encode(data.toJson());

class TaxPersonlInfoContact {
  TaxPersonlInfoContact({
    required this.fname,
    required this.note,
    required this.email1,
    required this.phoneCode3,
    required this.phone,
    required this.buyerName,
  });

  String fname;
  String note;
  String email1;
  String phoneCode3;
  String phone;
  String buyerName;

  factory TaxPersonlInfoContact.fromJson(Map<dynamic, dynamic> json) => TaxPersonlInfoContact(
    fname: json["fname"],
    note: json["note"],
    email1: json["email1"],
    phoneCode3: json["phoneCode3"],
    phone: json["phone"],
    buyerName: json["buyerName"],
  );

  Map<dynamic, dynamic> toJson() => {
    "fname": fname,
    "note": note,
    "email1": email1,
    "phoneCode3": phoneCode3,
    "phone": phone,
    "buyerName": buyerName,
  };
}