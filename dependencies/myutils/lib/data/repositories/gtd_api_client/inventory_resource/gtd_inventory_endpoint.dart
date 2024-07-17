import 'package:myutils/data/network/network_service/gtd_end_points.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';

class GtdInventoryEndpoint extends GtdEndpoint {
  GtdInventoryEndpoint({required super.env, required super.path});
  static const String kGetInsuranceDetail = '/gtd_service_inventory/api/insurance/insurance-detail';
  static const String kGetInsurancePlans = '/gtd_service_inventory/api/insurance/insurance-plans';

  static GtdEndpoint getInsuranceDetail(GTDEnvType envType, String bookingNumber) {
    const path = kGetInsuranceDetail;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$bookingNumber");
  }

  static GtdEndpoint getInsurancePlans(GTDEnvType envType) {
    const path = kGetInsurancePlans;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
