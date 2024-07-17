// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GtdVoucherDiscount {
  String? type;
  double? percentOff;
  double? amountLimit;
  double? amountOff;
  GtdVoucherDiscount({
    this.type,
    this.percentOff,
    this.amountLimit,
    this.amountOff,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'percentOff': percentOff,
      'amountLimit': amountLimit,
      'amountOff': amountOff,
    };
  }

  factory GtdVoucherDiscount.fromMap(Map<String, dynamic> map) {
    return GtdVoucherDiscount(
      type: map['type'] != null ? map['type'] as String : null,
      percentOff: map['percentOff'] != null ? map['percentOff'] as double : null,
      amountLimit: map['amountLimit'] != null ? map['amountLimit'] as double : null,
      amountOff: map['amountOff'] != null ? map['amountOff'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherDiscount.fromJson(String source) =>
      GtdVoucherDiscount.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GtdVoucherBarCode {
  String? id;
  String? url;
  GtdVoucherBarCode({
    this.id,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
    };
  }

  factory GtdVoucherBarCode.fromMap(Map<String, dynamic> map) {
    return GtdVoucherBarCode(
      id: map['id'] != null ? map['id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherBarCode.fromJson(String source) =>
      GtdVoucherBarCode.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GtdVoucherAssets {
  GtdVoucherBarCode? qr;
  GtdVoucherBarCode? barcode;
  GtdVoucherAssets({
    this.qr,
    this.barcode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qr': qr?.toMap(),
      'barcode': barcode?.toMap(),
    };
  }

  factory GtdVoucherAssets.fromMap(Map<String, dynamic> map) {
    return GtdVoucherAssets(
      qr: map['qr'] != null ? GtdVoucherBarCode.fromMap(map['qr'] as Map<String, dynamic>) : null,
      barcode: map['barcode'] != null ? GtdVoucherBarCode.fromMap(map['barcode'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherAssets.fromJson(String source) =>
      GtdVoucherAssets.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GtdVoucherDetail {
  String? id;
  String? code;
  String? campaign;
  String? category;
  String? type;
  GtdVoucherDiscount? discount;
  DateTime? startDate;
  DateTime? expirationDate;
  bool? active;
  GtdVoucherAssets? assets;
  GtdVoucherDetail({
    this.id,
    this.code,
    this.campaign,
    this.category,
    this.type,
    this.discount,
    this.startDate,
    this.expirationDate,
    this.active,
    this.assets,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'campaign': campaign,
      'category': category,
      'type': type,
      'discount': discount?.toMap(),
      'startDate': startDate?.millisecondsSinceEpoch,
      'expirationDate': expirationDate?.millisecondsSinceEpoch,
      'active': active,
      'assets': assets?.toMap(),
    };
  }

  factory GtdVoucherDetail.fromMap(Map<String, dynamic> map) {
    return GtdVoucherDetail(
      id: map['id'] != null ? map['id'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      campaign: map['campaign'] != null ? map['campaign'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      discount: map['discount'] != null ? GtdVoucherDiscount.fromMap(map['discount'] as Map<String, dynamic>) : null,
      startDate: map['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int) : null,
      expirationDate:
          map['expirationDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['expirationDate'] as int) : null,
      active: map['active'] != null ? map['active'] as bool : null,
      assets: map['assets'] != null ? GtdVoucherAssets.fromMap(map['assets'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherDetail.fromJson(String source) =>
      GtdVoucherDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GtdVoucherInfoRs {
  int? statusCode;
  String? errorMessage;
  String? key;
  String? details;
  String? requestID;
  GtdVoucherDetail? data;
  bool? success;
  GtdVoucherInfoRs({
    this.statusCode,
    this.errorMessage,
    this.key,
    this.details,
    this.requestID,
    this.data,
    this.success,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'errorMessage': errorMessage,
      'key': key,
      'details': details,
      'requestID': requestID,
      'data': data?.toMap(),
      'success': success,
    };
  }

  factory GtdVoucherInfoRs.fromMap(Map<String, dynamic> map) {
    return GtdVoucherInfoRs(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      errorMessage: map['errorMessage'] != null ? map['errorMessage'] as String : null,
      key: map['key'] != null ? map['key'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      requestID: map['requestID'] != null ? map['requestID'] as String : null,
      data: map['data'] != null ? GtdVoucherDetail.fromMap(map['data'] as Map<String, dynamic>) : null,
      success: map['success'] != null ? map['success'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdVoucherInfoRs.fromJson(String source) =>
      GtdVoucherInfoRs.fromMap(json.decode(source) as Map<String, dynamic>);
}
