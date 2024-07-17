import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/banner_resource/api/banner_resource_api.dart';
import 'package:myutils/data/repositories/gtd_api_client/banner_resource/banner_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/inventory_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/request/gtd_insurance_plan_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/response/gtd_insurance_plans_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/utility_resource/utility_resource.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_api_error.dart';

class GtdUtilityRepository {
  final InventoryResourceApi inventoryResourceApi = InventoryResourceApi.shared;
  final UtilityResourceApi utilityResourceApi = UtilityResourceApi.shared;
  final BannerResourceApi bannerResourceApi = BannerResourceApi.shared;

  GtdUtilityRepository._();
  static final shared = GtdUtilityRepository._();

  Future<Result<List<GtdInsuranceDetail>, GtdApiError>> getInsuranceDetail({required String bookingNumber}) async {
    try {
      final response = await inventoryResourceApi.getInsuranceDetailByBooking(bookingNumber);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getInsuranceDetail: $e");
      return Error(e);
    }
  }

  Future<Result<List<InsurancePlan>, GtdApiError>> getInsurancePlans(
      {required GtdInsurancePlanRq insurancePlanRq}) async {
    try {
      final response = await inventoryResourceApi.getInsurancePlans(insurancePlanRq);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getInsurancePlans: $e");
      return Error(e);
    }
  }

  Future<Result<GtdNotificationsRs, GtdApiError>> getListNotifications(
      {required String userRefcode, int page = 0, required GtdNotifySenderMethod senderMethod}) async {
    try {
      final response = await utilityResourceApi.getNotificationItems(
          page: page, userRefcode: userRefcode, senderMethod: senderMethod);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getListNotifications: $e");
      return Error(e);
    }
  }

  Future<Result<int, GtdApiError>> getCountUnreadNotifications({required String userRefcode}) async {
    try {
      final response = await utilityResourceApi.getCountUnreadNotifications(userRefcode: userRefcode);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCountUnreadNotifications: $e");
      return Error(e);
    }
  }

  Future<Result<GtdInvoiceSumaryRs, GtdApiError>> getInvoiceSumary({required String userRefcode}) async {
    try {
      final response = await utilityResourceApi.getInvoiceSumary(userRefcode: userRefcode);
      if (response.result != null) {
        return Success(response.result!);
      } else {
        return Error(GtdApiError(
            message: "Cannot load Invoice Summary", localizeMessage: "Có lỗi xảy ra, vui lòng thử lại sau."));
      }
    } on GtdApiError catch (e) {
      Logger.e("getInvoiceSumary: $e");
      return Error(e);
    }
  }

  Future<Result<GtdInvoiceHistoryRs, GtdApiError>> getInvoiceHistories(
      {required String userRefcode, int page = 0}) async {
    try {
      final response = await utilityResourceApi.getInvoiceHistories(page: page, userRefcode: userRefcode);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getInvoiceHistories: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdBannerRs>, GtdApiError>> getCmsBanners(
      {required int bannerTaxonomy, required int bannerDevice}) async {
    try {
      final response =
          await bannerResourceApi.getCmsBanners(bannerTaxonomy: bannerTaxonomy, bannerDevice: bannerDevice);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCmsBanners: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdBannerRs>, GtdApiError>> getChildBanners(
      {required int categories, required int perPage, required int offset}) async {
    try {
      final response =
          await bannerResourceApi.getChildBanners(categories: categories, perPage: perPage, offset: offset);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getChildBanners: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdBannerRs>, GtdApiError>> getCategories(
      {required String? search, required int categories}) async {
    try {
      final response = await bannerResourceApi.getCategories(search: search, categories: categories);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getCategories: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdBannerRs>, GtdApiError>> getTourBanner({required String search}) async {
    try {
      final response = await bannerResourceApi.getTourBanner(search: search);
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getTourBanner: $e");
      return Error(e);
    }
  }

  Future<Result<List<GtdBannerRs>, GtdApiError>> getDestinations() async {
    try {
      final response = await bannerResourceApi.getDestinations();
      return Success(response);
    } on GtdApiError catch (e) {
      Logger.e("getDestinations: $e");
      return Error(e);
    }
  }
}
