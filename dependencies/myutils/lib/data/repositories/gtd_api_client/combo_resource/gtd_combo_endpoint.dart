import 'package:myutils/data/network/network.dart';

class GtdComboEndpoint extends GtdEndpoint {
  GtdComboEndpoint({required super.env, required super.path});
  static const String kComboCreateDraftBooking = '/api/combo/draft-booking';
  static const String kAddBookingTraveller = '/api/combo/add-booking-traveller';

  static GtdEndpoint draftBookingHotel(GTDEnvType envType) {
    const path = kComboCreateDraftBooking;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint addBookingTraveller(GTDEnvType envType) {
    const path = kAddBookingTraveller;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
