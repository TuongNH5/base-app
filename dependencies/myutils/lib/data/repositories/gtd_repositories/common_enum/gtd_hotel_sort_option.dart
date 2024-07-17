import 'package:easy_localization/easy_localization.dart';

enum GtdHotelSortOption {
  recommended("Đề xuất", "order", "DESC"),
  priceAsc("Giá thấp nhất", "price", "ASC"),
  priceDesc("Giá cao nhất", "price", "DESC"),
  starAsc("Xếp hạng sao (từ thấp đến cao)", "starRating", "ASC"),
  starDesc("Xếp hạng sao (từ cao đến thấp)", "starRating", "DESC"),
  guestAsc("Đánh giá thấp", "guestRating", "ASC"),
  guestDesc("Đánh giá cao", "guestRating", "DESC");


  final String title;
  final String sortField;
  final String sortOrder;
  const GtdHotelSortOption(this.title, this.sortField, this.sortOrder);

  String get textTitle {
    switch (this) {
      case GtdHotelSortOption.recommended:
        return "hotel.sortOption.recommended".tr();
      case GtdHotelSortOption.priceAsc:
        return "hotel.sortOption.lowestPrice".tr();
      case GtdHotelSortOption.priceDesc:
        return "hotel.sortOption.highestPrice".tr();
      case GtdHotelSortOption.starAsc:
        return "hotel.sortOption.starRatingFromLowToHigh".tr();
      case GtdHotelSortOption.starDesc:
        return "hotel.sortOption.starRatingFromHighToLow".tr();
      case GtdHotelSortOption.guestAsc:
        return "hotel.sortOption.lowRating".tr();
      case GtdHotelSortOption.guestDesc:
        return "hotel.sortOption.highRating".tr();
      default:
        return title;
    }
  }
}
