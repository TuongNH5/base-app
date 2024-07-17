class Page {
  Page({
    this.nextPageNumber,
    this.offset,
    this.pageNumber,
    this.previousPageNumber,
    this.totalElements,
    this.totalPage,
  });

  int? nextPageNumber;
  int? offset;
  int? pageNumber;
  int? previousPageNumber;
  int? totalElements;
  int? totalPage;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        nextPageNumber: json["nextPageNumber"],
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        previousPageNumber: json["previousPageNumber"],
        totalElements: json["totalElements"],
        totalPage: json["totalPage"],
      );

  Map<String, dynamic> toJson() => {
        "nextPageNumber": nextPageNumber,
        "offset": offset,
        "pageNumber": pageNumber,
        "previousPageNumber": previousPageNumber,
        "totalElements": totalElements,
        "totalPage": totalPage,
      };
}

extension PageHelper on Page {
  bool get isLastPage {
    return nextPageNumber == -1;
    // return pageNumber == (totalPage ?? 1) - 1;
  }
}
