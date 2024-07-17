// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/hotel_resource.dart';

class GtdHotelLocationDTO with EquatableMixin {
  final String searchCode;
  final String searchType;
  final String name;
  final String addressLine;
  final String supplier;
  final List<String>? tags;
  final String? piorityKey;
  GtdHotelLocationDTO({
    required this.searchCode,
    required this.searchType,
    required this.name,
    required this.addressLine,
    required this.supplier,
    this.tags,
    this.piorityKey,
  });

  factory GtdHotelLocationDTO.initEmptyData() {
    GtdHotelLocationDTO hotelLocationDTO = GtdHotelLocationDTO(
      searchCode: "",
      searchType: "",
      name: "",
      addressLine: "",
      supplier: "",
    );
    return hotelLocationDTO;
  }



  factory GtdHotelLocationDTO.initWithLocationName(String locationName) {
    GtdHotelLocationDTO hotelLocationDTO = GtdHotelLocationDTO(
      searchCode: locationName,
      searchType: "AUTO",
      name: locationName,
      addressLine: "",
      supplier: "EXPEDIA",
    );
    return hotelLocationDTO;
  }

  factory GtdHotelLocationDTO.fromHotelPropertyValue(HotelPropertyValue propertyValue) {
    GtdHotelLocationDTO hotelLocationDTO = GtdHotelLocationDTO(
        searchCode: propertyValue.value ?? "",
        searchType: "AUTO",
        name: propertyValue.value ?? "",
        addressLine: "Việt Nam",
        supplier: "EXPEDIA",
        piorityKey: propertyValue.key);
    return hotelLocationDTO;
  }

  factory GtdHotelLocationDTO.fromHotelLocatioContent(HotelLocationSearchContentRs hotelContent) {
    GtdHotelLocationDTO hotelLocationDTO = GtdHotelLocationDTO(
        searchCode: hotelContent.searchCode ?? "",
        searchType: hotelContent.searchType ?? "AUTO",
        name: hotelContent.name ?? "",
        addressLine: hotelContent.address?.lineOne ?? "",
        supplier: hotelContent.supplier ?? "EXPEDIA",
        tags: hotelContent.tags);
    return hotelLocationDTO;
  }

  String get pathIcon {
    if (searchType == "HOTEL") {
      return "hotel/hotel-grey.svg";
    } else {
      return "hotel/hotel-search-location.svg";
    }
  }

  Map<String, dynamic> toMapCachedObject() {
    return <String, dynamic>{
      'searchCode': searchCode,
      'searchType': searchType,
      'name': name,
      'addressLine': addressLine,
      'supplier': supplier,
    };
  }

  factory GtdHotelLocationDTO.fromMapCachedObject(Map<String, dynamic> map) {
    return GtdHotelLocationDTO(
      searchCode: map['searchCode'] as String,
      searchType: map['searchType'] as String,
      name: map['name'] as String,
      addressLine: map['addressLine'] as String,
      supplier: map['supplier'] as String,
    );
  }

  @override
  List<Object?> get props => [searchCode];
}
