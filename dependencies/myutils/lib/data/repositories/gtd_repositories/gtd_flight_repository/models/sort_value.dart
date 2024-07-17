enum FlightSortValue {
  departureDateAsc('departureDate,asc'),
  departureDateDesc('departureDate,desc'),
  priceAsc('price,asc'),
  priceDesc('price,desc'),
  durationAsc('duration,asc'),
  durationDesc('duration,desc');

  final String value;
  const FlightSortValue(this.value);
}
