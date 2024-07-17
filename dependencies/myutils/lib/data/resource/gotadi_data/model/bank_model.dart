import 'package:myutils/data/resource/gotadi_data/bank_account.dart';

class BankModel {
  String? code;
  String? logo;
  String? name;

  BankModel({
    this.code,
    this.logo,
    this.name,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        code: json["code"],
        logo: json["logo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "logo": logo,
        "name": name,
      };
}

List<BankModel> bankModels = listATMBanks();
// List<BankModel> bankModels = listATMBanks.map((e) => BankModel.fromJson(e)).toList();
