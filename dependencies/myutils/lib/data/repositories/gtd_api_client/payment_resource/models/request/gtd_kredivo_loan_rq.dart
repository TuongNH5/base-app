class GtdKredivoLoanRq {
  final double amount;
  final String source;

  GtdKredivoLoanRq({
    required this.amount,
    this.source = "ecom",
  });

  factory GtdKredivoLoanRq.fromMap(Map<String, dynamic> json) => GtdKredivoLoanRq(
        amount: json["amount"],
        source: json["source"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "source": source,
      };
}
