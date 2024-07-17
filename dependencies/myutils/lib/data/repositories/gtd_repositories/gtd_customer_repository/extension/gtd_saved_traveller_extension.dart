import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';

extension GtdSavedTravellerRsHelper on GtdSavedTravellerRs {
  String get fullname {
    return "$surName $firstName";
  }

  String get subInfoEmailPhone {
    return "${email ?? ""}${(phoneNumber1 ?? "").isNotEmpty ? " - $phoneNumber1" : ""}";
  }

  FlightAdultType? get adultTypeEnum {
    return FlightAdultType.findByCode(adultType ?? "");
  }

  bool get isMale {
    return (gender ?? "").toLowerCase() == "male";
  }
}
