part of gtd_flight_repository_dto;

extension GtdItemMyBookingMapper on BookingInfoElement {
  GenerateStatus colorTextStatus(BuildContext context, String status) {
    return GenerateStatus.generareStatusMapping(context, status);
  }
}

class GenerateStatus {
  GenerateStatus({this.statusColor, this.statusBackground, this.pathIcon});
  final Color? statusColor;
  final Color? statusBackground;
  final String? pathIcon;

  factory GenerateStatus.generareStatusMapping(BuildContext context, String status) {
    Color color = Colors.grey.shade900;
    Color background = Colors.grey.shade900;
    String pathIconStatus = '';
    switch (status) {
      case 'EXPIRED':
        color = Theme.of(context).extension<GtdColorStatus>()!.expired;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.expired;
        pathIconStatus = "assets/icons/clock-time-schedule.svg";
        break;
      case 'SUCCEEDED':
        color = Theme.of(context).extension<GtdColorStatus>()!.success;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.success;
        pathIconStatus = "assets/icons/checked.svg";
        break;
      case 'PAYMENT_FAILED':
        color = Theme.of(context).extension<GtdColorStatus>()!.failed;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.failed;
        pathIconStatus = "assets/icons/error-circle.svg";
        break;
      case 'FAILED':
        color = Theme.of(context).extension<GtdColorStatus>()!.failed;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.failed;
        pathIconStatus = "assets/icons/error-circle.svg";
        break;
      case 'PAYMENT_REFUNDED':
        color = Theme.of(context).extension<GtdColorStatus>()!.paymentRefunded;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.paymentRefunded;
        pathIconStatus = "assets/icons/check-done-circle.svg";
        break;
      case 'CANCELLED':
        color = Theme.of(context).extension<GtdColorStatus>()!.cancelled;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.cancelled;
        pathIconStatus = "assets/icons/error-circle.svg";
        break;
      case 'PENDING':
        color = Theme.of(context).extension<GtdColorStatus>()!.pending;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.pending;
        pathIconStatus = "assets/icons/status/pending.svg";
        break;
      case 'BOOKED':
        color = Theme.of(context).extension<GtdColorStatus>()!.booked;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.booked;
        pathIconStatus = "assets/icons/check-done-circle.svg";
        break;
      case 'TICKED_ON_PROCESS':
        color = Theme.of(context).extension<GtdColorStatus>()!.tickedOnProcess;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.tickedOnProcess;
        pathIconStatus = "assets/icons/check-done-circle.svg";
        break;
      case 'PAYMENT_SUCCESS_COMMIT_FAILED':
        color = Theme.of(context).extension<GtdColorStatus>()!.paymentSuccessCommitFailed;
        background = Theme.of(context).extension<GtdColorBackgroundStatus>()!.paymentSuccessCommitFailed;
        pathIconStatus = "assets/icons/error-circle.svg";
        break;
      default:
        break;
    }
    return GenerateStatus(statusColor: color, statusBackground: background, pathIcon: pathIconStatus);
  }
}
