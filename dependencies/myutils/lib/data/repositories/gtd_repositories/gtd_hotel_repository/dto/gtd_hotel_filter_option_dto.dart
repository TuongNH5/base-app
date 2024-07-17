// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_filter_options_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_hotel_filter_type.dart';

class GtdHotelFilterOptionDTO {
  GtdHotelFilterType filterType;
  String name;
  dynamic value;
  double from = 0;
  double to = 0;
  Map<String, dynamic> toRequest = {};
  GtdHotelFilterOptionDTO({required this.filterType, this.value, this.name = "", this.from = 0, this.to = 0});

  factory GtdHotelFilterOptionDTO.fromDynamicValue(
      {required name, required dynamic value, required GtdHotelFilterType filterType}) {
    GtdHotelFilterOptionDTO option = GtdHotelFilterOptionDTO(filterType: filterType, name: name, value: value);
    return option;
  }

  factory GtdHotelFilterOptionDTO.fromRangeValue(
      {required name, required double from, required double to, required GtdHotelFilterType filterType}) {
    GtdHotelFilterOptionDTO option = GtdHotelFilterOptionDTO(filterType: filterType, name: name, from: from, to: to);
    return option;
  }

  factory GtdHotelFilterOptionDTO.fromListRangeValue(
      {required String name,
      required List<RangeOptionJsonModel> rangeOptions,
      required GtdHotelFilterType filterType}) {
    GtdHotelFilterOptionDTO option = GtdHotelFilterOptionDTO(filterType: filterType, name: name);
    option.from = rangeOptions.map((e) => e.from).whereType<double>().min;
    option.to = rangeOptions.map((e) => e.to).whereType<double>().max;
    return option;
  }

  static List<GtdHotelFilterOptionDTO> hotelFilterOptions(GtdHotelFilterOptionJsonModel jsonModel) {
    List<GtdHotelFilterOptionDTO> options = [];

    var bedTypes = (jsonModel.bedTypes ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.bedTypes))
        .toList();
    options.addAll(bedTypes);

    var guestRatings = (jsonModel.guestRatings ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.guestRatings))
        .toList();
    options.addAll(guestRatings);

    var offerOptions = (jsonModel.offerOptions ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.offerOptions))
        .toList();
    options.addAll(offerOptions);

    if ((jsonModel.prices ?? []).isNotEmpty) {
      var priceOption = GtdHotelFilterOptionDTO.fromListRangeValue(
          rangeOptions: jsonModel.prices ?? [], name: "price option", filterType: GtdHotelFilterType.prices);
      options.add(priceOption);
    }

    if ((jsonModel.propertyDistance ?? []).isNotEmpty) {
      var distanceOption = GtdHotelFilterOptionDTO.fromListRangeValue(
          rangeOptions: jsonModel.propertyDistance ?? [],
          name: "distance option",
          filterType: GtdHotelFilterType.propertyDistance);
      options.add(distanceOption);
    }

    var propertyAmenities = (jsonModel.propertyAmenities ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.propertyAmenities))
        .toList();
    options.addAll(propertyAmenities);

    var propertyCategories = (jsonModel.propertyCategories ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.propertyCategories))
        .toList();
    options.addAll(propertyCategories);

    var propertyRatings = (jsonModel.propertyRatings ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.propertyRatings))
        .toList();
    options.addAll(propertyRatings);

    var rateAmenities = (jsonModel.rateAmenities ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.rateAmenities))
        .toList();
    options.addAll(rateAmenities);

    var roomAmenities = (jsonModel.roomAmenities ?? [])
        .map((e) => GtdHotelFilterOptionDTO.fromDynamicValue(
            name: e.name, value: e.value, filterType: GtdHotelFilterType.roomAmenities))
        .toList();
    options.addAll(roomAmenities);

    return options;
  }
}
