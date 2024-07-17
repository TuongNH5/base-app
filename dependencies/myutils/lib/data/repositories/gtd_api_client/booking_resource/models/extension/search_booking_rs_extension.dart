import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/search_booking_rs.dart';

extension GtdListMyBookingMapper on SearchBookingRs {
  void updateListItemMyBooking(SearchBookingRs searchBookingRs) {
    List<BookingInfoElement> tempItemGenerate = generateStatusBooking(searchBookingRs);
    List<BookingInfoElement> itemBookings = [...?content, ...tempItemGenerate];
    content = itemBookings;
    number = searchBookingRs.number;
    last = searchBookingRs.last;
    first = searchBookingRs.first;
    totalElements = searchBookingRs.totalElements;
    totalPages = searchBookingRs.totalPages;
  }

  List<BookingInfoElement> generateStatusBooking(SearchBookingRs searchBookingRs) {
    var items = searchBookingRs.content?.map((itemBooking) {
      itemBooking.updateStatusItemMyBooking(itemBooking);
      return itemBooking;
    }).toList();
    return items ?? [];
  }
}
