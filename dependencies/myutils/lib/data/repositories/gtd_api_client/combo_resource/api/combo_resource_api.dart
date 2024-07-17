
import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/add_booking_traveller_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/add_booking_traveller_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/combo_resource/gtd_combo_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/combo_resource/models/reponse/gtd_combo_draft_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/combo_resource/models/request/gtd_combo_draft_booking_rq.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_error_constant.dart';


class ComboResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envType = GTDEnvType.B2CAPI;

  ComboResourceApi._();
  static final shared = ComboResourceApi._();


  Future<String> draftBookingCombo(GtdComboDraftBookingRq comboDraftBookingRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post, enpoint: GtdComboEndpoint.draftBookingHotel(envType), data: comboDraftBookingRq);

      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      GtdComboDraftBookingRs hotelDraftBookingRs =
          JsonParser.jsonToModel(GtdComboDraftBookingRs.fromJson, response.data);
      if ((hotelDraftBookingRs.errors ?? []).isNotEmpty ||
          hotelDraftBookingRs.booking?.bookingNumber == null) {
        throw GtdApiError.fromErrorConstant(GtdErrorConstant.unknown);
      }
      return hotelDraftBookingRs.booking!.bookingNumber!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error draftBookingCombo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<AddBookingTravellerRs> addBookingTravellerCombo(AddBookingTravellerRq addBookingTravellerRq) async {
    try {
      final networkRequest = GTDNetworkRequest(
          type: GtdMethod.post,
          enpoint: GtdComboEndpoint.addBookingTraveller(envType),
          data: addBookingTravellerRq.toJson());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      final AddbookingResultRs addBookingTravellerRs =
          JsonParser.jsonToModel(AddbookingResultRs.fromJson, response.data);
      if ((addBookingTravellerRs.errors ?? []).isNotEmpty || addBookingTravellerRs.result == null) {
        throw GtdApiError.fromErrorRs(addBookingTravellerRs.errors ?? []);
      }
      return addBookingTravellerRs.result!;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error addBookingTravellerCombo: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}