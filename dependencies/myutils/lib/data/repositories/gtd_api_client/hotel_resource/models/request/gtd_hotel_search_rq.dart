// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:myutils/helpers/extension/date_time_extension.dart';

class GtdHotelSearchRq {
  String searchType;
  String searchCode;
  String language;
  String currency;
  DateTime checkIn; //Format Request: "2023-08-28"
  DateTime checkOut;
  List<String> paxInfos; //2-13
  String supplier; // "EXPEDIA" , "AUTO", "AXISROOM"
  String? sortField;
  String? sortOrder;
  int pageNumber;
  int pageSize;

  //For using in detail
  int room = 0;
  int adult = 0;
  int child = 0;
  int infant = 0;
  List<int> childAges = [];
  List<int> infantAges = [];

  GtdHotelSearchRq({
    required this.searchType,
    required this.searchCode,
    this.language = "vi",
    this.currency = "VND",
    required this.checkIn,
    required this.checkOut,
    required this.paxInfos,
    required this.supplier,
    this.sortField = "order",
    this.sortOrder = "DESC",
    this.pageNumber = 0,
    this.pageSize = 15,
  });

  Map<String, dynamic> combineWithFilter(Map<String, dynamic> filterMap) {
    return {...toMap(), ...filterMap};
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchType': searchType,
      'searchCode': searchCode,
      'language': language,
      'currency': currency,
      'checkIn': checkIn.localDate("yyyy-MM-dd"),
      'checkOut': checkOut.localDate("yyyy-MM-dd"),
      'paxInfos': paxInfos,
      'supplier': supplier,
      'sortField': sortField,
      'sortOrder': sortOrder,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
  }
}
