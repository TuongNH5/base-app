import 'package:myutils/data/network/network.dart';

class GtdBannerEndpoint extends GtdEndpoint {
  GtdBannerEndpoint({required super.env, required super.path});
  static const String kBannerCMS = "wp-json/wp/v2/banner_type";
  static const String kChildBanners = "tour/wp-json/wp/v2/posts";
  static const String kCategories = "tour/wp-json/wp/v2/gtd_destination";
  static const String kBannerGotadiV3 = "tour/wp-json/wc/v3/products";

  static GtdEndpoint getCmsBanners() {
    const path = kBannerCMS;
    return GtdEndpoint(env: GtdEnvironment(env: GTDEnvType.CMSBannerAPI), path: path);
  }

  static GtdEndpoint getChillBanners() {
    const path = kChildBanners;
    return GtdEndpoint(env: GtdEnvironment(env: GTDEnvType.GTDBannerAPI), path: path);
  }

  static GtdEndpoint getTourBanners() {
    const path = kBannerGotadiV3;
    return GtdEndpoint(env: GtdEnvironment(env: GTDEnvType.GTDBannerAPI), path: path);
  }

  static GtdEndpoint getCategoriesBanners() {
    const path = kCategories;
    return GtdEndpoint(env: GtdEnvironment(env: GTDEnvType.GTDBannerAPI), path: path);
  }

  static GtdEndpoint getDestinations() {
    const path = kBannerCMS;
    return GtdEndpoint(env: GtdEnvironment(env: GTDEnvType.GTDBannerAPI), path: path);
  }
}
