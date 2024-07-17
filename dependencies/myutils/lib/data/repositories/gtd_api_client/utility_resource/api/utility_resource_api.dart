import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/utility_resource/utility_resource.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class UtilityResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  UtilityResourceApi._();
  static final shared = UtilityResourceApi._();

  Future<GtdNotificationsRs> getNotificationItems(
      {required String userRefcode, int page = 0, required GtdNotifySenderMethod senderMethod}) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getListNotifications(envType, userRefcode));
      networkRequest.queryParams = {
        "page": page,
        "size": 15,
        "sort": "schedule,desc",
        "senderMethod": senderMethod.rawValue
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdNotificationsRs notificationsRs = JsonParser.jsonToModel(GtdNotificationsRs.fromJson, response.data);
      return notificationsRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getNotificationItems: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<int> getCountUnreadNotifications(
      {required String userRefcode}) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getCountUnreadNotifications(envType, userRefcode));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final result = response.data as Map<String, dynamic>?;
      return (result?["count"] as int?) ?? 0;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getNotificationItems: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdInvoiceSumaryResponse> getInvoiceSumary({required String userRefcode}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getInvoiceSumary(envType));
      networkRequest.queryParams = {"userRefCode": userRefcode};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInvoiceSumaryResponse invoiceSumaryResponse =
          JsonParser.jsonToModel(GtdInvoiceSumaryResponse.fromJson, response.data);
      return invoiceSumaryResponse;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getInvoiceSumary: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdInvoiceHistoryRs> getInvoiceHistories({required String userRefcode, int page = 0}) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdUtilityEndpoint.getInvoiceHistories(envType));
      List<String> status = ["SUCCESS", "PENDING", "FAILED", "CREATED", "SIGNING", "SIGNFAILED"];

      networkRequest.queryParams = {
        "userRefCode": userRefcode,
        "page": page,
        "size": 20,
        "sort": "createdDate,desc",
        "isAdminIssue": "false",
        "approvedStatuses": status.join(","),
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInvoiceHistoryRs invoiceHistoryRs = JsonParser.jsonToModel(GtdInvoiceHistoryRs.fromJson, response.data);
      return invoiceHistoryRs;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getInvoiceHistories: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
