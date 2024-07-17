import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/json_models/gtd_promotion.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/json_models/gtd_voucher_info.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/request/gtd_redeem_voucher_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/request/gtd_void_voucher_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/response/gtd_redeem_voucher_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/response/gtd_void_voucher_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/models/response/gtd_voucher_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/payment_resource/payment_resource.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_product_type.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

/// API Client for call API
class PaymentResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  PaymentResourceApi._();
  static final shared = PaymentResourceApi._();

  Future<List<String>> getPaymentAvailable() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdPaymentEndpoint.paymentAvailable(envType));
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<String> paymentMethods = List<String>.from(response.data);
      return paymentMethods;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getPaymentAvailable: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<String>> getPaymentDebitOptions() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdPaymentEndpoint.paymentAvailable(envType));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<String>? debitBanks = List<String>.from(response.data);
      return debitBanks;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdPaymentFeeRs> getPaymentFee(
      {required String bookingNumber,
      required String paymentType,
      double tempDiscount = 0,
      required double totalFare}) async {
    try {
      var body = {
        "bookingNumber": bookingNumber,
        "paymentType": paymentType,
        "tempDiscountAmount": tempDiscount,
        "tempTotalFare": totalFare
      };
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.post, enpoint: GtdPaymentEndpoint.paymentFee(envType), data: body);

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdPaymentFeeRs paymentFeeRs = JsonParser.jsonToModel(GtdPaymentFeeRs.fromJson, response.data);
      if ((paymentFeeRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(paymentFeeRs.errors ?? []);
      }
      return paymentFeeRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getPaymentFee: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdPayBookingRs> paymentBooking({required GtdPaymentBookingRq paymentBookingRq}) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdPaymentEndpoint.paymentBooking(envType), data: paymentBookingRq.toJson());

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdPayBookingRs payBookingRs = JsonParser.jsonToModel(GtdPayBookingRs.fromJson, response.data);
      if ((payBookingRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorRs(payBookingRs.errors ?? []);
      }
      return payBookingRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getPaymentFee: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdKredivoLoanDetail> getLoanKredivo(GtdKredivoLoanRq kredivoLoanRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdPaymentEndpoint.getLoanKredivo(envType), data: kredivoLoanRq.toMap());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdKredivoLoanDetail kredivoLoanDetail = JsonParser.jsonToModel(GtdKredivoLoanDetail.fromJson, response.data);
      if (kredivoLoanDetail.status != 1) {
        throw GtdApiError(message: "Không lấy được dữ liệu Kredivo");
      }
      return kredivoLoanDetail;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getLoanKredivo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  //PROMOTIONS VOUCHER

  Future<List<GtdPromotion>> getPromotionVoucher({
    required GtdProductType productTypes,
    String voucherCode = "",
    String promotionStatus = "PUBLISHING",
  }) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdPaymentEndpoint.getPromotionVoucher(envType));
      networkRequest.queryParams = {
        "productTypes": productTypes.value,
        "voucherCode": voucherCode,
        "promotionStatus": promotionStatus
      };

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdPromotion> promotions = JsonParser.jsonArrayToModel(GtdPromotion.fromMap, response.data);
      return promotions;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getPromotionVoucher: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdVoucherRs> validateVoucher({
    required String bookingNumber,
    String? voucherCode,
    String? paymentType
  }) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.post, enpoint: GtdPaymentEndpoint.validateVoucher(envType), data: {
            "bookingNumber": bookingNumber,
            "voucherCode": voucherCode ?? '',
            "paymentType": paymentType ?? 'OTHER'

          });
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdVoucherRs voucherRs = JsonParser.jsonToModel(GtdVoucherRs.fromMap, response.data);
      return voucherRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error validateVoucher: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdVoucherRs> getVoucher(
      {required String voucherCode, required String bookingNumber, required double totalAmount}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.post, enpoint: GtdPaymentEndpoint.getVoucher(envType, voucherCode));

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdVoucherInfoRs voucherInfoRs = JsonParser.jsonToModel(GtdVoucherInfoRs.fromMap, response.data);
      GtdVoucherRs voucherRs = GtdVoucherRsMapper.fromGtdVoucherInfoRs(
          bookingNumber: bookingNumber, totalAmount: totalAmount, voucherInfoRs: voucherInfoRs);
      return voucherRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getVoucher: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdVoidVoucherRs> voidVoucher({
    required GtdVoidVoucherRq voidVoucherRq,
  }) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdPaymentEndpoint.voidVoucher(envType), data: voidVoucherRq.toMap());

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdVoidVoucherRs voidVoucherRs = JsonParser.jsonToModel(GtdVoidVoucherRs.fromMap, response.data);
      return voidVoucherRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error voidVoucher: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdRedeemVoucherRs> redeemVoucher({
    required GtdRedeemVoucherRq redeemVoucherRq,
  }) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdPaymentEndpoint.redeemVoucher(envType), data: redeemVoucherRq.toMap());

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdRedeemVoucherRs redeemVoucherRs = JsonParser.jsonToModel(GtdRedeemVoucherRs.fromMap, response.data);
      return redeemVoucherRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error voidVoucher: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
