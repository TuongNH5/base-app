// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_discount_type.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_product_type.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_promotion.dart';

class GtdPromotion {
  int? id;
  List<String>? airlinesCode;
  List<String>? bankCode;
  List<String>? cardType;
  String? createdBy;
  String? contentDescription;
  DateTime? createDate;
  double? discountAmount;
  GtdDiscountType? discountValueType;
  DateTime? effectiveFrom;
  DateTime? effectiveTo;
  DateTime? endTime;
  double? lowerPrice;
  String? name;
  int? priority;
  GtdProductType? productType;
  String? promotionOption;
  int? promotionSlot;
  GtdPromotionType? promotionType;
  List<String>? saleChannel;
  DateTime? startTime;
  String? status;
  String? updatedBy;
  DateTime? updatedDate;
  double? upperPrice;
  int? usedSlot;
  dynamic image;
  String? tcUrl;
  String? voucherCode;
  GtdPromotion({
    this.id,
    this.airlinesCode,
    this.bankCode,
    this.cardType,
    this.createdBy,
    this.contentDescription,
    this.createDate,
    this.discountAmount,
    this.discountValueType,
    this.effectiveFrom,
    this.effectiveTo,
    this.endTime,
    this.lowerPrice,
    this.name,
    this.priority,
    this.productType,
    this.promotionOption,
    this.promotionSlot,
    this.saleChannel,
    this.startTime,
    this.status,
    this.updatedBy,
    this.updatedDate,
    this.upperPrice,
    this.usedSlot,
    required this.image,
    this.tcUrl,
    this.voucherCode,
  });

  GtdPromotion copyWith({
    int? id,
    List<String>? airlinesCode,
    List<String>? bankCode,
    List<String>? cardType,
    String? createdBy,
    String? contentDescription,
    DateTime? createDate,
    double? discountAmount,
    GtdDiscountType? discountValueType,
    DateTime? effectiveFrom,
    DateTime? effectiveTo,
    DateTime? endTime,
    double? lowerPrice,
    String? name,
    int? priority,
    GtdProductType? productType,
    String? promotionOption,
    int? promotionSlot,
    List<String>? saleChannel,
    DateTime? startTime,
    String? status,
    String? updatedBy,
    DateTime? updatedDate,
    double? upperPrice,
    int? usedSlot,
    dynamic image,
    String? tcUrl,
    String? voucherCode,
  }) {
    return GtdPromotion(
      id: id ?? this.id,
      airlinesCode: airlinesCode ?? this.airlinesCode,
      bankCode: bankCode ?? this.bankCode,
      cardType: cardType ?? this.cardType,
      createdBy: createdBy ?? this.createdBy,
      contentDescription: contentDescription ?? this.contentDescription,
      createDate: createDate ?? this.createDate,
      discountAmount: discountAmount ?? this.discountAmount,
      discountValueType: discountValueType ?? this.discountValueType,
      effectiveFrom: effectiveFrom ?? this.effectiveFrom,
      effectiveTo: effectiveTo ?? this.effectiveTo,
      endTime: endTime ?? this.endTime,
      lowerPrice: lowerPrice ?? this.lowerPrice,
      name: name ?? this.name,
      priority: priority ?? this.priority,
      productType: productType ?? this.productType,
      promotionOption: promotionOption ?? this.promotionOption,
      promotionSlot: promotionSlot ?? this.promotionSlot,
      saleChannel: saleChannel ?? this.saleChannel,
      startTime: startTime ?? this.startTime,
      status: status ?? this.status,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      upperPrice: upperPrice ?? this.upperPrice,
      usedSlot: usedSlot ?? this.usedSlot,
      image: image ?? this.image,
      tcUrl: tcUrl ?? this.tcUrl,
      voucherCode: voucherCode ?? this.voucherCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'airlinesCode': airlinesCode,
      'bankCode': bankCode,
      'cardType': cardType,
      'createdBy': createdBy,
      'contentDescription': contentDescription,
      'createDate': createDate?.millisecondsSinceEpoch,
      'discountAmount': discountAmount,
      'discountValueType': discountValueType?.value,
      'effectiveFrom': effectiveFrom?.millisecondsSinceEpoch,
      'effectiveTo': effectiveTo?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'lowerPrice': lowerPrice,
      'name': name,
      'priority': priority,
      'productType': productType?.value,
      'promotionOption': promotionOption,
      'promotionSlot': promotionSlot,
      'saleChannel': saleChannel,
      'startTime': startTime?.millisecondsSinceEpoch,
      'status': status,
      'updatedBy': updatedBy,
      'updatedDate': updatedDate?.millisecondsSinceEpoch,
      'upperPrice': upperPrice,
      'usedSlot': usedSlot,
      'image': image,
      'tcUrl': tcUrl,
      'voucherCode': voucherCode,
    };
  }

  factory GtdPromotion.fromMap(Map<String, dynamic> map) {
    return GtdPromotion(
      id: map['id'] != null ? map['id'] as int : null,
      airlinesCode: map['airlinesCode'] == null ? null : List<String>.from((map['airlinesCode'] as List<String>)),
      bankCode: map['bankCode'] == null ? null : List<String>.from((map['bankCode'] as List<String>)),
      cardType: map['cardType'] == null ? null : List<String>.from((map['cardType'] as List<String>)),
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      contentDescription: map['description'] != null ? map['description'] as String : null,
      createDate: map['createDate'] == null ? null : DateTime.parse(map["createDate"]),
      discountAmount: map['discountAmount'] != null ? map['discountAmount'] as double : null,
      discountValueType: GtdDiscountType.values.where((element) => map['discountValueType'] == element).firstOrNull,
      effectiveFrom:
          map['effectiveFrom'] != null ? DateTime.fromMillisecondsSinceEpoch(map['effectiveFrom'] as int) : null,
      effectiveTo: map['effectiveTo'] != null ? DateTime.fromMillisecondsSinceEpoch(map['effectiveTo'] as int) : null,
      endTime: map['endTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int) : null,
      lowerPrice: map['lowerPrice'] != null ? map['lowerPrice'] as double : null,
      name: map['name'] != null ? map['name'] as String : null,
      priority: map['priority'] != null ? map['priority'] as int : null,
      productType: map['productType'] == null
          ? null
          : GtdProductType.values.where((element) => map['productType'] == element).firstOrNull,
      promotionOption: map['promotionOption'] != null ? map['promotionOption'] as String : null,
      promotionSlot: map['promotionSlot'] != null ? map['promotionSlot'] as int : null,
      saleChannel: map['saleChannel'] == null ? null : List<String>.from((map['saleChannel'] as List<String>)),
      startTime: map['startTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int) : null,
      status: map['status'] != null ? map['status'] as String : null,
      updatedBy: map['updatedBy'] != null ? map['updatedBy'] as String : null,
      updatedDate: map['updatedDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedDate'] as int) : null,
      upperPrice: map['upperPrice'] != null ? map['upperPrice'] as double : null,
      usedSlot: map['usedSlot'] != null ? map['usedSlot'] as int : null,
      image: map['image'] as dynamic,
      tcUrl: map['tcUrl'] != null ? map['tcUrl'] as String : null,
      voucherCode: map['voucherCode'] != null ? map['voucherCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdPromotion.fromJson(String source) => GtdPromotion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GtdPromotion(id: $id, airlinesCode: $airlinesCode, bankCode: $bankCode, cardType: $cardType, createdBy: $createdBy, contentDescription: $contentDescription, createDate: $createDate, discountAmount: $discountAmount, discountValueType: $discountValueType, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, endTime: $endTime, lowerPrice: $lowerPrice, name: $name, priority: $priority, productType: $productType, promotionOption: $promotionOption, promotionSlot: $promotionSlot, saleChannel: $saleChannel, startTime: $startTime, status: $status, updatedBy: $updatedBy, updatedDate: $updatedDate, upperPrice: $upperPrice, usedSlot: $usedSlot, image: $image, tcUrl: $tcUrl, voucherCode: $voucherCode)';
  }

  @override
  bool operator ==(covariant GtdPromotion other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.airlinesCode, airlinesCode) &&
        listEquals(other.bankCode, bankCode) &&
        listEquals(other.cardType, cardType) &&
        other.createdBy == createdBy &&
        other.contentDescription == contentDescription &&
        other.createDate == createDate &&
        other.discountAmount == discountAmount &&
        other.discountValueType == discountValueType &&
        other.effectiveFrom == effectiveFrom &&
        other.effectiveTo == effectiveTo &&
        other.endTime == endTime &&
        other.lowerPrice == lowerPrice &&
        other.name == name &&
        other.priority == priority &&
        other.productType == productType &&
        other.promotionOption == promotionOption &&
        other.promotionSlot == promotionSlot &&
        listEquals(other.saleChannel, saleChannel) &&
        other.startTime == startTime &&
        other.status == status &&
        other.updatedBy == updatedBy &&
        other.updatedDate == updatedDate &&
        other.upperPrice == upperPrice &&
        other.usedSlot == usedSlot &&
        other.image == image &&
        other.tcUrl == tcUrl &&
        other.voucherCode == voucherCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        airlinesCode.hashCode ^
        bankCode.hashCode ^
        cardType.hashCode ^
        createdBy.hashCode ^
        contentDescription.hashCode ^
        createDate.hashCode ^
        discountAmount.hashCode ^
        discountValueType.hashCode ^
        effectiveFrom.hashCode ^
        effectiveTo.hashCode ^
        endTime.hashCode ^
        lowerPrice.hashCode ^
        name.hashCode ^
        priority.hashCode ^
        productType.hashCode ^
        promotionOption.hashCode ^
        promotionSlot.hashCode ^
        saleChannel.hashCode ^
        startTime.hashCode ^
        status.hashCode ^
        updatedBy.hashCode ^
        updatedDate.hashCode ^
        upperPrice.hashCode ^
        usedSlot.hashCode ^
        image.hashCode ^
        tcUrl.hashCode ^
        voucherCode.hashCode;
  }
}
