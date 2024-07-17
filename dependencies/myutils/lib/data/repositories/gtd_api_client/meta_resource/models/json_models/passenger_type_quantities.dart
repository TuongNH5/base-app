class PassengerTypeQuantities {
  PassengerTypeQuantities({
    this.code,
    this.quantity,
  });

  String? code;
  int? quantity;

  factory PassengerTypeQuantities.fromJson(Map<String, dynamic> json) =>
      PassengerTypeQuantities(
        code: json["code"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "quantity": quantity,
      };
}
