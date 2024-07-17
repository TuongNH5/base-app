import 'package:flutter/material.dart';
import 'package:myutils/constants/app_const.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';
import 'package:myutils/data/network/network.dart';

abstract class BaseViewModel with ChangeNotifier {
  GtdAppSupplier supplier = AppConst.shared.appScheme.appSupplier;
  bool hasPayment = AppConst.shared.appScheme.hasPayment;
  @override
  void dispose() {
    super.dispose();
    Logger.i("$runtimeType is denied");
  }
}

class CardViewModel extends BaseViewModel {
  double width;
  double height;
  CardViewModel({
    required this.width,
    required this.height,
  });
}
