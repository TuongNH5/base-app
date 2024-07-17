import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdHotelDraftBookingRs extends GtdResponse {
  GtdHotelDraftBookingResult? result;

  GtdHotelDraftBookingRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdHotelDraftBookingRs.fromJson(Map<String, dynamic> json) => GtdHotelDraftBookingRs(
        result: json["result"] == null ? null : GtdHotelDraftBookingResult.fromJson(json["result"]),
        duration: json["duration"],
        textMessage: json["textMessage"],
        success: json["success"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}

class GtdHotelDraftBookingResult {
  num? additionalFee;
  String? agencyCode;
  num? agencyMarkupValue;
  dynamic agentCode;
  dynamic agentId;
  dynamic agentName;
  num? baseFare;
  String? bookBy;
  String? bookByCode;
  String? bookingCode;
  DateTime? bookingDate;
  dynamic bookingIssuedType;
  dynamic bookingNote;
  String? bookingNumber;
  String? bookingType;
  dynamic branchCode;
  dynamic cancellationBy;
  dynamic cancellationDate;
  num? cancellationFee;
  dynamic cancellationNotes;
  dynamic cancellationStatus;
  String? channelType;
  num? commissionValue;
  String? createdBy;
  DateTime? createdDate;
  String? customerCode;
  dynamic customerEmail;
  dynamic customerFirstName;
  int? customerId;
  dynamic customerLastName;
  dynamic customerPhoneNumber1;
  dynamic customerPhoneNumber2;
  DateTime? departureDate;
  num? discountAmount;
  dynamic discountDate;
  dynamic discountRedeemCode;
  dynamic discountRedeemId;
  dynamic discountTrackingCode;
  dynamic discountVoucherCode;
  dynamic discountVoucherName;
  num? equivFare;
  String? fromCity;
  String? fromLocationCode;
  String? fromLocationName;
  int? id;
  dynamic internalBookingNote;
  dynamic isDeleted;
  dynamic issuedBy;
  dynamic issuedByCode;
  dynamic issuedDate;
  String? issuedStatus;
  num? markupValue;
  String? orgCode;
  dynamic partnerOrderId;
  dynamic partnerRequestId;
  dynamic paymentBy;
  dynamic paymentByCode;
  dynamic paymentDate;
  num? paymentFee;
  dynamic paymentRefNumber;
  String? paymentStatus;
  num? paymentTotalAmount;
  String? paymentType;
  dynamic promotionId;
  dynamic reconciliationType;
  num? refundAmount;
  dynamic refundBy;
  dynamic refundByCode;
  dynamic refundDate;
  dynamic refundNextVoidDate;
  DateTime? returnDate;
  String? roundType;
  String? saleChannel;
  num? serviceTax;
  dynamic sessionSearchId;
  String? status;
  String? supplierType;
  dynamic tags;
  dynamic taxAddress1;
  dynamic taxAddress2;
  dynamic taxCompanyName;
  dynamic taxNumber;
  dynamic taxPersonalInfoContact;
  dynamic taxReceiptRequest;
  dynamic timeToLive;
  dynamic timeToLiveExpired;
  String? toCity;
  String? toLocationCode;
  String? toLocationName;
  num? totalFare;
  num? totalSsrValue;
  num? totalTax;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic vat;

  GtdHotelDraftBookingResult({
    this.additionalFee,
    this.agencyCode,
    this.agencyMarkupValue,
    this.agentCode,
    this.agentId,
    this.agentName,
    this.baseFare,
    this.bookBy,
    this.bookByCode,
    this.bookingCode,
    this.bookingDate,
    this.bookingIssuedType,
    this.bookingNote,
    this.bookingNumber,
    this.bookingType,
    this.branchCode,
    this.cancellationBy,
    this.cancellationDate,
    this.cancellationFee,
    this.cancellationNotes,
    this.cancellationStatus,
    this.channelType,
    this.commissionValue,
    this.createdBy,
    this.createdDate,
    this.customerCode,
    this.customerEmail,
    this.customerFirstName,
    this.customerId,
    this.customerLastName,
    this.customerPhoneNumber1,
    this.customerPhoneNumber2,
    this.departureDate,
    this.discountAmount,
    this.discountDate,
    this.discountRedeemCode,
    this.discountRedeemId,
    this.discountTrackingCode,
    this.discountVoucherCode,
    this.discountVoucherName,
    this.equivFare,
    this.fromCity,
    this.fromLocationCode,
    this.fromLocationName,
    this.id,
    this.internalBookingNote,
    this.isDeleted,
    this.issuedBy,
    this.issuedByCode,
    this.issuedDate,
    this.issuedStatus,
    this.markupValue,
    this.orgCode,
    this.partnerOrderId,
    this.partnerRequestId,
    this.paymentBy,
    this.paymentByCode,
    this.paymentDate,
    this.paymentFee,
    this.paymentRefNumber,
    this.paymentStatus,
    this.paymentTotalAmount,
    this.paymentType,
    this.promotionId,
    this.reconciliationType,
    this.refundAmount,
    this.refundBy,
    this.refundByCode,
    this.refundDate,
    this.refundNextVoidDate,
    this.returnDate,
    this.roundType,
    this.saleChannel,
    this.serviceTax,
    this.sessionSearchId,
    this.status,
    this.supplierType,
    this.tags,
    this.taxAddress1,
    this.taxAddress2,
    this.taxCompanyName,
    this.taxNumber,
    this.taxPersonalInfoContact,
    this.taxReceiptRequest,
    this.timeToLive,
    this.timeToLiveExpired,
    this.toCity,
    this.toLocationCode,
    this.toLocationName,
    this.totalFare,
    this.totalSsrValue,
    this.totalTax,
    this.updatedBy,
    this.updatedDate,
    this.vat,
  });

  factory GtdHotelDraftBookingResult.fromJson(Map<String, dynamic> json) => GtdHotelDraftBookingResult(
        additionalFee: json["additionalFee"],
        agencyCode: json["agencyCode"],
        agencyMarkupValue: json["agencyMarkupValue"],
        agentCode: json["agentCode"],
        agentId: json["agentId"],
        agentName: json["agentName"],
        baseFare: json["baseFare"],
        bookBy: json["bookBy"],
        bookByCode: json["bookByCode"],
        bookingCode: json["bookingCode"],
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        bookingIssuedType: json["bookingIssuedType"],
        bookingNote: json["bookingNote"],
        bookingNumber: json["bookingNumber"],
        bookingType: json["bookingType"],
        branchCode: json["branchCode"],
        cancellationBy: json["cancellationBy"],
        cancellationDate: json["cancellationDate"],
        cancellationFee: json["cancellationFee"],
        cancellationNotes: json["cancellationNotes"],
        cancellationStatus: json["cancellationStatus"],
        channelType: json["channelType"],
        commissionValue: json["commissionValue"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        customerCode: json["customerCode"],
        customerEmail: json["customerEmail"],
        customerFirstName: json["customerFirstName"],
        customerId: json["customerId"],
        customerLastName: json["customerLastName"],
        customerPhoneNumber1: json["customerPhoneNumber1"],
        customerPhoneNumber2: json["customerPhoneNumber2"],
        departureDate: json["departureDate"] == null ? null : DateTime.parse(json["departureDate"]),
        discountAmount: json["discountAmount"],
        discountDate: json["discountDate"],
        discountRedeemCode: json["discountRedeemCode"],
        discountRedeemId: json["discountRedeemId"],
        discountTrackingCode: json["discountTrackingCode"],
        discountVoucherCode: json["discountVoucherCode"],
        discountVoucherName: json["discountVoucherName"],
        equivFare: json["equivFare"],
        fromCity: json["fromCity"],
        fromLocationCode: json["fromLocationCode"],
        fromLocationName: json["fromLocationName"],
        id: json["id"],
        internalBookingNote: json["internalBookingNote"],
        isDeleted: json["isDeleted"],
        issuedBy: json["issuedBy"],
        issuedByCode: json["issuedByCode"],
        issuedDate: json["issuedDate"],
        issuedStatus: json["issuedStatus"],
        markupValue: json["markupValue"],
        orgCode: json["orgCode"],
        partnerOrderId: json["partnerOrderId"],
        partnerRequestId: json["partnerRequestId"],
        paymentBy: json["paymentBy"],
        paymentByCode: json["paymentByCode"],
        paymentDate: json["paymentDate"],
        paymentFee: json["paymentFee"],
        paymentRefNumber: json["paymentRefNumber"],
        paymentStatus: json["paymentStatus"],
        paymentTotalAmount: json["paymentTotalAmount"],
        paymentType: json["paymentType"],
        promotionId: json["promotionID"],
        reconciliationType: json["reconciliationType"],
        refundAmount: json["refundAmount"],
        refundBy: json["refundBy"],
        refundByCode: json["refundByCode"],
        refundDate: json["refundDate"],
        refundNextVoidDate: json["refundNextVoidDate"],
        returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
        roundType: json["roundType"],
        saleChannel: json["saleChannel"],
        serviceTax: json["serviceTax"],
        sessionSearchId: json["sessionSearchId"],
        status: json["status"],
        supplierType: json["supplierType"],
        tags: json["tags"],
        taxAddress1: json["taxAddress1"],
        taxAddress2: json["taxAddress2"],
        taxCompanyName: json["taxCompanyName"],
        taxNumber: json["taxNumber"],
        taxPersonalInfoContact: json["taxPersonalInfoContact"],
        taxReceiptRequest: json["taxReceiptRequest"],
        timeToLive: json["timeToLive"],
        timeToLiveExpired: json["timeToLiveExpired"],
        toCity: json["toCity"],
        toLocationCode: json["toLocationCode"],
        toLocationName: json["toLocationName"],
        totalFare: json["totalFare"],
        totalSsrValue: json["totalSsrValue"],
        totalTax: json["totalTax"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        vat: json["vat"],
      );

  Map<String, dynamic> toJson() => {
        "additionalFee": additionalFee,
        "agencyCode": agencyCode,
        "agencyMarkupValue": agencyMarkupValue,
        "agentCode": agentCode,
        "agentId": agentId,
        "agentName": agentName,
        "baseFare": baseFare,
        "bookBy": bookBy,
        "bookByCode": bookByCode,
        "bookingCode": bookingCode,
        "bookingDate": bookingDate?.toIso8601String(),
        "bookingIssuedType": bookingIssuedType,
        "bookingNote": bookingNote,
        "bookingNumber": bookingNumber,
        "bookingType": bookingType,
        "branchCode": branchCode,
        "cancellationBy": cancellationBy,
        "cancellationDate": cancellationDate,
        "cancellationFee": cancellationFee,
        "cancellationNotes": cancellationNotes,
        "cancellationStatus": cancellationStatus,
        "channelType": channelType,
        "commissionValue": commissionValue,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "customerCode": customerCode,
        "customerEmail": customerEmail,
        "customerFirstName": customerFirstName,
        "customerId": customerId,
        "customerLastName": customerLastName,
        "customerPhoneNumber1": customerPhoneNumber1,
        "customerPhoneNumber2": customerPhoneNumber2,
        "departureDate": departureDate?.toIso8601String(),
        "discountAmount": discountAmount,
        "discountDate": discountDate,
        "discountRedeemCode": discountRedeemCode,
        "discountRedeemId": discountRedeemId,
        "discountTrackingCode": discountTrackingCode,
        "discountVoucherCode": discountVoucherCode,
        "discountVoucherName": discountVoucherName,
        "equivFare": equivFare,
        "fromCity": fromCity,
        "fromLocationCode": fromLocationCode,
        "fromLocationName": fromLocationName,
        "id": id,
        "internalBookingNote": internalBookingNote,
        "isDeleted": isDeleted,
        "issuedBy": issuedBy,
        "issuedByCode": issuedByCode,
        "issuedDate": issuedDate,
        "issuedStatus": issuedStatus,
        "markupValue": markupValue,
        "orgCode": orgCode,
        "partnerOrderId": partnerOrderId,
        "partnerRequestId": partnerRequestId,
        "paymentBy": paymentBy,
        "paymentByCode": paymentByCode,
        "paymentDate": paymentDate,
        "paymentFee": paymentFee,
        "paymentRefNumber": paymentRefNumber,
        "paymentStatus": paymentStatus,
        "paymentTotalAmount": paymentTotalAmount,
        "paymentType": paymentType,
        "promotionID": promotionId,
        "reconciliationType": reconciliationType,
        "refundAmount": refundAmount,
        "refundBy": refundBy,
        "refundByCode": refundByCode,
        "refundDate": refundDate,
        "refundNextVoidDate": refundNextVoidDate,
        "returnDate": returnDate?.toIso8601String(),
        "roundType": roundType,
        "saleChannel": saleChannel,
        "serviceTax": serviceTax,
        "sessionSearchId": sessionSearchId,
        "status": status,
        "supplierType": supplierType,
        "tags": tags,
        "taxAddress1": taxAddress1,
        "taxAddress2": taxAddress2,
        "taxCompanyName": taxCompanyName,
        "taxNumber": taxNumber,
        "taxPersonalInfoContact": taxPersonalInfoContact,
        "taxReceiptRequest": taxReceiptRequest,
        "timeToLive": timeToLive,
        "timeToLiveExpired": timeToLiveExpired,
        "toCity": toCity,
        "toLocationCode": toLocationCode,
        "toLocationName": toLocationName,
        "totalFare": totalFare,
        "totalSsrValue": totalSsrValue,
        "totalTax": totalTax,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "vat": vat,
      };
}
