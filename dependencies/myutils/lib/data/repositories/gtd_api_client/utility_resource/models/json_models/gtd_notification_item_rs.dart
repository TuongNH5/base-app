class GtdNotificationItemRs {
  final int? id;
  final String? name;
  final String? messageType;
  final String? content;
  final String? contentType;
  final String? excerpt;
  final String? imgUrl;
  final DateTime? schedule;
  final String? redirectUrl;
  final String? status;
  final String? senderMethod;
  final bool? isDeleted;
  final int? totalSlot;
  final int? finished;
  final String? tag;
  final String? refCode;
  final String? userRefCode;
  final DateTime? createdDate;
  final String? createdBy;
  final DateTime? lastModifiedDate;
  final String? lastModifiedBy;
  final String? saleChannel;
  final String? isRead;

  GtdNotificationItemRs({
    this.id,
    this.name,
    this.messageType,
    this.content,
    this.contentType,
    this.excerpt,
    this.imgUrl,
    this.schedule,
    this.redirectUrl,
    this.status,
    this.senderMethod,
    this.isDeleted,
    this.totalSlot,
    this.finished,
    this.tag,
    this.refCode,
    this.userRefCode,
    this.createdDate,
    this.createdBy,
    this.lastModifiedDate,
    this.lastModifiedBy,
    this.saleChannel,
    this.isRead,
  });

  factory GtdNotificationItemRs.fromJson(Map<String, dynamic> json) => GtdNotificationItemRs(
        id: json["id"],
        name: json["name"],
        messageType: json["messageType"],
        content: json["content"],
        contentType: json["contentType"],
        excerpt: json["excerpt"],
        imgUrl: json["imgUrl"],
        schedule: json["schedule"] == null ? null : DateTime.parse(json["schedule"]),
        redirectUrl: json["redirectUrl"],
        status: json["status"],
        senderMethod: json["senderMethod"],
        isDeleted: json["isDeleted"],
        totalSlot: json["totalSlot"],
        finished: json["finished"],
        tag: json["tag"],
        refCode: json["refCode"],
        userRefCode: json["userRefCode"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        lastModifiedDate: json["lastModifiedDate"] == null ? null : DateTime.parse(json["lastModifiedDate"]),
        lastModifiedBy: json["lastModifiedBy"],
        saleChannel: json["saleChannel"],
        isRead: json["isRead"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "messageType": messageType,
        "content": content,
        "contentType": contentType,
        "excerpt": excerpt,
        "imgUrl": imgUrl,
        "schedule": schedule?.toIso8601String(),
        "redirectUrl": redirectUrl,
        "status": status,
        "senderMethod": senderMethod,
        "isDeleted": isDeleted,
        "totalSlot": totalSlot,
        "finished": finished,
        "tag": tag,
        "refCode": refCode,
        "userRefCode": userRefCode,
        "createdDate": createdDate?.toIso8601String(),
        "createdBy": createdBy,
        "lastModifiedDate": lastModifiedDate?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "saleChannel": saleChannel,
        "isRead": isRead,
      };
}

