class ShortProfileResponse {
  int? agencyId;
  String? requesterCode;
  String? requesterName;
  int? profileId;
  String? who;
  String? membershipClass;
  String? orgCode;
  String? lang;
  String? requesterId;
  String? agencyCode;
  String? requesterType;
  int? expirationInMilis;

  ShortProfileResponse({
    this.agencyId,
    this.requesterCode,
    this.requesterName,
    this.profileId,
    this.who,
    this.membershipClass,
    this.orgCode,
    this.lang,
    this.requesterId,
    this.agencyCode,
    this.requesterType,
    this.expirationInMilis,
  });

  ShortProfileResponse.fromJson(Map<String, dynamic> json) {
    agencyId = json['agencyId'];
    requesterCode = json['requesterCode'];
    requesterName = json['requesterName'];
    profileId = json['profileId'];
    who = json['who'];
    membershipClass = json['membershipClass'];
    orgCode = json['orgCode'];
    lang = json['lang'];
    requesterId = json['requesterId'];
    agencyCode = json['agencyCode'];
    requesterType = json['requesterType'];
    expirationInMilis = json['expirationInMilis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agencyId'] = agencyId;
    data['requesterCode'] = requesterCode;
    data['requesterName'] = requesterName;
    data['profileId'] = profileId;
    data['who'] = who;
    data['membershipClass'] = membershipClass;
    data['orgCode'] = orgCode;
    data['lang'] = lang;
    data['requesterId'] = requesterId;
    data['agencyCode'] = agencyCode;
    data['requesterType'] = requesterType;
    data['expirationInMilis'] = expirationInMilis;
    return data;
  }
}
