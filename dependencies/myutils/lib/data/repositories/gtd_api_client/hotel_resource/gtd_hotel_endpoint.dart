import 'package:myutils/data/network/network.dart';

class GtdHotelEndpoint extends GtdEndpoint {
  GtdHotelEndpoint({required super.env, required super.path});
  static const String kGetPolularHotelLocation = '/metasrv/api/internal-config/FAVOURITE_HOTEL_LOCATION';
  static const String kHotelSearchKeyword = '/api/v3/hotel/search-keyword';
  static const String kHotelFilterOptions = '/api/v3/hotel/filter-options';
  static const String kHotelSearchBestRate = '/api/v3/hotel/search-best-rates';
  static const String kHotelSearchAllRate = '/api/v3/hotel/search-all-rates';
  static const String kHotelCheckout = '/api/v3/hotel/checkout';
  static const String kHotelCreateDraftBooking = '/api/v3/hotel/create-draft-booking';
  static const String kAddBookingTraveller = '/api/v3/hotel/add-booking-traveller';

  static GtdEndpoint getPolularHotelLocation(GTDEnvType envType) {
    const path = kGetPolularHotelLocation;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint findHotelByKeyword(GTDEnvType envType) {
    const path = kHotelSearchKeyword;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getHotelFilterOptions(GTDEnvType envType) {
    const path = kHotelFilterOptions;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint searchHotelBestRate(GTDEnvType envType) {
    const path = kHotelSearchBestRate;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint searchHotelAllRate(GTDEnvType envType) {
    const path = kHotelSearchAllRate;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint checkoutHotel(GTDEnvType envType) {
    const path = kHotelCheckout;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint draftBookingHotel(GTDEnvType envType) {
    const path = kHotelCreateDraftBooking;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint addBookingTraveller(GTDEnvType envType) {
    const path = kAddBookingTraveller;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
