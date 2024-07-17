
String getErrorMessage({required String errorId, required String errorMessage, String? texError}) {
    switch (errorId) {
      case '104':
        return 'Tài khoản không tồn tại';
      case '100':
        return 'Sai mật khẩu';
      case '101':
        return 'Tài khoản đã được đăng ký trước đó';
      case '0000_UNKNOWN':
        return 'Lỗi không xác định...';
      case '0001_SYSTEM_ERROR':
        return 'Lỗi hệ thống...';
      case '0002_REQUEST_INFO_EMPTY':
        return 'Thông tin yêu cầu rỗng...';
      case '0003_INPUT_PARAM_EMPTY':
        return 'Tham số đầu vào rỗng...';
      case '0004_UNSUPPORTED_FUNCTION':
        return 'Chức năng không được hỗ trợ...';
      case '0005_SYSTEM_IS_BUSY':
        return 'Hệ thống đang bận rộn...';
      case '0005_SYSTEM_IS_BUSY_BOOKING_PAYMENT':
        return 'Hệ thống đang bận rộn...';
      case '0005_SYSTEM_IS_BUSY_TOPUP_MONEY':
        return 'Hệ thống đang bận rộn...';
      case '1000_UNKNOWN':
        return 'Lỗi không xác định...';
      case '1000_B2C_INTERNAL_ERROR':
        return 'Lỗi Nội bộ Dịch vụ NewIBE-B2C';
      case '1001_INVALID_REF_CODE':
        return 'Mã tham chiếu không hợp lệ...';
      case '1002_CAN_NOT_CREATE_VOUCHER':
        return 'Không thể tạo phiếu mua hàng';
      case '2000_UNKNOWN':
        return 'Lỗi không xác định...';
      case '3_UNKNOWN':
        return 'Lỗi không xác định...';
      case '3_CUSTOMER_DOB_INVALID':
        return 'Ngày sinh của Khách hàng không hợp lệ';
      case '3_USER_IS_DELETED':
        return 'Người dùng đã bị xóa';
      case '4_UNKNOWN':
        return 'Lỗi không xác định...';
      case '4_EMAIL_NOT_EXIST':
        return 'Địa chỉ email chưa được đăng ký';
      case '4_USER_NOT_EXIST':
        return 'Tài khoản người dùng không tồn tại';
      case '4_PERMISSION_DENY':
        return 'Từ chối quyền truy cập';
      case '4_USER_NOT_ACTIVE':
        return 'Người dùng không hoạt động';
      case '4_WRONG_PASSWORD':
        return 'Sai mật khẩu';
      case '4_EMAIL_EXIST':
        return 'Email đã tồn tại';
      case '4_USER_EXIST':
        return 'Người dùng đã tồn tại';
      case '4_PHONE_NUMBER_EXIST':
        return 'Số điện thoại đã tồn tại';
      case '4_PHONE_NUMBER_BLANK':
        return 'Số điện thoại trống';
      case '4_MISSING_FIELD':
        return 'Trường bị thiếu';
      case '4_ID_EXIST':
        return 'ID đã tồn tại';
      case '4_USER_IS_DELETED':
        return 'Người dùng đã bị xóa';
      case '5_UNKNOWN':
        return 'Lỗi không xác định...';
      case '5000_BOOKING_INTERNAL_ERROR':
        return 'Lỗi Nội bộ Dịch vụ NewIBE-Booking';
      case '5_BOOKING_TRANSACTION_STATUS_INFO_EMPTY':
        return 'Thông tin trạng thái giao dịch đặt chỗ trống';
      case '5_BOOKING_EMPTY':
        return 'Đặt phòng trống - Không có thông tin booking';
      case '5_BOOKING_NUMBER_EMPTY':
        return 'Số đặt phòng trống';
      case '5_BOOKING_NOT_FOUND':
        return 'Không tìm thấy đặt phòng';
      case '5_BOOKING_CANNOT_CHANGE_STATUS':
        return 'Không thể thay đổi trạng thái đặt phòng';
      case '5_BOOKING_UPDATE_TAX_RECEIPT_FAIL':
        return 'Cập nhật hóa đơn thuế thất bại';
      case '5_BOOKING_TICKETISSUE_NOT_FOUND':
        return 'Không tìm thấy vấn đề vé - Không thể nhận hành lý miễn phí';
      case '5_BOOKING_GROUPBOOKING_NOT_FOUND':
        return 'Không tìm thấy Đặt phòng nhóm - Không thể nhận hành lý miễn phí';
      case '5_BOOKING_PROCESS_BOOKING_ERROR':
        return 'Lỗi xử lý đặt phòng...';
      case '5_BOOKING_CONTENT_NULL':
        return 'Nội dung đặt phòng là NULL...';
      case '5_BOOKING_REDIRECT_PENDING':
        return 'Tôi chỉ có thể chỉnh sửa chuyển đến đặt phòng PENDING...';
      case '5_BOOKING_PARAMS_NULL':
        return 'Tham số đầu vào là NULL';
      case '6_UNKNOWN':
        return 'Lỗi không xác định...';
      case '6_PAYER_AUTHENTICATION':
        return 'Cần xác thực người thanh toán';
      case '6_PAYER_CHECK_ENROLLMENT_ERROR':
        return 'Kiểm tra Lỗi Đăng ký của Người thanh toán';
      case '6100_PAYMENT_ERROR':
        return 'Không thể xử lý thanh toán...';
      case '6101_PAYMENT_REQ_ERROR':
        return 'Không thể tạo yêu cầu thanh toán';
      case '6102_PAYMENT_RES_ERROR':
        return 'Không thể xử lý phản hồi thanh toán';
      case '6103_PAYMENT_BOOKING_NOT_FOUND':
        return 'Không tìm thấy Đặt phòng';
      case '6104_PAYMENT_BOOKING_ALREADY_PAID':
        return 'Đặt phòng đã THANH TOÁN';
      case '6105_PAYMENT_BOOKING_NOT_PAID':
        return 'Đặt phòng chưa THANH TOÁN';
      case '6106_PAYMENT_BOOKING_NOT_BOOKED':
        return 'Đặt phòng không ở trạng thái ĐÃ ĐẶT';
      case '6000_PAYMENT_MOMO_INVALID_SIGNATURE':
        return 'Chữ ký không hợp lệ trong yêu cầu IPN';
      case '0_PAYMENT_MOMO_CONFIRM_SUCCESS':
        return 'THÀNH CÔNG';
      case '2000_PAYMENT_MOMO_ERROR_COMMIT_TICKET':
        return 'Lỗi khi cam kết';
      case '-4000_MOMO_INVALID_PAYMENT_AMOUNT':
        return '20,000,000 VND';
      case '6017_PAYMENT_FOR_BOOKING_ERROR':
        return 'Không thể thanh toán cho đặt phòng B2B';
      case '6018_PAYMENT_AGENCY_BOOKING_ERROR':
        return 'Không thể thanh toán cho đại lý khác';
      case '6109_VOID_ERROR':
        return 'Không thể xử lý thanh toán';
      case '6110_VOID_REQ_ERROR':
        return 'Không thể tạo yêu cầu thanh toán';
      case '6111_VOID_RES_ERROR':
        return 'Không thể xử lý phản hồi thanh toán';
      case '6112_VOID_ALREADY_VOIDED_ERROR':
        return 'Thanh toán đã được hủy';
      case '6_SUBSCRIPTION_ERROR':
        return 'Không thể xử lý đăng ký';
      case '6_AGENT_ACCOUNT_NOT_EXIST':
        return 'Tài khoản Đại lý không tồn tại';
      case '6_AMOUNT_INCORRECT':
        return 'Giá trị Số tiền cần là dương (>0).';
      case '6_TOPUP_TRANS_TYPE_INCORRECT':
        return 'Loại giao dịch Nạp tiền không chính xác';
      case '6_TOPUP_CANNOT_PERFORM_TRANS':
        return 'Không thể thực hiện giao dịch Nạp tiền';
      case '6_TOPUP_BALANCE_NOT_MATCH':
        return 'Số dư Tài khoản Đại lý không phải là dữ liệu mới nhất';
      case 'RT':
        return 'Mã người đặt sai định dạng.';
      case 'ECT':
        return 'Sức mua không chính xác.';
      case '7200_VOUCHER_VALIDATION_ERROR':
        return 'Lỗi xác nhận phiếu mua hàng';
      case '7201_VOUCHER_REDEMPTION_ERROR':
        return 'Lỗi đổi phiếu mua hàng';
      case '7202_VOUCHER_NOT_ACTIVE_YET':
        return 'Phiếu mua hàng chưa hoạt động';
      case '7203_VOUCHER_NOT_FOUND':
        return 'Không tìm thấy phiếu mua hàng.';
      case '7204_VOUCHER_EXPIRED':
        return 'Phiếu mua hàng đã hết hạn.';
      case '7205_VOUCHER_DISABLE':
        return 'Phiếu mua hàng đã bị vô hiệu hóa.';
      case '7206_VOUCHER_GIFT_AMOUNT_EXCEEDED':
        return 'Số tiền quà tặng phiếu mua hàng vượt quá giới hạn.';
      case '7207_VOUCHER_NOT_VALID':
        return 'Phiếu mua hàng không hợp lệ.';
      case '7208_VOUCHER_ONLY_ONEWAY':
        return 'Phiếu mua hàng chỉ được sử dụng cho một chiều.';
      case '7209_VOUCHER_ONLY_ROUNDTRIP':
        return 'Phiếu mua hàng chỉ được sử dụng cho hai chiều.';
      case '7210_VOUCHER_ONLY_HOTEL':
        return 'Phiếu mua hàng chỉ được sử dụng cho khách sạn.';
      case '7211_VOUCHER_CAMPAIGN_NOTFOUND':
        return 'Không tìm thấy Chiến dịch.';
      case '7212_VOUCHER_CAMPAIGN_ERROR':
        return 'Lỗi khi nhận chiến dịch';
      case '7213_VOUCHER_QUANTITY_EXCEEDED':
        return 'Số lượng phiếu mua hàng vượt quá giới hạn.';
      case '7214_VOUCHER_NOT_ENOUGH_MIN_AMOUNT':
        return 'Không đủ số tiền tối thiểu của phiếu mua hàng.';
      case '7215_VOUCHER_NOT_ENOUGH_MAX_AMOUNT':
        return 'Không đủ số tiền tối đa của phiếu mua hàng.';
      case '7216_VOUCHER_ONLY_COMBO':
        return 'Phiếu mua hàng chỉ được sử dụng cho combo.';
      case '7217_VOUCHER_NOT_VALID_IGNORE_DAYS':
        return 'Phiếu mua hàng không hợp lệ vào các ngày bỏ qua.';
      case '7218_VOUCHER_ONLY_KREDIVO':
        return 'Phiếu mua hàng chỉ dành cho thanh toán bằng KREDIVO';
      case '7_UNKNOWN':
        return 'Lỗi không xác định...';
      case '7_REF_CODE_NOT_FOUND':
        return 'Mã tham chiếu không tìm thấy';
      case '7_REF_CODE_EXPIRED':
        return 'Mã tham chiếu đã hết hạn';
      case '8_UNKNOWN':
        return 'Lỗi không xác định...';
      case '8_PARAMETER_IS_NULL':
        return 'Tham số là NULL';
      case '8_BOOKING_EMPTY':
        return 'Đặt phòng trống - Không có thông tin vé';
      case '8_BOOKING_NOT_FOUND':
        return 'Không tìm thấy đặt phòng';
      case '8_BOOKING_TRANS_NOT_FOUND':
        return 'Không tìm thấy Giao dịch Đặt phòng';
      case '8_BOOKING_MULTI_STATUS':
        return 'Đặt phòng có nhiều trạng thái';
      case '8_BUILD_BOOKING_OBJ_ERR':
        return 'Lỗi Xây dựng Đối tượng Đặt phòng';
      case '8_TICKET_NOT_FOUND':
        return 'Không thể tìm thấy thông tin vé';
      case '8_TICKET_INVALID':
        return 'Vé đặt phòng không hợp lệ';
      case '8_TRAVELLER_DOB_INVALID':
        return 'Ngày sinh của Hành khách không hợp lệ';
      case '8_API_PROVIDER_BOOK_TICKET_ERROR':
        return 'Lỗi Hệ thống khi giữ vé';
      case '8_API_PRODIVER_ISSUE_TICKET_ERROR':
        return 'Lỗi Hệ thống khi phát hành vé';
      case '9_UNKNOWN':
        return 'Lỗi không xác định...';
      case '9_PARAMETER_IS_NULL':
        return 'Tham số là NULL';
      case '9_BOOKING_EMPTY':
        return 'Đặt phòng trống - Không có thông tin vé';
      case '9_BOOKING_NOT_FOUND':
        return 'Không tìm thấy đặt phòng';
      case '9_BOOKING_TRANS_NOT_FOUND':
        return 'Không tìm thấy Giao dịch Đặt phòng';
      case '9_BOOKING_MULTI_STATUS':
        return 'Đặt phòng có nhiều trạng thái';
      case '9_BUILD_BOOKING_OBJ_ERR':
        return 'Lỗi Xây dựng Đối tượng Đặt phòng';
      case '9_HOTEL_NOT_FOUND':
        return 'Không thể tìm thấy thông tin Khách sạn';
      case '9_PRODUCT_NOT_FOUND':
        return 'Không thể tìm thấy thông tin Phòng';
      case '9_LOCK_ROOM_ERROR':
        return 'Không thể Khóa Phòng';
      case '9_GROUP_BOOKING_NOT_FOUND':
        return 'Không thể tìm thấy đặt phòng nhóm cache';
      case '9110_BUILD_DRAFT_BOOKING_TRANS_ERROR':
        return 'Lỗi xây dựng giao dịch đặt phòng nháp';
      case 'ERROR':
        return 'Lỗi dấu hiệu giao dịch đặt phòng nháp';
      case '9112_BUILD_DRAFT_BOOKING_CONTENT_ERROR':
        return 'Lỗi xây dựng nội dung đặt phòng nháp';
      case '9113_SAVE_BOOKING_TRAVELER_ERROR':
        return 'Lưu lỗi người đi du lịch đặt phòng';
      case '9114_BOOKING_PAYMENT_STATUS_NOT_SUCCEEDED':
        return 'Trạng thái thanh toán đặt phòng không thành công';
      case '9115_BOOKING_STATUS_ILLEGAL':
        return 'Trạng thái đặt phòng không hợp lệ';
      case '9_API_PROVIDER_HOLD_HOTEL_ERROR':
        return 'Lỗi Hệ thống khi giữ Khách sạn';
      case '9_API_PROVIDER_ISSUE_HOTEL_ERROR':
        return 'Lỗi Hệ thống khi phát hành Khách sạn';
      case '9_ROOM_PRICE_CHANGES':
        return 'Giá phòng đã thay đổi';
      case '9_FILE_UPLOAD_FAIL':
        return 'Không thể tải lên tệp';
      case '10_UNKNOWN':
        return 'Lỗi không xác định...';
      case '10001_CUST_API_UNAVAILABLE':
        return 'API Khách hàng không khả dụng...';
      case '10002_AGENT_API_UNAVAILABLE':
        return 'API Đại lý không khả dụng...';
      case '10003_BOOKING_API_UNAVAILABLE':
        return 'API Đặt phòng không khả dụng...';
      case '10004_PRICING_API_UNAVAILABLE':
        return 'API Giá không khả dụng...';
      case '10005_META_API_UNAVAILABLE':
        return 'API Metadata không khả dụng...';
      case '10006_TICKET_API_UNAVAILABLE':
        return 'API Vé không khả dụng...';
      case '10007_HOTEL_API_UNAVAILABLE':
        return 'API Khách sạn không khả dụng...';
      case '10008_CREDIT_VALUE_UNACCEPTABLE':
        return 'Giá trị tín dụng không được chấp nhận';
      case '10009_BALANCE_VALUE_UNACCEPTABLE':
        return 'Giá trị số dư không được chấp nhận';
      case '10010_HOTEL_SEARCH_API_UNAVAILABLE':
        return 'API Tìm kiếm khách sạn không khả dụng';
      case '100011_HOTEL_CONNECTOR_API_UNAVAILABLE':
        return 'API Kết nối Khách sạn không khả dụng';
      case '100012_HOTEL_BOOKING_API_UNAVAILABLE':
        return 'API Đặt phòng Khách sạn không khả dụng';
      case '100012_HOTEL_COLLECTOR_API_UNAVAILABLE':
        return 'API Thu khách sạn không khả dụng';
      case '11_UNKNOWN':
        return 'Lỗi không xác định...';
      case '11001_UNAUTHORIZED':
        return 'Lỗi không được ủy quyền';
      case '12_UNKNOWN':
        return 'Lỗi không xác định...';
      case '12_PARAMETER_IS_NULL':
        return 'Tham số là NULL';
      case '12_BOOKING_EMPTY':
        return 'Đặt phòng trống - Không có thông tin vé';
      case '12_BOOKING_NOT_FOUND':
        return 'Không tìm thấy đặt phòng';
      case '12_BOOKING_TRANS_NOT_FOUND':
        return 'Không tìm thấy Giao dịch Đặt phòng';
      case '12_BOOKING_MULTI_STATUS':
        return 'Đặt phòng có nhiều trạng thái';
      case '12_BUILD_BOOKING_OBJ_ERR':
        return 'Lỗi Xây dựng Đối tượng Đặt phòng';
      case '12_ACTIVITY_NOT_FOUND':
        return 'Không thể tìm thấy thông tin Hoạt động';
      case '12_PRODUCT_NOT_FOUND':
        return 'Không thể tìm thấy thông tin Sản phẩm';
      case '12109_CACHE_GROUP_BOOKING_NOT_FOUND':
        return 'Không thể tìm thấy đặt phòng nhóm cache';
      case '12110_BUILD_DRAFT_BOOKING_TRANS_ERROR':
        return 'Lỗi xây dựng giao dịch đặt phòng nháp';
      case 'R':
        return 'Lỗi xây dựng nội dung đặt phòng nháp';
      default:
        return errorMessage;
    }


}
