class Surcharge {
  Surcharge({
    this.amount,
    this.indicator,
    this.type,
  });

  double? amount;
  String? indicator;
  String? type;

  factory Surcharge.fromJson(Map<String, dynamic> json) => Surcharge(
        amount: json["amount"],
        indicator: json["indicator"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "indicator": indicator,
        "type": type,
      };
}
