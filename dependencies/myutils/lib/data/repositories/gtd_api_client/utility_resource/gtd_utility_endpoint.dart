import 'package:myutils/data/network/network.dart';

class GtdUtilityEndpoint extends GtdEndpoint {
  GtdUtilityEndpoint({required super.env, required super.path});
  static const String kNotifiMessages = "/utilitysrv/api/get-notify-message-with-page";
  static const String kNotifiMessagesUnreadCount = "/utilitysrv/api/get-count-unread-notify-message";
  static const String kInvoiceSumary = "/utilitysrv/api/approval-invoices/sumary-by-month";
  static const String kInvoiceHistories = "/utilitysrv/api/approval-invoices/history";

  static GtdEndpoint getListNotifications(GTDEnvType envType, String userRefcode) {
    const path = kNotifiMessages;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$userRefcode");
  }

  static GtdEndpoint getCountUnreadNotifications(GTDEnvType envType, String userRefcode) {
    const path = kNotifiMessagesUnreadCount;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: "$path/$userRefcode");
  }

  static GtdEndpoint getInvoiceSumary(GTDEnvType envType) {
    const path = kInvoiceSumary;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }

  static GtdEndpoint getInvoiceHistories(GTDEnvType envType) {
    const path = kInvoiceHistories;
    return GtdEndpoint(env: GtdEnvironment(env: envType), path: path);
  }
}
