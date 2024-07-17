import 'package:dio/dio.dart';
import 'package:myutils/data/network/gtd_json_parser.dart';
import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/banner_resource/gtd_banner_endpoint.dart';
import 'package:myutils/data/repositories/gtd_api_client/banner_resource/models/gtd_banner_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class BannerResourceApi {
  GtdNetworkService networkService = GtdNetworkService.shared;
  GTDEnvType envGtdType = GTDEnvType.GTDBannerAPI;
  GTDEnvType envCmsType = GTDEnvType.CMSBannerAPI;

  BannerResourceApi._();
  static final shared = BannerResourceApi._();

  Future<List<GtdBannerRs>> getCmsBanners({required int bannerTaxonomy, required int bannerDevice}) async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdBannerEndpoint.getCmsBanners());
      networkRequest.queryParams = {
        "banner_taxonomy": bannerTaxonomy,
        "banner_device": bannerDevice,
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdBannerRs> banners = JsonParser.jsonArrayToModel(GtdBannerRs.fromJson, response.data);
      return banners;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCmsBanners: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdBannerRs>> getChildBanners(
      {required int categories, required int perPage, required int offset}) async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdBannerEndpoint.getChillBanners());
      networkRequest.queryParams = {
        "categories": categories,
        "per_page": perPage,
        "offset": offset,
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdBannerRs> banners = JsonParser.jsonArrayToModel(GtdBannerRs.fromJson, response.data);
      return banners;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getChildBanners: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdBannerRs>> getCategories({required String? search, required int categories}) async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdBannerEndpoint.getCategoriesBanners());
      networkRequest.queryParams = {
        "categories": categories,
        "search": search,
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdBannerRs> banners = JsonParser.jsonArrayToModel(GtdBannerRs.fromJson, response.data);
      return banners;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getCategories: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdBannerRs>> getTourBanner({required String search}) async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdBannerEndpoint.getTourBanners());
      networkRequest.queryParams = {
        "search": search,
        "consumer_key": "ck_9e398b8572e3dd904af214f9a81ec77b01d0ff39",
        "consumer_secret": "cs_635ee847a89cdac233718af2ae6b667b572dbc4d",
      };
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdBannerRs> banners = JsonParser.jsonArrayToModel(GtdBannerRs.fromJson, response.data);
      return banners;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getTourBanner: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }

  Future<List<GtdBannerRs>> getDestinations() async {
    try {
      final networkRequest = GTDNetworkRequest(type: GtdMethod.get, enpoint: GtdBannerEndpoint.getDestinations());
      networkService.request = networkRequest;
      final Response response = await networkService.execute();
      List<GtdBannerRs> banners = JsonParser.jsonArrayToModel(GtdBannerRs.fromJson, response.data);
      return banners;
    } on DioException catch (e) {
      Logger.e('Trace: ${e.stackTrace} \nErrorMess: ${e.toString()}');
      GtdDioException dioException = GtdDioException.fromDioError(e);
      throw GtdApiError(message: dioException.message);
    } catch (e) {
      Logger.e("Error getDestinations: $e");
      throw GtdApiError.handleObjectError(e);
    }
  }
}
