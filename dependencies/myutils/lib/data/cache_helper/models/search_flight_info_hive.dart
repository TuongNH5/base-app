// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'gtd_cached_object.dart';

part 'search_flight_info_hive.g.dart';

@HiveType(typeId: 0)
class SearchFlightInfoHive extends GtdCachedObject {
  @HiveField(0)
  String departLocationCode;
  @HiveField(1)
  String departLocationName;
  @HiveField(2)
  String returnLocationCode;
  @HiveField(3)
  String returnLocationName;
  @HiveField(4)
  bool isRoundTrip;
  @HiveField(5)
  bool isDome;
  @HiveField(6)
  int adult;
  @HiveField(7)
  int child;
  @HiveField(8)
  int infant;
  @HiveField(9)
  DateTime? departFlightDate;
  @HiveField(10)
  DateTime? returnFlightDate;
  @HiveField(11)
  String? bookingNumber;

  SearchFlightInfoHive({
    this.departLocationCode = "",
    this.departLocationName = "",
    this.returnLocationCode = "",
    this.returnLocationName = "",
    this.isRoundTrip = false,
    this.isDome = true,
    this.adult = 1,
    this.child = 0,
    this.infant = 0,
    this.departFlightDate,
    this.returnFlightDate,
    this.bookingNumber,
  });

  SearchFlightInfoHive copyWith({
    String? departLocationCode,
    String? departLocationName,
    String? returnLocationCode,
    String? returnLocationName,
    bool? isRoundTrip,
    bool? isDome,
    int? adult,
    int? child,
    int? infant,
    DateTime? departFlightDate,
    DateTime? returnFlightDate,
    String? bookingNumber,
  }) {
    return SearchFlightInfoHive(
      departLocationCode: departLocationCode ?? this.departLocationCode,
      departLocationName: departLocationName ?? this.departLocationName,
      returnLocationCode: returnLocationCode ?? this.returnLocationCode,
      returnLocationName: returnLocationName ?? this.returnLocationName,
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
      isDome: isDome ?? this.isDome,
      adult: adult ?? this.adult,
      child: child ?? this.child,
      infant: infant ?? this.infant,
      departFlightDate: departFlightDate ?? this.departFlightDate,
      returnFlightDate: returnFlightDate ?? this.returnFlightDate,
      bookingNumber: bookingNumber ?? this.bookingNumber,
    );
  }

  @override
  int get typeId => 0;

  @override
  String toString() {
    return 'SearchFlightInfoHive(departLocationCode: $departLocationCode, departLocationName: $departLocationName, returnLocationCode: $returnLocationCode, returnLocationName: $returnLocationName, isRoundTrip: $isRoundTrip, isDome: $isDome, adult: $adult, child: $child, infant: $infant, departFlightDate: $departFlightDate, returnFlightDate: $returnFlightDate, bookingNumber: $bookingNumber)';
  }
}
