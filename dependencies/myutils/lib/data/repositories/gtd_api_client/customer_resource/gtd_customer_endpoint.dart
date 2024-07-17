import 'package:myutils/data/network/network_service/gtd_end_points.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';

class GtdCustomerEndpoint extends GtdEndpoint {
  GtdCustomerEndpoint({required super.env, required super.path});
  static const String kSavedTravellers = '/api/customers/travellers';
  static const String kSavedCompanies = '/utilitysrv/api/approval-invoices/saved-business';

  static GtdEndpoint getSavedTravellers(GTDEnvType envType) {
    const path = kSavedTravellers;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

    static GtdEndpoint getSavedCompanies(GTDEnvType envType) {
    const path = kSavedCompanies;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
