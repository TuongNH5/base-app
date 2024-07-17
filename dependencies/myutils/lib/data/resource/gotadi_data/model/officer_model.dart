class OfficerModel {
  String? name;
  String? address;
  String? phone;
  String? contact;
  String? fax;

  OfficerModel({
    this.name,
    this.address,
    this.phone,
    this.contact,
    this.fax,
  });

  factory OfficerModel.fromJson(Map<String, dynamic> json) => OfficerModel(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        contact: json["contact"],
        fax: json["fax"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
        "contact": contact,
        "fax": fax,
      };
}
