import 'package:myutils/data/network/network_service/gtd_end_points.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';

class GtdMetasrvEndpoint extends GtdEndpoint {
  GtdMetasrvEndpoint({required super.env, required super.path});
  static const String kCitiPopular = '/metasrv/api/airports/Citiespopular';
  static const String kSearchAirPort = '/metasrv/api/_search/airports';
  static const String kCountryCodes = '/metasrv/api/country-codes';

  static GtdEndpoint searchAirportByKeyword(GTDEnvType envType) {
    const path = kSearchAirPort;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getPopularCities(GTDEnvType envType) {
    const path = kCitiPopular;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

    static GtdEndpoint getCountries(GTDEnvType envType) {
    const path = kCountryCodes;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
