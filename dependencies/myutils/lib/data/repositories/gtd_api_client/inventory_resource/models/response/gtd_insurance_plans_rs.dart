import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';

class GtdInsurancePlanRs extends GtdResponse {
  List<InsurancePlan>? result;

  GtdInsurancePlanRs({
    this.result,
    super.duration,
    super.textMessage,
    super.errors,
    super.infos,
    super.success,
  });

  factory GtdInsurancePlanRs.fromJson(Map<String, dynamic> json) => GtdInsurancePlanRs(
        result: json["result"] == null
            ? []
            : List<InsurancePlan>.from(json["result"]!.map((x) => InsurancePlan.fromJson(x))),
        duration: json["duration"],
        textMessage: json["textMessage"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
        "duration": duration,
        "textMessage": textMessage,
        "errors": errors,
        "infos": infos,
        "success": success,
      };
}

class InsurancePlan {
  String? id;
  String? name;
  String? code;
  double? amount;
  InsExtras? extras;

  InsurancePlan({
    this.id,
    this.name,
    this.code,
    this.amount,
    this.extras,
  });

  factory InsurancePlan.fromJson(Map<String, dynamic> json) => InsurancePlan(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        amount: json["amount"],
        extras: json["extras"] == null ? null : InsExtras.fromJson(json["extras"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "amount": amount,
        "extras": extras?.toJson(),
      };
}

class InsExtras {
  List<InsuranceBreakdown>? insuranceBreakdown;
  String? chargeType;
  String? description;
  PricingBreakdown? pricingBreakdown;
  String? insuranceType;
  String? content;
  List<InsuranceClassItem>? insuranceClassItem;
  int? dayCount;
  String? planId;
  String? regionZone;
  int? personCount;

  InsExtras({
    this.insuranceBreakdown,
    this.chargeType,
    this.description,
    this.pricingBreakdown,
    this.insuranceType,
    this.content,
    this.insuranceClassItem,
    this.dayCount,
    this.planId,
    this.regionZone,
    this.personCount,
  });

  factory InsExtras.fromJson(Map<String, dynamic> json) => InsExtras(
        insuranceBreakdown: json["insuranceBreakdown"] == null
            ? []
            : List<InsuranceBreakdown>.from(json["insuranceBreakdown"]!.map((x) => InsuranceBreakdown.fromJson(x))),
        chargeType: json["chargeType"],
        description: json["description"],
        pricingBreakdown: json["pricingBreakdown"] == null ? null : PricingBreakdown.fromJson(json["pricingBreakdown"]),
        insuranceType: json["insuranceType"],
        content: json["content"],
        insuranceClassItem: json["insuranceClassItem"] == null
            ? []
            : List<InsuranceClassItem>.from(json["insuranceClassItem"]!.map((x) => InsuranceClassItem.fromJson(x))),
        dayCount: json["dayCount"],
        planId: json["planId"],
        regionZone: json["regionZone"],
        personCount: json["personCount"],
      );

  Map<String, dynamic> toJson() => {
        "insuranceBreakdown":
            insuranceBreakdown == null ? [] : List<dynamic>.from(insuranceBreakdown!.map((x) => x.toJson())),
        "chargeType": chargeType,
        "description": description,
        "pricingBreakdown": pricingBreakdown?.toJson(),
        "insuranceType": insuranceType,
        "content": content,
        "insuranceClassItem":
            insuranceClassItem == null ? [] : List<dynamic>.from(insuranceClassItem!.map((x) => x.toJson())),
        "dayCount": dayCount,
        "planId": planId,
        "regionZone": regionZone,
        "personCount": personCount,
      };
}

class InsuranceBreakdown {
  InsAge? minAge;
  InsAge? maxAge;
  String? gender;
  String? currencyCode;
  double? premiumAmount;

  InsuranceBreakdown({
    this.minAge,
    this.maxAge,
    this.gender,
    this.currencyCode,
    this.premiumAmount,
  });

  factory InsuranceBreakdown.fromJson(Map<String, dynamic> json) => InsuranceBreakdown(
        minAge: json["minAge"] == null ? null : InsAge.fromJson(json["minAge"]),
        maxAge: json["maxAge"] == null ? null : InsAge.fromJson(json["maxAge"]),
        gender: json["gender"],
        currencyCode: json["currencyCode"],
        premiumAmount: json["premiumAmount"],
      );

  Map<String, dynamic> toJson() => {
        "minAge": minAge?.toJson(),
        "maxAge": maxAge?.toJson(),
        "gender": gender,
        "currencyCode": currencyCode,
        "premiumAmount": premiumAmount,
      };
}

class InsAge {
  int? age;
  String? ageType;

  InsAge({
    this.age,
    this.ageType,
  });

  factory InsAge.fromJson(Map<String, dynamic> json) => InsAge(
        age: json["age"],
        ageType: json["ageType"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "ageType": ageType,
      };
}

class InsuranceClassItem {
  String? name;
  String? code;
  String? benefit;
  double? classAmount;

  InsuranceClassItem({
    this.name,
    this.code,
    this.benefit,
    this.classAmount,
  });

  factory InsuranceClassItem.fromJson(Map<String, dynamic> json) => InsuranceClassItem(
        name: json["name"],
        code: json["code"],
        benefit: json["benefit"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "benefit": benefit,
      };
  String get titleClass {
    switch (name) {
      case "BRONZE":
        return "Gói đồng";
      case "SILVER":
        return "Gói bạc";
      case "GOLD":
        return "Gói vàng";
      case "DIAMOND":
        return "Gói kim cương";
      default:
        return "Không khả dụng";
    }
  }
}

class PricingBreakdown {
  int? minAge;
  int? maxAge;
  String? gender;
  String? currencyCode;
  double? premiumAmount;

  PricingBreakdown({
    this.minAge,
    this.maxAge,
    this.gender,
    this.currencyCode,
    this.premiumAmount,
  });

  factory PricingBreakdown.fromJson(Map<String, dynamic> json) => PricingBreakdown(
        minAge: json["minAge"],
        maxAge: json["maxAge"],
        gender: json["gender"],
        currencyCode: json["currencyCode"],
        premiumAmount: json["premiumAmount"],
      );

  Map<String, dynamic> toJson() => {
        "minAge": minAge,
        "maxAge": maxAge,
        "gender": gender,
        "currencyCode": currencyCode,
        "premiumAmount": premiumAmount,
      };
}
