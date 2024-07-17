/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation


// ListMembershipRs listMembershipRsFromJson(String str) => ListMembershipRs.fromJson(json.decode(str));
//
// String listMembershipRsToJson(ListMembershipRs data) => json.encode(data.toJson());

class DataMembershipRs {
  DataMembershipRs({
    this.domainName,
    this.sortOrder,
    this.objectName,
    this.lookupValue,
    this.description,
    this.lookupType,
    this.id,
    this.lang,
    this.lookupCode,
  });

  String? domainName;
  int? sortOrder;
  String? objectName;
  String? lookupValue;
  String? description;
  String? lookupType;
  int? id;
  String? lang;
  dynamic lookupCode;
  factory DataMembershipRs.fromJson(Map<String, dynamic> json) =>
      DataMembershipRs(
        domainName: json["domainName"] ?? "",
        sortOrder: json["sortOrder"] ?? 0,
        objectName: json["objectName"] ?? "",
        lookupValue: json["lookupValue"] ?? "",
        description: json["description"] ?? "",
        lookupType: json["lookupType"] ?? "",
        id: json["id"] ?? 0,
        lang: json["lang"] ?? "",
        lookupCode: json["lookupCode"],
      );

  Map<String, dynamic> toJson() => {
        "domainName": domainName,
        "sortOrder": sortOrder,
        "objectName": objectName,
        "lookupValue": lookupValue,
        "description": description,
        "lookupType": lookupType,
        "id": id,
        "lang": lang,
        'lookupCode': lookupCode,
      };
}
