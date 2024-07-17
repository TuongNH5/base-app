
import 'package:myutils/data/repositories/gtd_api_client/utility_resource/models/response/gtd_notifications_rs.dart';

class GtdInvoiceHistoryRs {
  final List<GtdInvoiceDetail>? content;
  final Pageable? pageable;
  final int? totalElements;
  final bool? last;
  final int? totalPages;
  final bool? first;
  final Sort? sort;
  final int? numberOfElements;
  final int? size;
  final int? number;
  final bool? empty;

  GtdInvoiceHistoryRs({
    this.content,
    this.pageable,
    this.totalElements,
    this.last,
    this.totalPages,
    this.first,
    this.sort,
    this.numberOfElements,
    this.size,
    this.number,
    this.empty,
  });

  factory GtdInvoiceHistoryRs.fromJson(Map<String, dynamic> json) => GtdInvoiceHistoryRs(
        content: json["content"] == null
            ? []
            : List<GtdInvoiceDetail>.from(json["content"]!.map((x) => GtdInvoiceDetail.fromJson(x))),
        pageable: json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]),
        totalElements: json["totalElements"],
        last: json["last"],
        totalPages: json["totalPages"],
        first: json["first"],
        sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
        "pageable": pageable?.toJson(),
        "totalElements": totalElements,
        "last": last,
        "totalPages": totalPages,
        "first": first,
        "sort": sort?.toJson(),
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class GtdInvoiceDetail {
  final int? id;
  final String? approvedStatus;
  final String? customerName;
  final String? customerEmail;
  final String? customerPhoneNumber;
  final String? buyerName;
  final DateTime? approvedDate;
  final String? note;
  final String? reason;
  final List<String>? bookingNumbers;
  final List<String>? pnrs;
  final double? sumPaymentAmount;
  final bool? isDeleted;
  final DateTime? createdDate;
  final Business? business;
  final AgentInvoiceProfile? agentInvoiceProfile;
  final Einvoice? einvoice;
  final List<InvoiceItem>? invoiceItems;
  final bool? newCreatedInvoice;
  final bool? adminIssue;

  GtdInvoiceDetail({
    this.id,
    this.approvedStatus,
    this.customerName,
    this.customerEmail,
    this.customerPhoneNumber,
    this.buyerName,
    this.approvedDate,
    this.note,
    this.reason,
    this.bookingNumbers,
    this.pnrs,
    this.sumPaymentAmount,
    this.isDeleted,
    this.createdDate,
    this.business,
    this.agentInvoiceProfile,
    this.einvoice,
    this.invoiceItems,
    this.newCreatedInvoice,
    this.adminIssue,
  });

  factory GtdInvoiceDetail.fromJson(Map<String, dynamic> json) => GtdInvoiceDetail(
        id: json["id"],
        approvedStatus: json["approvedStatus"],
        customerName: json["customerName"],
        customerEmail: json["customerEmail"],
        customerPhoneNumber: json["customerPhoneNumber"],
        buyerName: json["buyerName"],
        approvedDate: json["approvedDate"] == null ? null : DateTime.parse(json["approvedDate"]),
        note: json["note"],
        reason: json["reason"],
        bookingNumbers: json["bookingNumbers"] == null ? [] : List<String>.from(json["bookingNumbers"]!.map((x) => x)),
        pnrs: json["pnrs"] == null ? [] : List<String>.from(json["pnrs"]!.map((x) => x)),
        sumPaymentAmount: json["sumPaymentAmount"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        business: json["business"] == null ? null : Business.fromJson(json["business"]),
        agentInvoiceProfile:
            json["agentInvoiceProfile"] == null ? null : AgentInvoiceProfile.fromJson(json["agentInvoiceProfile"]),
        einvoice: json["einvoice"] == null ? null : Einvoice.fromJson(json["einvoice"]),
        invoiceItems: json["invoiceItems"] == null
            ? []
            : List<InvoiceItem>.from(json["invoiceItems"]!.map((x) => InvoiceItem.fromJson(x))),
        newCreatedInvoice: json["newCreatedInvoice"],
        adminIssue: json["adminIssue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "approvedStatus": approvedStatus,
        "customerName": customerName,
        "customerEmail": customerEmail,
        "customerPhoneNumber": customerPhoneNumber,
        "buyerName": buyerName,
        "approvedDate": approvedDate?.toIso8601String(),
        "note": note,
        "reason": reason,
        "bookingNumbers": bookingNumbers == null ? [] : List<dynamic>.from(bookingNumbers!.map((x) => x)),
        "pnrs": pnrs == null ? [] : List<dynamic>.from(pnrs!.map((x) => x)),
        "sumPaymentAmount": sumPaymentAmount,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
        "business": business?.toJson(),
        "agentInvoiceProfile": agentInvoiceProfile?.toJson(),
        "einvoice": einvoice?.toJson(),
        "invoiceItems": invoiceItems == null ? [] : List<dynamic>.from(invoiceItems!.map((x) => x.toJson())),
        "newCreatedInvoice": newCreatedInvoice,
        "adminIssue": adminIssue,
      };
}

class AgentInvoiceProfile {
  final int? id;
  final String? userRefCode;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final bool? isDeleted;
  final String? note;
  final bool? autoIssue;

  AgentInvoiceProfile({
    this.id,
    this.userRefCode,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.isDeleted,
    this.note,
    this.autoIssue,
  });

  factory AgentInvoiceProfile.fromJson(Map<String, dynamic> json) => AgentInvoiceProfile(
        id: json["id"],
        userRefCode: json["userRefCode"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        isDeleted: json["isDeleted"],
        note: json["note"],
        autoIssue: json["autoIssue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userRefCode": userRefCode,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "isDeleted": isDeleted,
        "note": note,
        "autoIssue": autoIssue,
      };
}

class Business {
  final int? id;
  final String? businessName;
  final String? businessCode;
  final String? taxCode;
  final String? address;
  final bool? trustStatus;
  final bool? useStatus;
  final bool? isDeleted;
  final String? note;
  final bool? autoIssue;

  Business({
    this.id,
    this.businessName,
    this.businessCode,
    this.taxCode,
    this.address,
    this.trustStatus,
    this.useStatus,
    this.isDeleted,
    this.note,
    this.autoIssue,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        businessName: json["businessName"],
        businessCode: json["businessCode"],
        taxCode: json["taxCode"],
        address: json["address"],
        trustStatus: json["trustStatus"],
        useStatus: json["useStatus"],
        isDeleted: json["isDeleted"],
        note: json["note"],
        autoIssue: json["autoIssue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessName": businessName,
        "businessCode": businessCode,
        "taxCode": taxCode,
        "address": address,
        "trustStatus": trustStatus,
        "useStatus": useStatus,
        "isDeleted": isDeleted,
        "note": note,
        "autoIssue": autoIssue,
      };
}

class Einvoice {
  final int? id;
  final int? partnerId;
  final String? partnerStringId;
  final String? invoiceGuid;
  final String? invoiceForm;
  final String? invoiceSerial;
  final String? invoiceNo;
  final int? status;
  final String? messLog;
  final String? mtc;
  final bool? signed;

  Einvoice({
    this.id,
    this.partnerId,
    this.partnerStringId,
    this.invoiceGuid,
    this.invoiceForm,
    this.invoiceSerial,
    this.invoiceNo,
    this.status,
    this.messLog,
    this.mtc,
    this.signed,
  });

  factory Einvoice.fromJson(Map<String, dynamic> json) => Einvoice(
        id: json["id"],
        partnerId: json["partnerId"],
        partnerStringId: json["partnerStringId"],
        invoiceGuid: json["invoiceGUID"],
        invoiceForm: json["invoiceForm"],
        invoiceSerial: json["invoiceSerial"],
        invoiceNo: json["invoiceNo"],
        status: json["status"],
        messLog: json["messLog"],
        mtc: json["mtc"],
        signed: json["signed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "partnerId": partnerId,
        "partnerStringId": partnerStringId,
        "invoiceGUID": invoiceGuid,
        "invoiceForm": invoiceForm,
        "invoiceSerial": invoiceSerial,
        "invoiceNo": invoiceNo,
        "status": status,
        "messLog": messLog,
        "mtc": mtc,
        "signed": signed,
      };
}

class InvoiceItem {
  final int? id;
  final String? bookingNumber;
  final String? pnr;
  final String? itemCode;
  final String? itemName;
  final String? unitName;
  final String? qty;
  final int? taxRateId;
  final double? taxRate;
  final double? price;
  final double? amount;
  final double? taxAmount;
  final bool? isDiscount;
  final int? itemTypeId;
  final String? saleChannel;
  final String? supplierType;

  InvoiceItem({
    this.id,
    this.bookingNumber,
    this.pnr,
    this.itemCode,
    this.itemName,
    this.unitName,
    this.qty,
    this.taxRateId,
    this.taxRate,
    this.price,
    this.amount,
    this.taxAmount,
    this.isDiscount,
    this.itemTypeId,
    this.saleChannel,
    this.supplierType,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
        id: json["id"],
        bookingNumber: json["bookingNumber"],
        pnr: json["pnr"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        unitName: json["unitName"],
        qty: json["qty"],
        taxRateId: json["taxRateID"],
        taxRate: json["taxRate"],
        price: json["price"],
        amount: json["amount"],
        taxAmount: json["taxAmount"],
        isDiscount: json["isDiscount"],
        itemTypeId: json["itemTypeId"],
        saleChannel: json["saleChannel"],
        supplierType: json["supplierType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingNumber": bookingNumber,
        "pnr": pnr,
        "itemCode": itemCode,
        "itemName": itemName,
        "unitName": unitName,
        "qty": qty,
        "taxRateID": taxRateId,
        "taxRate": taxRate,
        "price": price,
        "amount": amount,
        "taxAmount": taxAmount,
        "isDiscount": isDiscount,
        "itemTypeId": itemTypeId,
        "saleChannel": saleChannel,
        "supplierType": supplierType,
      };
}
