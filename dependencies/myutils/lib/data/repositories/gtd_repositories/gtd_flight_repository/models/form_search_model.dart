import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/gtd_flight_low_search_rq.dart';
import 'package:myutils/helpers/extension/date_time_extension.dart';

class FormSearchPayloadModel {
  FormSearchPayloadModel({this.gtdLocationInfo, this.dateItinerary, this.passengersItinerary, this.page, this.size});

  GtdLocationInfo? gtdLocationInfo;
  DateItinerary? dateItinerary;
  PassengersItinerary? passengersItinerary;
  int? page;
  int? size;

  GtdFlightLowSearchRq toGtdFlightLowSearchRq() {
    // DateFormat dateFormat = DateFormat("dd-MM-yyyy");

    return GtdFlightLowSearchRq(
      originCode: gtdLocationInfo!.originCode,
      destinationCode: gtdLocationInfo!.destinationCode,
      departureDate: dateItinerary?.departureDate?.localDate("MM-dd-yyyy"),
      returntureDate: dateItinerary?.returnDate?.localDate("MM-dd-yyyy") ?? "",
      cabinClass: 'E',
      routeType: dateItinerary!.routeType,
      adutsQtt: passengersItinerary!.adult,
      childrenQtt: passengersItinerary!.child,
      infantsQtt: passengersItinerary!.inf,
      skipFilter: true,
      time: DateTime.now().millisecondsSinceEpoch.toString(),
      page: page ?? 0,
      size: size ?? 15,
    );
  }
}

class DateItinerary {
  DateItinerary({
    this.routeType,
    this.departureDate,
    this.returnDate,
  });

  String? routeType;
  DateTime? departureDate;
  DateTime? returnDate;
}

class GtdLocationInfo {
  GtdLocationInfo({
    this.departureName,
    this.originCode,
    this.destinationName,
    this.destinationCode,
  });

  String? departureName;
  String? originCode;
  String? destinationName;
  String? destinationCode;
}

class PassengersItinerary {
  PassengersItinerary({
    this.adult,
    this.child,
    this.inf,
  });

  int? adult;
  int? child;
  int? inf;
}
