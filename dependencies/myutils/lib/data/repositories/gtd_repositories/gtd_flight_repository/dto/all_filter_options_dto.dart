

part of gtd_flight_repository_dto;

enum TypeFilter {
  airline('airlineOptions'),
  cabin('cabinClassOptions'),
  departureDateTime('departureDateTimeOptions'),
  arrivalDateTime('arrivalDateTimeOptions');

  final String typeFilter;
  const TypeFilter(this.typeFilter);
}

class AllFilterOptionsDTO {
  AllFilterOptionsDTO({this.type, required this.showIcon, this.filterOptions});
  List<FilterOption>? filterOptions;
  TypeFilter? type;
  bool showIcon;

  AllFilterOptionsDTO copyWith() {
    AllFilterOptionsDTO filterOptionsDTO = AllFilterOptionsDTO(showIcon: showIcon);
    filterOptionsDTO.filterOptions = filterOptions?.map((e) => e.copyWith()).toList();
    filterOptionsDTO.type = type;
    return filterOptionsDTO;
  }

  AllFilterOptionsDTO defaultFilter() {
    filterOptions = filterOptions?.whereType<FilterOption>().map((e) {
      e.isSelected = false;
      return e;
    }).toList();
    return this;
  }
}

// ignore: must_be_immutable
class FilterOption extends Equatable {
  FilterOption({this.name, this.value, required this.isSelected, this.excerpt});
  String? name;
  String? value;
  bool isSelected;
  String? excerpt;

  @override
  List<Object?> get props => [name, value, UniqueKey()];

  FilterOption copyWith() {
    FilterOption option = FilterOption(isSelected: isSelected);
    option.name = name;
    option.value = value;
    option.excerpt = excerpt;
    return option;
  }
}

List<AllFilterOptionsDTO> fromAllFilterOptionsRs(AllFilterOptionsRs filterOptionsRs) {
  List<AllFilterOptionsDTO> allFilterOptions = [];
  allFilterOptions.add(AllFilterOptionsDTO(
    type: TypeFilter.departureDateTime,
    filterOptions: mapFilterDateTimeOptions(["-6", "+6-12", "+12-18", "+18"]),
    showIcon: true,
  ));
  allFilterOptions.add(AllFilterOptionsDTO(
    type: TypeFilter.arrivalDateTime,
    filterOptions: mapFilterDateTimeOptions(["-6", "+6-12", "+12-18", "+18"]),
    showIcon: true,
  ));
  allFilterOptions.add(AllFilterOptionsDTO(
      type: TypeFilter.airline,
      showIcon: false,
      filterOptions: mapFilterOptionsAirline((filterOptionsRs.itineraryFilter?.airlineOptions)!)));
  allFilterOptions.add(AllFilterOptionsDTO(
      type: TypeFilter.cabin,
      showIcon: false,
      filterOptions: mapFilterOptionsCabin((filterOptionsRs.itineraryFilter?.cabinClassOptions)!)));
  return allFilterOptions;
}

// MAP DateTimeOptions
List<FilterOption> mapFilterDateTimeOptions(List<String> dateTimeOptions) =>
    List<FilterOption>.from(
        dateTimeOptions.map((dateTimeOption) => mapItemDateTimeOptions(dateTimeOption)));
FilterOption mapItemDateTimeOptions(String dateTimeOption) {
  return FilterOption(
      name: 'time_${dateTimeOption.replaceAll(RegExp(r'[+-]'), '')}',
      value: dateTimeOption,
      isSelected: false);
}

// MAP CABIN FILTER OPTIONS
List<FilterOption> mapFilterOptionsCabin(List<String> cabinClassOptions) => List<FilterOption>.from(
    cabinClassOptions.map((cabinClassOption) => mapItemCabin(cabinClassOption)));

FilterOption mapItemCabin(String cabinClassOption) {
  return FilterOption(
      name: cabinClassOption.toLowerCase(), value: cabinClassOption, isSelected: false);
}

// MAP AIRLINE FILTER OPTIONS
List<FilterOption> mapFilterOptionsAirline(List<String> airlineOptions) =>
    List<FilterOption>.from(airlineOptions.map((airlineOption) => mapItemAirline(airlineOption)));

FilterOption mapItemAirline(String airlineOption) {
  final airlineSplit = airlineOption.split(':');
  return FilterOption(
      name: airlineSplit[1],
      value: airlineSplit.firstOrNull,
      excerpt: airlineSplit.lastOrNull,
      isSelected: false);
}
