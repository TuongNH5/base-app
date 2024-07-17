// To parse this JSON data, do
//
//     final searchBookingRq = searchBookingRqFromJson(jsonString);

import 'dart:convert';

import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/search_booking_rs.dart';

SearchBookingRq searchBookingRqFromJson(String str) => SearchBookingRq.fromJson(json.decode(str));

String searchBookingRqToJson(SearchBookingRq data) => json.encode(data.toJson());

class SearchBookingRq {
    SearchBookingRq({
        this.supplierType,
        this.bookingNumber,
        this.fromDate,
        this.toDate,
        this.listBookingStatus,
        this.page,
        this.size,
        this.sort
    });

    String? supplierType;
    String? bookingNumber;
    String? fromDate;
    String? toDate;
    List<String>? listBookingStatus;
    int? page;
    int? size;
    List<String>? sort;

    factory SearchBookingRq.initSearchBookingRq() => SearchBookingRq(
      supplierType: 'AIR',
      page: 0,
      size: 10
    );

    factory SearchBookingRq.fromJson(Map<String, dynamic> json) => SearchBookingRq(
        supplierType: json["supplierType"],
        bookingNumber: json["bookingNumber"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        listBookingStatus: json["listBookingStatus"] == null ? null : List<String>.from(json["listBookingStatus"]?.map((x) => x)),
        page: json["page"],
        size: json["size"],
        sort: json["sort"] == null ? null : List<String>.from(json["sort"]?.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "supplierType": supplierType,
        "bookingNumber": bookingNumber,
        "fromDate": fromDate,
        "toDate": toDate,
        "listBookingStatus": listBookingStatus == null ? null : List<dynamic>.from(listBookingStatus!.map((x) => x)),
        "page": page,
        "size": size,
        "sort": sort == null ? null : List<dynamic>.from(sort!.map((x) => x)),
    };
}
extension GtdFilterMyBookingMapper on SearchBookingRq {
  void updateFilterMyBooking(SearchBookingRs searchBookingRs) {
    page = searchBookingRs.number! + 1;
  }
}