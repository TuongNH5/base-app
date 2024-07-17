import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/fare.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_price.dart';

class GtdPassengerFareInfo {
  GtdPrice? passengerFare;
  FlightAdultType adultType = FlightAdultType.adult;
  int quantity = 0;
  GtdPassengerFareInfo();
  factory GtdPassengerFareInfo.fromFare(Fare fare) {
    GtdPassengerFareInfo passengerFareInfo = GtdPassengerFareInfo();
    passengerFareInfo.passengerFare = GtdPrice.fromFare(fare);
    passengerFareInfo.quantity = fare.passengerTypeQuantities?.quantity ?? 0;
    passengerFareInfo.adultType =
        FlightAdultType.values.firstWhere((element) => element.value == fare.passengerTypeQuantities?.code);
    return passengerFareInfo;
  }
}