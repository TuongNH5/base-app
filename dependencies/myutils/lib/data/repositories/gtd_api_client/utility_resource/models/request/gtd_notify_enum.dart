import 'package:collection/collection.dart';

enum GtdNotifySenderMethod {
  broadcast("BROADCAST"),
  private("PRIVATE");

  final String rawValue;
  const GtdNotifySenderMethod(this.rawValue);

  String get notifyTabTitle {
    switch (this) {
      case GtdNotifySenderMethod.private:
        return "Thông báo của bạn";
      case GtdNotifySenderMethod.broadcast:
        return "Tin tức khuyến mãi";
    }
  }
}

enum GtdNotifyMessageStatus {
  pending("PENDING"),
  publishing("PUBLISHING"),
  successed("SUCCESSED");

  final String rawValue;
  const GtdNotifyMessageStatus(this.rawValue);
}

enum GtdNotifyUserStatus {
  read("READ"),
  unread("UNREAD");

  final String rawValue;
  const GtdNotifyUserStatus(this.rawValue);

    static GtdNotifyUserStatus findByValue(String type) {
    return GtdNotifyUserStatus.values.firstWhereOrNull((element) => element.rawValue == type.toUpperCase()) ??
        GtdNotifyUserStatus.unread;
  }
}

enum GtdNotificationType {
  checkinPrompt("REMIND_CHECKIN"),
  confirmedTicket("COMMIT_CONFIRM"),
  paymentPrompt("PAYMENT_REMIND"),
  confirmedHold("CONFIRMED_HOLD"),
  marketing("MARKETING"),
  paymentConfirm("PAYMENT_CONFIRM");

  final String rawValue;
  const GtdNotificationType(this.rawValue);

  static GtdNotificationType findByValue(String type) {
    return GtdNotificationType.values.firstWhereOrNull((element) => element.rawValue == type.toUpperCase()) ??
        GtdNotificationType.marketing;
  }
}
