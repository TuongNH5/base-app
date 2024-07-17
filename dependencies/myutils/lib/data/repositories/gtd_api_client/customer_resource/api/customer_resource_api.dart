import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_app_logger.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network_service/gtd_dio_exception.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';
import 'package:myutils/data/network/network_service/gtd_network_request.dart';
import 'package:myutils/data/network/network_service/gtd_network_service.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/gtd_customer_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_company_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

/// API Client for call API
class CustomerResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  CustomerResourceApi._();
  static final shared = CustomerResourceApi._();

  Future<List<GtdSavedTravellerRs>> getSavedTravellers() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdCustomerEndpoint.getSavedTravellers(envType));
      networkRequest.queryParams = {"page": 0, "size": 300};
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedTravellerRs> savedTravelers =
          JsonParser.jsonArrayToModel(GtdSavedTravellerRs.fromJson, response.data);
      return savedTravelers;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error unknown: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

    Future<List<GtdSavedCompanyRs>> getSavedCompanies(String userRefCode) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdCustomerEndpoint.getSavedCompanies(envType));
      networkRequest.queryParams = {"userRefCode": userRefCode};
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdSavedCompanyRs> savedCompanies =
          JsonParser.jsonArrayToModel(GtdSavedCompanyRs.fromJson, response.data);
      return savedCompanies;
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
