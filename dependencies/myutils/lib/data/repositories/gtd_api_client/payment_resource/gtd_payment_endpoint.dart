import 'package:myutils/data/network/network.dart';

class GtdPaymentEndpoint extends GtdEndpoint {
  GtdPaymentEndpoint({required super.env, required super.path});
  //PAYMENT METHOD
  static const String kPaymentDebitOptions = "/api/air-tickets/payment-debit-options";
  static const String kAvailablePaymentType = '/api/payment/get-available-payment-type';
  static const String kPaymentBooking = '/api/payment/pay';
  static const String kPaymentFee = '/api/payments/payment-fee-options';
  static const String kPaymentKredivoDetail = '/api/payments/kredivo/get-loan-calculator';

  //PROMOTION
  static const String kPromotion = '/api/_search/promotion-credit-card';
  static const String kPromotionVoucher = '/pricingsrv/api/promotion/filter-by-voucher';
  static const String kValidatePromotion = '/pricingsrv/api/promotion/validate';
  static const String kRedeemPromotion = '/api/payments/promotion/redeem';
  static const String kGetVoucher = '/pricingsrv/api/voucher/{code}';
  static const String kValidateVoucher = '/api/payments/voucher/validate';
  static const String kRedeemVoucher = '/api/payments/voucher/redeem';
  static const String kVoidVoucher = '/api/payments/voucher/void';

  static GtdEndpoint paymentDebitOptions(GTDEnvType envType) {
    const path = kPaymentDebitOptions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint paymentAvailable(GTDEnvType envType) {
    const path = kAvailablePaymentType;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint paymentBooking(GTDEnvType envType) {
    const path = kPaymentBooking;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint paymentFee(GTDEnvType envType) {
    const path = kPaymentFee;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getLoanKredivo(GTDEnvType envType) {
    const path = kPaymentKredivoDetail;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getPromotion(GTDEnvType envType) {
    // queryParameters = ["status" : "PUBLISHING", "productType" : GtdProductType]
    const path = kPromotion;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getPromotionVoucher(GTDEnvType envType) {
    const path = kPromotionVoucher;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint validatePromotion(GTDEnvType envType) {
    const path = kValidatePromotion;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint redeemPromotion(GTDEnvType envType) {
    const path = kRedeemPromotion;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getVoucher(GTDEnvType envType, String code) {
    const path = kGetVoucher;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: '$path/$code');
  }

  static GtdEndpoint validateVoucher(GTDEnvType envType) {
    const path = kValidateVoucher;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint redeemVoucher(GTDEnvType envType) {
    const path = kRedeemVoucher;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint voidVoucher(GTDEnvType envType) {
    const path = kVoidVoucher;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
