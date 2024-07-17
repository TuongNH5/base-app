// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myutils/data/repositories/gtd_api_client/hotel_resource/models/json_models/hotel_page.dart';

class GtdPagingDTO<T> {
  List<T> data;
  int page = 0;
  int totalPage = 0;
  int totalItem = 0;
  GtdPagingDTO({
    this.data = const [],
    this.page = 0,
    this.totalPage = 0,
    this.totalItem = 0,
  });
  bool get hasNextPage => page < (totalPage - 1);

  factory GtdPagingDTO.fromHotelPage({required List<T> data, HotelPage? hotelPage}) {
    return GtdPagingDTO(
        data: data,
        page: hotelPage?.pageNumber ?? 0,
        totalPage: hotelPage?.totalPage ?? 0,
        totalItem: hotelPage?.totalItems ?? 0);
  }
  void updateNewHotelPage(HotelPage hotelPage) {
    page = hotelPage.pageNumber ?? page;
    totalPage = hotelPage.totalPage ?? totalPage;
    totalItem = hotelPage.totalItems ?? totalItem;
  }
}
