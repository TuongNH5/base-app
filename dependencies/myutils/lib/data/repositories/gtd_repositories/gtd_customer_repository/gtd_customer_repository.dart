import 'package:myutils/data/network/gtd_app_logger.dart';
import 'package:myutils/data/network/models/wrapped_result/result.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/api/customer_resource_api.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_company_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class GtdCustomerRepository {
  final CustomerResourceApi customerResourceApi = CustomerResourceApi.shared;

  GtdCustomerRepository._();
  static final shared = GtdCustomerRepository._();

  Future<Result<List<GtdSavedTravellerRs>, GtdApiError>> getSavedTravellers() async {
    try {
      final response = await customerResourceApi.getSavedTravellers();
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getSavedTravellers: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdSavedCompanyRs>, GtdApiError>> getSavedCompanies() async {
    try {
      final response = await customerResourceApi.getSavedCompanies("C::A::1|17933");
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getSavedCompanies: $e");
      return Error(e);
    }
  }
}
