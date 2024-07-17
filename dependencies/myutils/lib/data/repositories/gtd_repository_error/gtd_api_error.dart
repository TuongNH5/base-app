import 'package:myutils/data/network/network.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_error_rs.dart';
import 'package:myutils/data/repositories/gtd_repository_error/gtd_error_constant.dart';
import 'package:collection/collection.dart';
import 'package:myutils/utils/gtd_widgets/gtd_tuple.dart';

class GtdApiError implements Exception {
  String message = "";
  String code = "";
  String localizeMessage = "";
  GtdApiError({this.message = "", this.code = "", this.localizeMessage = ""});
  GtdApiError.fromError({this.message = "", this.code = ""});

  GtdApiError.fromErrorRs(List<ErrorRs> errors) {
    List<GtdErrorConstant> errorConstants = errors
        .map((e) => GtdErrorConstant.findByCode(id: e.id, code: e.code))
        .where((element) => element != GtdErrorConstant.unknown)
        .toSet()
        .toList();
    GtdApiError apiError = fromErrorConstant(errorConstants.firstOrNull ?? GtdErrorConstant.unknown);
    message = apiError.message;
    code = apiError.code;
  }

  GtdApiError.fromErrorsJson(dynamic errors) {
    if (errors is List<ErrorRs>) {
      List<GtdErrorConstant> errorConstants = errors
          .map((e) => GtdErrorConstant.findByCode(id: e.id, code: e.code))
          .where((element) => element != GtdErrorConstant.unknown)
          .toSet()
          .toList();
      GtdApiError apiError = fromErrorConstant(errorConstants.firstOrNull ?? GtdErrorConstant.unknown);
      message = apiError.message;
      code = apiError.code;
    }
  }

  static GtdApiError handleObjectError(dynamic object) {
    if (object is GtdApiError) {
      Logger.e(object.message);
      return object;
    } else {
      Logger.e("Error unknown: $object");
      return fromErrorConstant(GtdErrorConstant.unknown);
    }
  }

  static GtdApiError fromErrorConstant(GtdErrorConstant errorConstant) {
    return GtdApiError(message: errorConstant.message, code: errorConstant.code);
  }

  Tuple<String, String> errorByCode({String code = "", String message = ""}) {
    switch (code) {
      // Error code int
      case "100":
        return Tuple(item1: code, item2: "Mật khẩu không đúng. Vui lòng thử lại");
      case "101":
        return Tuple(item1: code, item2: "Tài khoản đã được sử dụng");
      case "102":
        return Tuple(item1: code, item2: "EmailExist");
      case "103":
        return Tuple(item1: code, item2: "AuthenFail");
      case "104":
        return Tuple(item1: code, item2: "AccountNotExist");
      case "105":
        return Tuple(item1: code, item2: "AccountNotActive");
      case "106":
        return Tuple(item1: code, item2: "AccessExpire");
      case "107":
        return Tuple(item1: code, item2: "AccountExistButNotActived");
      case "108":
        return Tuple(item1: code, item2: "FillInfor");
      case "109":
        return Tuple(item1: code, item2: "ErrorSocialAccount");
      case "1101":
        return Tuple(item1: code, item2: "PhoneExist");
      case "1104":
        return Tuple(item1: code, item2: "AccountNotExist");
      case "2103":
        return Tuple(item1: code, item2: "IncorrectOTP");
      case "3012":
        return Tuple(item1: code, item2: "AccountIsDeleted");
      case "4001":
        return Tuple(item1: code, item2: "Gotadi_AccountNotExist");
      case "4002":
        return Tuple(item1: code, item2: "Tài khoản không tồn tại");
      case "4003":
        return Tuple(item1: code, item2: "Loại tài khoản không được phép đăng nhập");
      case "4004":
        return Tuple(item1: code, item2: "Tài khoản chưa được kích hoạt");
      case "4012":
        return Tuple(item1: code, item2: "AccountIsDeleted");
      case "4005":
        return Tuple(item1: code, item2: "Mật khẩu không chính xác, vui lòng kiểm tra lại");
      case "4006":
        return Tuple(item1: code, item2: "Email đã tồn tại");
      case "4007":
        return Tuple(item1: code, item2: "Tài khoản đã tồn tại");
      case "4008":
        return Tuple(item1: code, item2: "Số điện thoại đã được sử dụng");
      case "6969":
        return Tuple(item1: code, item2: "Tài khoản của bạn không đủ để thực hiện thanh toán này. Vui lòng thử lại");
      // Error code String Voucher
      case "7200_VOUCHER_VALIDATION_ERROR":
        return Tuple(item1: code, item2: "Voucher lỗi, không xác thực được voucher này.");
      case "7201_VOUCHER_REDEMPTION_ERROR":
        return Tuple(item1: code, item2: "Lỗi quy đổi mã khuyến mãi.");
      case "7202_VOUCHER_NOT_ACTIVE_YET":
        return Tuple(item1: code, item2: "Mã khuyến mãi chưa hoạt động.");
      case "7203_VOUCHER_NOT_FOUND":
        return Tuple(item1: code, item2: "Không tìm thấy mã khuyến mãi.");
      case "7204_VOUCHER_EXPIRED":
        return Tuple(item1: code, item2: "AccountIsDeleted");
      case "7205_VOUCHER_DISABLE":
        return Tuple(item1: code, item2: "Mã khuyến mãi bị vô hiệu hóa.");
      case "7206_VOUCHER_GIFT_AMOUNT_EXCEEDED":
        return Tuple(item1: code, item2: "Đã vượt quá số lần sử dụng mã khuyến mãi.");
      case "7207_VOUCHER_NOT_VALID":
        return Tuple(item1: code, item2: "Mã khuyến mãi không hợp lệ.");
      case "7208_VOUCHER_ONLY_ONEWAY":
        return Tuple(item1: code, item2: "Mã khuyến mãi chỉ sử dụng cho vé máy bay một chiều.");
      case "7209_VOUCHER_ONLY_ROUNDTRIP":
        return Tuple(item1: code, item2: "Mã khuyến mãi chỉ sử dụng cho vé máy bay khứ hồi.");
      case "7210_VOUCHER_ONLY_HOTEL":
        return Tuple(item1: code, item2: "Mã khuyến mãi chỉ sử dụng cho khách sạn.");
      case "7211_VOUCHER_CAMPAIGN_NOTFOUND":
        return Tuple(item1: code, item2: "Voucher không có hoặc quá hạn");
      case "7212_VOUCHER_CAMPAIGN_ERROR":
        return Tuple(item1: code, item2: "Voucher bị lỗi hoặc quá hạn");
      case "7213_VOUCHER_QUANTITY_EXCEEDED":
        return Tuple(item1: code, item2: "Voucher đã sử dụng");
      case "7214_VOUCHER_NOT_ENOUGH_MIN_AMOUNT":
        return Tuple(item1: code, item2: "Số tiền giao dịch không đủ để áp dụng mã khuyến mãi này");
      case "7215_VOUCHER_NOT_ENOUGH_MAX_AMOUNT":
        return Tuple(item1: code, item2: "Vượt quá số tiền giao dịch để áp dụng mã khuyến mãi này");
      case "Error_Common":
        return Tuple(item1: code, item2: "Đã có lỗi xảy ra, vui lòng thử lại sau giây lát.");
      default:
        return Tuple(item1: "-1", item2: message);
    }
  }
}
