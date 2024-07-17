import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/air_tickets_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_insurance_type.dart';
import 'package:myutils/helpers/extension/date_time_extension.dart';

class GtdInsuranceDetailRs extends GtdResponse {
  List<GtdInsuranceDetail>? result;

  GtdInsuranceDetailRs({
    this.result,
    super.isSuccess,
    super.duration,
    super.errors,
    super.infos,
    super.success,
    super.textMessage,
  });

  factory GtdInsuranceDetailRs.fromJson(Map<String, dynamic> json) => GtdInsuranceDetailRs(
        result: json["result"] == null
            ? []
            : List<GtdInsuranceDetail>.from(json["result"]!.map((x) => GtdInsuranceDetail.fromJson(x))),
        duration: json["duration"],
        success: json["success"],
        errors: json["errors"] == null ? null : List<ErrorRs>.from(json["errors"]!.map((x) => ErrorRs.fromJson(x))),
        infos: json["infos"] == null ? null : List<InfoRs>.from(json["infos"]!.map((x) => InfoRs.fromJson(x))),
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

class GtdInsuranceDetail {
  int? id;
  String? policyNo;
  String? bookingNumber;
  String? insurancePlanId;
  String? insurancePlanCode;
  String? insuranceDescription;
  String? insuranceName;
  String? insuranceType;
  String? insuranceSupplier;
  String? insuranceContent;
  String? paymentNo;
  String? insuranceRefCode;
  String? status;
  DateTime? issueDate;
  DateTime? createDate;
  String? purchaseDate;
  double? amount;
  String? currencyCode;
  List<InsuranceInfo>? insuredInfos;
  InsuranceInfo? receiverInfo;
  String? planCode;

  GtdInsuranceDetail({
    this.id,
    this.policyNo,
    this.bookingNumber,
    this.insurancePlanId,
    this.insurancePlanCode,
    this.insuranceDescription,
    this.insuranceName,
    this.insuranceType,
    this.insuranceSupplier,
    this.insuranceContent,
    this.paymentNo,
    this.insuranceRefCode,
    this.status,
    this.issueDate,
    this.createDate,
    this.purchaseDate,
    this.amount,
    this.currencyCode,
    this.insuredInfos,
    this.receiverInfo,
    this.planCode,
  });

  factory GtdInsuranceDetail.fromJson(Map<String, dynamic> json) => GtdInsuranceDetail(
        id: json["id"],
        policyNo: json["policyNo"],
        bookingNumber: json["bookingNumber"],
        insurancePlanId: json["insurancePlanId"],
        insurancePlanCode: json["insurancePlanCode"],
        insuranceDescription: json["insuranceDescription"],
        insuranceName: json["insuranceName"],
        insuranceType: json["insuranceType"],
        insuranceSupplier: json["insuranceSupplier"],
        insuranceContent: json["insuranceContent"],
        paymentNo: json["paymentNo"],
        insuranceRefCode: json["insuranceRefCode"],
        status: json["status"],
        issueDate: json["issueDate"] == null ? null : DateTime.parse(json["issueDate"]),
        createDate: json["createDate"] == null ? null : DateTime.parse(json["createDate"]),
        purchaseDate: json["purchaseDate"],
        amount: json["amount"],
        currencyCode: json["currencyCode"],
        insuredInfos: json["insuredInfos"] == null
            ? []
            : List<InsuranceInfo>.from(json["insuredInfos"]!.map((x) => InsuranceInfo.fromJson(x))),
        receiverInfo: json["receiverInfo"] == null ? null : InsuranceInfo.fromJson(json["receiverInfo"]),
        planCode: json["planCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "policyNo": policyNo,
        "bookingNumber": bookingNumber,
        "insurancePlanId": insurancePlanId,
        "insurancePlanCode": insurancePlanCode,
        "insuranceDescription": insuranceDescription,
        "insuranceName": insuranceName,
        "insuranceType": insuranceType,
        "insuranceSupplier": insuranceSupplier,
        "insuranceContent": insuranceContent,
        "paymentNo": paymentNo,
        "insuranceRefCode": insuranceRefCode,
        "status": status,
        "issueDate":
            "${issueDate!.year.toString().padLeft(4, '0')}-${issueDate!.month.toString().padLeft(2, '0')}-${issueDate!.day.toString().padLeft(2, '0')}",
        "createDate":
            "${createDate!.year.toString().padLeft(4, '0')}-${createDate!.month.toString().padLeft(2, '0')}-${createDate!.day.toString().padLeft(2, '0')}",
        "purchaseDate": purchaseDate,
        "amount": amount,
        "currencyCode": currencyCode,
        "insuredInfos": insuredInfos == null ? [] : List<dynamic>.from(insuredInfos!.map((x) => x.toJson())),
        "receiverInfo": receiverInfo?.toJson(),
        "planCode": planCode,
      };
}

class InsuranceInfo {
  String? name;
  String? dob;
  String? passport;
  String? relationship;
  String? address;
  String? email;
  String? mobile;
  String? addressDistrict;
  String? gender;

  InsuranceInfo({
    this.name,
    this.dob,
    this.passport,
    this.relationship,
    this.address,
    this.email,
    this.mobile,
    this.addressDistrict,
  });

  factory InsuranceInfo.fromJson(Map<String, dynamic> json) => InsuranceInfo(
        name: json["name"],
        dob: json["dob"],
        passport: json["passport"],
        relationship: json["relationship"],
        address: json["address"],
        email: json["email"],
        mobile: json["mobile"],
        addressDistrict: json["addressDistrict"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "passport": passport,
        "relationship": relationship,
        "address": address,
        "email": email,
        "mobile": mobile,
        "addressDistrict": addressDistrict,
      };
}

extension InsuranceInfoMapper on InsuranceInfo {
  static InsuranceInfo fromTravelerInfoElement(
      TravelerInfoElement travelerInfoElement, GtdInsuranceType insuranceType) {
    String gender = "";
    switch (travelerInfoElement.adultType) {
      case "ADT":
        gender = travelerInfoElement.gender == "FEMALE" ? "Nam" : "Nữ";
        break;

      default:
        gender = travelerInfoElement.gender == "FEMALE" ? "Bé trai" : "Bé gái";
        break;
    }
    InsuranceInfo insuranceInfo = InsuranceInfo()
      ..name = "${travelerInfoElement.surName} ${travelerInfoElement.firstName}"
      ..dob = travelerInfoElement.dob?.utcDate("dd/MM/yyyy")
      ..gender = gender;
    return insuranceInfo;
  }
}

extension GtdInsuranceDetailHelper on GtdInsuranceDetail {
  GtdInsuranceType? get typeEnum => GtdInsuranceType.findByCode(insuranceType ?? "");
  GtdInsuranceStatus? get statusEnum => GtdInsuranceStatus.findByCode(status ?? "");
}
