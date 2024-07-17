import 'package:myutils/data/repositories/gtd_api_client/utility_resource/models/json_models/gtd_notification_item_rs.dart';

class GtdNotificationsRs {
  final List<GtdNotificationItemRs>? content;
  final Pageable? pageable;
  final int? totalPages;
  final int? totalElements;
  final bool? last;
  final bool? first;
  final Sort? sort;
  final int? numberOfElements;
  final int? size;
  final int? number;
  final bool? empty;

  GtdNotificationsRs({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last,
    this.first,
    this.sort,
    this.numberOfElements,
    this.size,
    this.number,
    this.empty,
  });

  factory GtdNotificationsRs.fromJson(Map<String, dynamic> json) => GtdNotificationsRs(
        content: json["content"] == null
            ? []
            : List<GtdNotificationItemRs>.from(json["content"]!.map((x) => GtdNotificationItemRs.fromJson(x))),
        pageable: json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        first: json["first"],
        sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
        "pageable": pageable?.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "first": first,
        "sort": sort?.toJson(),
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class Pageable {
  final Sort? sort;
  final int? pageSize;
  final int? pageNumber;
  final int? offset;
  final bool? unpaged;
  final bool? paged;

  Pageable({
    this.sort,
    this.pageSize,
    this.pageNumber,
    this.offset,
    this.unpaged,
    this.paged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort?.toJson(),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
      };
}

class Sort {
  final bool? sorted;
  final bool? unsorted;
  final bool? empty;

  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
