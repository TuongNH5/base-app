import 'package:flutter/material.dart';
import 'package:myutils/helpers/extension/colors_extension.dart';

class GtdInputMsc {
  static BoxDecoration inputDecoration = BoxDecoration(
    border: Border.all(
      color: MyColors.blueGrey,
    ),
    borderRadius: BorderRadius.circular(6),
  );

  static BoxDecoration inputErrorDecoration = BoxDecoration(
    border: Border.all(
      color: MyColors.crimsonRed,
    ),
    borderRadius: BorderRadius.circular(6),
  );

  static TextStyle inputStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: MyColors.inkBlack,
  );

  static TextStyle errorStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: MyColors.crimsonRed,
  );
}

enum GtdInputValidation {
  required,
  invalid,
  valid,
  notMatched,
}

enum GtdInputValidationField {
  text,
  email,
  phoneNumber,
}

extension GtdInputValidationFieldExt on GtdInputValidationField {
  TextInputType inputType() {
    switch (this) {
      case GtdInputValidationField.text:
        return TextInputType.text;
      case GtdInputValidationField.email:
        return TextInputType.emailAddress;
      case GtdInputValidationField.phoneNumber:
        return TextInputType.phone;
    }
  }
}