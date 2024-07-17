class BaseFare {
  BaseFare({
    this.amount,
    this.currencyCode,
    this.decimalPlaces,
  });

  double? amount;
  String? currencyCode;
  int? decimalPlaces;

  factory BaseFare.fromJson(Map<String, dynamic> json) => BaseFare(
        amount: json["amount"],
        currencyCode: json["currencyCode"],
        decimalPlaces: json["decimalPlaces"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
        "decimalPlaces": decimalPlaces,
      };
}

extension BaseFareHelper on BaseFare {
  //MARK:: Calc later
  double currencyAmount() {
    return amount ?? 0.0;
  }
}
