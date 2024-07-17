class GtdCountryCodeRs {
  int? id;
  String? code;
  String? sortname;
  String? name;
  String? iso2Code;
  String? iso3Code;
  String? phoneCode;
  String? iata;
  String? icao;
  String? continentCode;
  dynamic continent;
  String? capital;
  String? tzCapital;
  String? currency;
  DateTime? updatedAt;

  GtdCountryCodeRs({
    this.id,
    this.code,
    this.sortname,
    this.name,
    this.iso2Code,
    this.iso3Code,
    this.phoneCode,
    this.iata,
    this.icao,
    this.continentCode,
    this.continent,
    this.capital,
    this.tzCapital,
    this.currency,
    this.updatedAt,
  });

  factory GtdCountryCodeRs.fromJson(Map<String, dynamic> json) => GtdCountryCodeRs(
        id: json["id"],
        code: json["code"],
        sortname: json["sortname"],
        name: json["name"],
        iso2Code: json["iso2Code"],
        iso3Code: json["iso3Code"],
        phoneCode: json["phoneCode"],
        iata: json["iata"],
        icao: json["icao"],
        continentCode: json["continentCode"],
        continent: json["continent"],
        capital: json["capital"],
        tzCapital: json["tzCapital"],
        currency: json["currency"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "sortname": sortname,
        "name": name,
        "iso2Code": iso2Code,
        "iso3Code": iso3Code,
        "phoneCode": phoneCode,
        "iata": iata,
        "icao": icao,
        "continentCode": continentCode,
        "continent": continent,
        "capital": capital,
        "tzCapital": tzCapital,
        "currency": currency,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
