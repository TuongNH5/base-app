class OperatingAirline {
  OperatingAirline({
    this.code,
    this.equipment,
    this.flightNumber,
    this.name,
  });

  String? code;
  dynamic equipment;
  String? flightNumber;
  String? name;

  factory OperatingAirline.fromJson(Map<String, dynamic> json) =>
      OperatingAirline(
        code: json["code"],
        equipment: json["equipment"],
        flightNumber: json["flightNumber"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "equipment": equipment,
        "flightNumber": flightNumber,
        "name": name,
      };
}
