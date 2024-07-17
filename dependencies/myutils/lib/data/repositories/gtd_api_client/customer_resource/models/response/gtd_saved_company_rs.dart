class GtdSavedCompanyRs {
  int? id;
  String? businessName;
  String? businessCode;
  String? taxCode;
  String? address;
  bool? trustStatus;
  bool? useStatus;
  bool? isDeleted;
  String? note;
  bool? autoIssue;

  GtdSavedCompanyRs({
    this.id,
    this.businessName,
    this.businessCode,
    this.taxCode,
    this.address,
    this.trustStatus,
    this.useStatus,
    this.isDeleted,
    this.note,
    this.autoIssue,
  });

  factory GtdSavedCompanyRs.fromJson(Map<String, dynamic> json) => GtdSavedCompanyRs(
        id: json["id"],
        businessName: json["businessName"],
        businessCode: json["businessCode"],
        taxCode: json["taxCode"],
        address: json["address"],
        trustStatus: json["trustStatus"],
        useStatus: json["useStatus"],
        isDeleted: json["isDeleted"],
        note: json["note"],
        autoIssue: json["autoIssue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessName": businessName,
        "businessCode": businessCode,
        "taxCode": taxCode,
        "address": address,
        "trustStatus": trustStatus,
        "useStatus": useStatus,
        "isDeleted": isDeleted,
        "note": note,
        "autoIssue": autoIssue,
      };
}
