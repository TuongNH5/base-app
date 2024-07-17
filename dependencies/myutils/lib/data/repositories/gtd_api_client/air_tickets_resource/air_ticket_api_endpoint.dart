import 'package:myutils/data/network/network_service/gtd_end_points.dart';
import 'package:myutils/data/network/network_service/gtd_environment.dart';

class GtdApiPath {
  static const String kFlightLowSearch = '/api/air-tickets/low-fare-search-async';
  static const String kFilterAvailability = '/api/air-tickets/filter-availability';
  static const String kGroupItinerary = '/api/air-tickets/group-itinerary';
  static const String kAllFilterOptions = '/api/air-tickets/filter-options';
  static const String kDraftBooking = '/api/air-tickets/draft-booking';
  static const String kAddBookingTraveller = '/api/air-tickets/add-booking-traveller';
  static const String kSsrOffer = '/api/air-tickets/ssr-offer';
  static const String kFlightFareRules = '/api/air-tickets/farerules';
}

class AirTicketApiEndpoint extends GtdEndpoint {
  AirTicketApiEndpoint({required super.env, required super.path});

  static GtdEndpoint getFlightLowSearch(GTDEnvType envType) {
    const path = GtdApiPath.kFlightLowSearch;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint filterAvailability(GTDEnvType envType) {
    const path = GtdApiPath.kFilterAvailability;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint groupItineraryEndpoint(GTDEnvType envType, String groupId) {
    const path = GtdApiPath.kGroupItinerary;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: '$path/$groupId');
  }

  static GtdEndpoint getAllFilterOptions(GTDEnvType envType) {
    const path = GtdApiPath.kAllFilterOptions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint draftBooking(GTDEnvType envType) {
    const path = GtdApiPath.kDraftBooking;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint addBookingTraveller(GTDEnvType envType) {
    const path = GtdApiPath.kAddBookingTraveller;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint ssrOffers(GTDEnvType envType, String bookingNumber) {
    const path = GtdApiPath.kSsrOffer;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: '$path/$bookingNumber');
  }

  static GtdEndpoint flightFareRule(GTDEnvType envType, String bookingNumber) {
    const path = GtdApiPath.kFlightFareRules;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: '$path/$bookingNumber');
  }
}
