import 'package:easy_localization/easy_localization.dart';

class ClassName {}

enum FilterRequestType { single, array, range }

enum GtdHotelFilterType {
  prices("filterFromPrice,filterToPrice", FilterRequestType.range),
  guestRatings("filterFromGuestRating,filterToGuestRating", FilterRequestType.range),
  propertyRatings("filterFromStarRating,filterToStarRating", FilterRequestType.range),
  propertyAmenities("filterAmenities", FilterRequestType.array),
  rateAmenities("filterRateAmenities", FilterRequestType.array),
  propertyCategories("filterHotelCategories", FilterRequestType.array),
  roomAmenities("filterRoomAmenities", FilterRequestType.array),
  roomViews("filterRoomViews", FilterRequestType.array),
  themes("filterThemes", FilterRequestType.array),
  mealPlans("filterMealPlans", FilterRequestType.array),
  bedTypes("filterBedTypes", FilterRequestType.array),
  propertyDistance("filterFromDistance,filterToDistance", FilterRequestType.range),
  offerOptions("filterOfferOptions", FilterRequestType.single);

  final String requestKey;
  final FilterRequestType requestType;
  const GtdHotelFilterType(this.requestKey, this.requestType);

  String get title {
    switch (this) {
      case GtdHotelFilterType.prices:
        return "hotel.priceRangePerRoomPerNight".tr();
      case GtdHotelFilterType.guestRatings:
        return "hotel.guestReviews".tr();
      case GtdHotelFilterType.propertyRatings:
        return  "hotel.searchByStarRating".tr();
      case GtdHotelFilterType.propertyAmenities:
        return "hotel.hotelAmenities".tr();
      case GtdHotelFilterType.rateAmenities:
        return "hotel.roomIncludes".tr();
      case GtdHotelFilterType.propertyCategories:
        return "hotel.accommodationType".tr();
      case GtdHotelFilterType.roomAmenities:
        return "hotel.roomFacilities".tr();
      case GtdHotelFilterType.roomViews:
        return "hotel.scenery".tr();
      case GtdHotelFilterType.bedTypes:
        return "hotel.bedType".tr();
      case GtdHotelFilterType.propertyDistance:
        return "hotel.searchByDistance".tr();
      case GtdHotelFilterType.offerOptions:
        return "hotel.bookingRegulations".tr();
      default:
        return "";
    }
  }
  static List<GtdHotelFilterType> listHotelFilterSorted() => [
        propertyRatings,
        prices,
        guestRatings,
        propertyAmenities,
        rateAmenities,
        roomAmenities,
        roomViews,
        bedTypes,
        propertyDistance,
        offerOptions
      ];
}
