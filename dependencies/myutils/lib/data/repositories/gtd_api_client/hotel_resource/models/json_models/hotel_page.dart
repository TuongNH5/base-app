class HotelPage {
  int? pageSize;
  int? pageNumber;
  int? totalPage;
  int? totalItems;

  HotelPage({
    this.pageSize,
    this.pageNumber,
    this.totalPage,
    this.totalItems,
  });

  factory HotelPage.fromJson(Map<String, dynamic> json) => HotelPage(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        totalPage: json["totalPage"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "totalPage": totalPage,
        "totalItems": totalItems,
      };
}