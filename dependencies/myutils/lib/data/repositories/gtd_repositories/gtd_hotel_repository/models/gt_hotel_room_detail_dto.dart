// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_all_rates_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/reponse/gtd_hotel_search_result_rs.dart';
import 'package:myutils/helpers/extension/date_time_extension.dart';
import 'package:myutils/helpers/extension/string_extension.dart';


class GtdHotelRoomDetailDTO {
  String id = "";
  String name = "";
  List<String> images = [];

  List<({String icon, String value})> overviewAmenities = [];

  RoomArea? roomArea;
  List<Amenity> amenities = [];
  List<Amenity> bedGroupStatics = [];
  List<Amenity> views = [];
  List<RatePlan> ratePlans = [];
  OccupancyAllowed? occupancyAllowed;

  GtdHotelRoomDetailDTO();

  factory GtdHotelRoomDetailDTO.fromGtdHotelRoom(GtdHotelRoom hotelRoom) {
    GtdHotelRoomDetailDTO hotelRoomDetailDTO = GtdHotelRoomDetailDTO()
      ..id = hotelRoom.id ?? ""
      ..name = hotelRoom.name ?? ""
      ..images = (hotelRoom.images ?? [])
          .sorted((a, b) => (a.position ?? 0).compareTo(b.position ?? 0))
          .map((e) => e.link)
          .whereType<String>()
          .toList()
      ..roomArea = hotelRoom.roomArea
      ..amenities = hotelRoom.amenities ?? []
      ..bedGroupStatics = hotelRoom.bedGroupStatics ?? []
      ..views = hotelRoom.views ?? []
      ..ratePlans = hotelRoom.ratePlans ?? []
      ..occupancyAllowed = hotelRoom.occupancyAllowed;
    hotelRoomDetailDTO.overviewAmenities = [
      (
        icon: "hotel-user-group.svg",
        value: hotelRoomDetailDTO.roomGuestInfo,
      )
    ];
    if (hotelRoomDetailDTO.roomSquare.isNotEmpty) {
      hotelRoomDetailDTO.overviewAmenities.add(
        (
          icon: "hotel-room-size.svg",
          value: hotelRoomDetailDTO.roomSquare,
        ),
      );
    }
    return hotelRoomDetailDTO;
  }

  String get roomSquare {
    return (roomArea?.squareMeters ?? 0) != 0 ? "${roomArea?.squareMeters ?? 0}m2" : "";
  }

  int get countAdult {
    int count = (ratePlans.firstOrNull?.paxPrice ?? [])
        .fold(0, (previousValue, element) => previousValue + (element.paxInfo?.adultQuantity ?? 0));
    return count;
  }

  int get countChild {
    int count = (ratePlans.firstOrNull?.paxPrice ?? [])
        .fold(0, (previousValue, element) => previousValue + (element.paxInfo?.childQuantity ?? 0));
    return count;
  }

  String get roomGuestInfo {
    int countPerson = ratePlans.firstOrNull?.paxPrice?.length ?? 0;
    return "${'global.room'.tr()} $countPerson ${'global.guest'.tr().toLowerCase()}";
  }

  int get numberNights {
    return (ratePlans.firstOrNull?.paxPrice?.firstOrNull?.nightPrices ?? []).length;
  }

// ({DateTime checkin, DateTime checkout}) get datimeTuple {
//   List<NightPrice> nightPrices = ratePlans.firstOrNull?.paxPrice?.firstOrNull?.nightPrices ?? [];
//   nightPrices.sort((a,b) => DateTime.parse(a.nightKey).compareTo(DateTime.parse(b.nightKey)))
// }
}

extension GtdRatePlan on RatePlan {
  String get numberRoomWarning {
    return "hotel.onlyRoomsLeftAtThisPrice".tr(namedArgs: {'totalRooms': totalRooms.toString()});
  }

  bool get hasPromo => promo ?? false;

  double get totalRoomPrice => basePriceBeforePromo?.toDouble() ?? 0;

  double get totalRoomPricePerNight {
    int numberNights = ((paxPrice?.firstOrNull?.nightPrices ?? []).length);
    double price = basePriceBeforePromo?.toDouble() ?? 0;
    return (price / numberNights).round().toDouble();
  }

  double get netRoomPrice => basePrice?.toDouble() ?? 0;

  double get netRoomPricePerNight {
    int numberNights = ((paxPrice?.firstOrNull?.nightPrices ?? []).length);
    double price = basePrice?.toDouble() ?? 0;
    if (price < 0) return 0; //MARK: - check price
    return (price / numberNights).round().toDouble();
  }

  ({String title, String description}) get cancelPolicyTitle {
    String des = (cancelPenalties ?? []).map((e) => e.description).toList().join(".");
    // if (cancelFree == true && refundable == true) {
    //   return (title: "Miễn phí hoàn huỷ", description: des);
    // } else {
    //   return (title: "Hoàn/Huỷ theo chính sách", description: des);
    // }
    return (title: "hotel.cancelPenalties.policies".tr(), description: des);
  }

  ({
    String? cancelStart,
    String? cancelEnd,
    String? loseAmount,
  }) cancelPenaltiesData() {
    String des = (cancelPenalties ?? []).map((e) => e.description).toList().join(".");
    if (des.isNotEmpty) {
      final start = cancelPenalties?.firstOrNull?.startDate;
      final end = cancelPenalties?.firstOrNull?.endDate;
      String? amount;
      if (cancelPenalties?.firstOrNull?.type == 'PERCENT') {
        amount = cancelPenalties?.firstOrNull?.percent;
      } else {
        amount = cancelPenalties?.firstOrNull?.amount;
      }
      return (
        cancelStart: start.formatDateStringFull(pattern1),
        cancelEnd: end.formatDateStringFull(pattern1),
        loseAmount: amount,
      );
    }
    return (cancelStart: null, cancelEnd: null, loseAmount: null);
  }

  String get tempBasePriceInfo {
    int numberNights = ((paxPrice?.firstOrNull?.nightPrices ?? []).length);
    int totalRoom = paxPrice?.length ?? 0;
    return "$totalRoom ${'global.room'.tr().toLowerCase()} / $numberNights ${'hotel.night'.tr()}";
  }

  List<String> get ratePlanAmenities {
    var result = (amenities ?? []).map((e) => e.name).whereType<String>().toList();
    return result;
  }
}
