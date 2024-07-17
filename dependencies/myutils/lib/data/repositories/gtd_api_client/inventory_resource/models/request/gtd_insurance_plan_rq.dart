import 'dart:convert';

import 'package:myutils/helpers/extension/date_time_extension.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GtdInsurancePlanRq {
  String bookingNumber;
  int numberOfNonIns;
  int infant;
  int adult;
  int child;
  int? planId;
  String fromLocation;
  String toLocation;
  //Datetime Request format with pattern "2023-08-21"
  DateTime departureDate;
  DateTime? returnDate;
  GtdInsurancePlanRq({
    required this.bookingNumber,
    required this.numberOfNonIns,
    required this.infant,
    required this.adult,
    required this.child,
    required this.fromLocation,
    required this.toLocation,
    required this.departureDate,
    this.returnDate,
    this.planId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingNumber': bookingNumber,
      'numberOfNonIns': numberOfNonIns,
      'infant': infant,
      'adult': adult,
      'child': child,
      'planId': planId,
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'departureDate': departureDate.utcDate("yyyy-MM-dd"),
      'returnDate': returnDate?.utcDate("yyyy-MM-dd"),
    };
  }

  factory GtdInsurancePlanRq.fromMap(Map<String, dynamic> map) {
    return GtdInsurancePlanRq(
      bookingNumber: map['bookingNumber'] as String,
      numberOfNonIns: map['numberOfNonIns'] as int,
      infant: map['infant'] as int,
      adult: map['adult'] as int,
      child: map['child'] as int,
      planId: map['planId'],
      fromLocation: map['fromLocation'] as String,
      toLocation: map['toLocation'] as String,
      departureDate: DateTime.fromMillisecondsSinceEpoch(map['departureDate'] as int),
      returnDate: map['returnDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['returnDate'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdInsurancePlanRq.fromJson(String source) =>
      GtdInsurancePlanRq.fromMap(json.decode(source) as Map<String, dynamic>);
}
