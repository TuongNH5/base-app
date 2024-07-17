class HotelLocationAddress {
  String? lineOne;
  String? lineTow;
  String? stateProvinceCode;
  String? stateProvinceName;
  String? postalCode;
  String? city;
  String? countryCode;
  String? countryName;

  HotelLocationAddress({
    this.lineOne,
    this.lineTow,
    this.stateProvinceCode,
    this.stateProvinceName,
    this.postalCode,
    this.city,
    this.countryCode,
    this.countryName,
  });

  factory HotelLocationAddress.fromJson(Map<String, dynamic> json) => HotelLocationAddress(
        lineOne: json["lineOne"],
        lineTow: json["lineTow"],
        stateProvinceCode: json["stateProvinceCode"],
        stateProvinceName: json["stateProvinceName"],
        postalCode: json["postalCode"],
        city: json["city"],
        countryCode: json["countryCode"],
        countryName: json["countryName"],
      );

  Map<String, dynamic> toJson() => {
        "lineOne": lineOne,
        "lineTow": lineTow,
        "stateProvinceCode": stateProvinceCode,
        "stateProvinceName": stateProvinceName,
        "postalCode": postalCode,
        "city": city,
        "countryCode": countryCode,
        "countryName": countryName,
      };
}
