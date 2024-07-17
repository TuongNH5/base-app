import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myutils/helpers/extension/image_extension.dart';

enum PaymentMethodType {
  atm("payment-atm", "Thẻ ATM nội địa", "International banking", "", "",
      "ATM_DEBIT"),
  credit("payment-credit", "Thẻ tín dụng quốc tế", "Visa, Mastercard, JCB", "",
      "", "CREDIT"),
  vnpayCredit("payment-credit", "Thẻ tín dụng quốc tế",
      "Credit Card: Visa, Master card, JCB", "", "", "VNPAY_CREDIT"),
  qr("payment-qr", "Thanh toán bằng QR code qua cổng ứng dụng VN Pay", "", "",
      "", "VNPAYQR"),
  zaloPay("payment-zalo", "Thanh toán bằng ví Zalo Pay", "", "-50,000 VND",
      "Dành cho khách hàng lần đầu thanh toán qua ví Zalo Pay", "ZALO"),
  viettelPay("payment-viettel", "Thanh toán bằng ví Vietel Pay", "", "", "",
      "VIETTELPAY"),
  momo("payment-momo", "Thanh toán bằng ví Momo", "", "", "", "MOMO"),
  payoo("payment-payoo", "Thanh toán qua Payoo ở các cửa hàng tiện lợi", "", "",
      "", "PAYOO"),
  kredivo(
      "payment-kredivo",
      "Thanh toán trả góp Kredivo",
      "",
      "Trả góp lãi suất 0%",
      "Duyệt nhanh chóng với CMND/CCCD chỉ từ 0% & trả góp linh hoạt lên đến 3 tháng",
      "KREDIVO"),
  paylater("payment-later", "Giữ chỗ, chờ thanh toán sau", "", "",
      "Thanh toán trực tiếp tại văn phòng hoặc chuyển khoản", "CASH");

  final String iconName;
  final String title;
  final String desTitle;
  final String discount;
  final String subTitle;
  final String code;


  const PaymentMethodType(this.iconName, this.title, this.desTitle, this.discount, this.subTitle, this.code);


  Widget get iconImage {
    var image =
        GtdImage.svgFromSupplier(assetName: 'assets/payment/$iconName.svg');
    return image;
  }

  String get subTitleText {
    switch (this) {
      case PaymentMethodType.zaloPay:
        return 'payment.paymentMethods.zaloPay.subtitle'.tr();
      case PaymentMethodType.kredivo:
        return 'payment.paymentMethods.kredivo.subtitle'.tr();
      case PaymentMethodType.paylater:
        return 'payment.paymentMethods.paylater.subtitle'.tr();
      default:
        return subTitle;
    }
  }
  String get discountText {
    switch (this) {
      case PaymentMethodType.zaloPay:
        return 'payment.paymentMethods.zaloPay.discount'.tr();
      case PaymentMethodType.kredivo:
        return 'payment.paymentMethods.kredivo.discount'.tr();
      default:
        return discount;
    }

  }
  String get titleText {
    switch (this) {
      case PaymentMethodType.atm:
        return 'payment.paymentMethods.atm.title'.tr();
      case PaymentMethodType.credit:
        return 'payment.paymentMethods.credit.title'.tr();
      case PaymentMethodType.vnpayCredit:
        return 'payment.paymentMethods.vnpayCredit.title'.tr();
      case PaymentMethodType.qr:
        return 'payment.paymentMethods.qr.title'.tr();
      case PaymentMethodType.zaloPay:
        return 'payment.paymentMethods.zaloPay.title'.tr();
      case PaymentMethodType.viettelPay:
        return 'payment.paymentMethods.viettelPay.title'.tr();
      case PaymentMethodType.momo:
        return 'payment.paymentMethods.momo.title'.tr();
      case PaymentMethodType.payoo:
        return 'payment.paymentMethods.payoo.title'.tr();
      case PaymentMethodType.kredivo:
        return 'payment.paymentMethods.kredivo.title'.tr();
      case PaymentMethodType.paylater:
        return 'payment.paymentMethods.paylater.title'.tr();
      default:
        return title;
    }
  }

  bool get hasPaymentFee {
    switch (this) {
      case PaymentMethodType.credit:
        return true;
      case PaymentMethodType.vnpayCredit:
        return true;
      case PaymentMethodType.atm:
        return true;
      case PaymentMethodType.qr:
        return true;
      case PaymentMethodType.viettelPay:
        return true;
      case PaymentMethodType.momo:
        return true;
      case PaymentMethodType.zaloPay:
        return true;
      case PaymentMethodType.payoo:
        return true;
      case PaymentMethodType.paylater:
        return false;
      // case PaymentMethodType.balance:
      //     return true;
      // case PaymentMethodType.airPay:
      //     return true;
      case PaymentMethodType.kredivo:
        return true;
      default:
        return false;
    }
  }

  bool get allowPromotion {
    switch (this) {
      case PaymentMethodType.credit:
        return true;
      case PaymentMethodType.vnpayCredit:
        return true;
      case PaymentMethodType.atm:
        return true;
      case PaymentMethodType.qr:
        return true;
      case PaymentMethodType.viettelPay:
        return true;
      case PaymentMethodType.momo:
        return true;
      case PaymentMethodType.zaloPay:
        return true;
      case PaymentMethodType.payoo:
        return false;
      case PaymentMethodType.paylater:
        return false;
      // case PaymentMethodType.balance:
      //     return true;
      // case PaymentMethodType.airPay:
      //     return true;
      case PaymentMethodType.kredivo:
        return true;
      default:
        return false;
    }
  }

  static PaymentMethodType? paymentItemTypeWithCode(String code) {
    return PaymentMethodType.values
        .firstWhereOrNull((element) => element.code == code);
  }

  static List<PaymentMethodType> findByCodes(List<String> codes) {
    return codes
        .map((e) => PaymentMethodType.paymentItemTypeWithCode(e))
        .whereType<PaymentMethodType>()
        .toList();
  }

  static String nameFromCode(String code) {
    return PaymentMethodType.values
            .firstWhereOrNull((type) => type.code == code)
            ?.title ??
        '';
  }
}
class AppStrings {
  static final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'atmTitle': 'Domestic ATM card',
      'atmDesTitle': 'International banking',
      // Thêm các chuỗi khác
    },
    'vi': {
      'atmTitle': 'Thẻ ATM nội địa',
      'atmDesTitle': 'International banking',
      // Thêm các chuỗi khác
    },
  };

  static String get(String key, [String locale = 'en']) {
    return _localizedStrings[locale]?[key] ?? key;
  }
}