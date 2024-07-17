import 'package:flutter/material.dart';
import 'package:myutils/data/configuration/color_config/colors_extension.dart';

enum GtdInsuranceType {
  delay("DELAY_INSURANCE", "DELAY"),
  flexi("FLEXI_INSURANCE", "FLEXI");

  final String value;
  final String subType;
  const GtdInsuranceType(this.value, this.subType);
  static GtdInsuranceType? findByCode(String code) {
    return GtdInsuranceType.values.where((element) => element.value == code).firstOrNull;
  }
}

enum GtdInsuranceStatus {
  failed("FAILED", Colors.red),
  onHold("ONHOLD", Colors.blue),
  register("REGISTER", Colors.amber),
  success("CONFIRMED", CustomColors.mainGreen);

  final String value;
  final Color color;
  const GtdInsuranceStatus(this.value, this.color);
  static GtdInsuranceStatus? findByCode(String code) {
    return GtdInsuranceStatus.values.where((element) => element.value == code).firstOrNull;
  }
}
