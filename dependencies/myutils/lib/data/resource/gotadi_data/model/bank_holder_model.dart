class BankHolderModel {
  String? bankCode;
  String? bankName;
  String? bankShortName;
  String? bankLogo;
  String? accountNumber;
  String? accountName;
  String? transferNote;

  BankHolderModel({
    this.bankCode,
    this.bankName,
    this.bankShortName,
    this.bankLogo,
    this.accountNumber,
    this.accountName,
    this.transferNote,
  });

  factory BankHolderModel.fromJson(Map<String, dynamic> json) => BankHolderModel(
        bankCode: json["bankCode"],
        bankName: json["bankName"],
        bankShortName: json["bankShortName"],
        bankLogo: json["bankLogo"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        transferNote: json["transferNote"],
      );

  Map<String, dynamic> toJson() => {
        "bankCode": bankCode,
        "bankName": bankName,
        "bankShortName": bankShortName,
        "bankLogo": bankLogo,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "transferNote": transferNote,
      };
}
