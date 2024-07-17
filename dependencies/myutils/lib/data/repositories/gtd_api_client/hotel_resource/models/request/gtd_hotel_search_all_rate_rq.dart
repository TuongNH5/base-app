import 'package:myutils/helpers/extension/date_time_extension.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GtdHotelSearchAllRateRq {
  String searchId;
  String propertyId;
  String supplier;
  DateTime checkIn; //Format yyyy-MM-dd
  DateTime checkOut;
  List<String> paxInfos;
  //Not encode json
  int room = 0;
  int adult = 0;
  int child = 0;
  List<int> childAges = [];
  GtdHotelSearchAllRateRq({
    required this.searchId,
    required this.propertyId,
    required this.supplier,
    required this.checkIn,
    required this.checkOut,
    required this.paxInfos,
    this.room = 0,
    this.adult = 0,
    this.child= 0,
    this.childAges = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchId': searchId,
      'propertyId': propertyId,
      'supplier': supplier,
      'checkIn': checkIn.localDate("yyyy-MM-dd"),
      'checkOut': checkOut.localDate("yyyy-MM-dd"),
      'paxInfos': paxInfos,
    };
  }
}
