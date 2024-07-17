class BaggageItem {
  BaggageItem({
    this.amount,
    this.code,
    this.direction,
    this.fareCode,
    this.id,
    this.name,
    this.serviceType,
  });

  double? amount;
  String? code;
  String? direction;
  String? fareCode;
  String? id;
  String? name;
  String? serviceType;

  factory BaggageItem.fromJson(Map<String, dynamic> json) => BaggageItem(
        amount: json["amount"],
        code: json["code"],
        direction: json["direction"],
        fareCode: json["fareCode"],
        id: json["id"],
        name: json["name"],
        serviceType: json["serviceType"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "code": code,
        "direction": direction,
        "fareCode": fareCode,
        "id": id,
        "name": name,
        "serviceType": serviceType,
      };
}
