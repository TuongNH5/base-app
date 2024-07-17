import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/gtd_metasrv_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/search_airport.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/response/gtd_country_code_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/response/gtd_popular_airport_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

/// API Client for call API
class MetaResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  MetaResourceApi._();
  static final shared = MetaResourceApi._();

  Future<List<SearchAirport>> searchAirports(String keyword) async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdMetasrvEndpoint.searchAirportByKeyword(envType));
      networkRequest.queryParams = {"query": keyword};
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<SearchAirport> gtdSearchAirport = JsonParser.jsonArrayToModel(SearchAirport.fromJson, response.data);
      return gtdSearchAirport;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error searchAirports: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<GtdPopularAirportRS> getCitiPopular() async {
    try {
      final networkRequest =
          GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdMetasrvEndpoint.getPopularCities(envType));
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdPopularAirportRS gtdPopularAirport = JsonParser.jsonToModel(GtdPopularAirportRS.fromJson, response.data);
      return gtdPopularAirport;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCitiPopular: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdCountryCodeRs>> getcountryCodes() async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdMetasrvEndpoint.getCountries(envType));
      networkRequest.queryParams = {"page": 0, "size": 1000, "sort": "sortname,asc"};
      // networkRequest.data
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdCountryCodeRs> countries = JsonParser.jsonArrayToModel(GtdCountryCodeRs.fromJson, response.data);
      return countries;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getcountryCodes: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
