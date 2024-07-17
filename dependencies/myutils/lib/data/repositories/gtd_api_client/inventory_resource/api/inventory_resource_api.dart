import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/gtd_inventory_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/request/gtd_insurance_plan_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/response/gtd_insurance_detail_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/response/gtd_insurance_plans_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_error_constant.dart';

class InventoryResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  InventoryResourceApi._();
  static final shared = InventoryResourceApi._();

  Future<List<GtdInsuranceDetail>> getInsuranceDetailByBooking(String bookingNumber) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.get, enpoint: GtdInventoryEndpoint.getInsuranceDetail(envType, bookingNumber));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInsuranceDetailRs insuranceDetailRs = JsonParser.jsonToModel(GtdInsuranceDetailRs.fromJson, response.data);
      if ((insuranceDetailRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return insuranceDetailRs.result ?? [];
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<InsurancePlan>> getInsurancePlans(GtdInsurancePlanRq insurancePlanRq) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdInventoryEndpoint.getInsurancePlans(envType));
      networkRequest.queryParams = insurancePlanRq.toMap();
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdInsurancePlanRs insurancePlanRs = JsonParser.jsonToModel(GtdInsurancePlanRs.fromJson, response.data);
      if ((insurancePlanRs.errors ?? []).isNotEmpty) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return insurancePlanRs.result ?? [];
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
