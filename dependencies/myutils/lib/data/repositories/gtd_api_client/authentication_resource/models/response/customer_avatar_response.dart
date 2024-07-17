class CustomerAvatarResponse {
  int? id;
  String? avatarImage; /// -> image Base64 encoded
  String? avatarImageContentType;
  bool? inUsed;
  String? createdDate;
  int? profileId;

  CustomerAvatarResponse({
    this.id,
    this.avatarImage,
    this.avatarImageContentType,
    this.inUsed,
    this.createdDate,
    this.profileId,
  });

  CustomerAvatarResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatarImage = json['avatarImage'];
    avatarImageContentType = json['avatarImageContentType'];
    inUsed = json['inUsed'];
    createdDate = json['createdDate'];
    profileId = json['profileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatarImage'] = avatarImage;
    data['avatarImageContentType'] = avatarImageContentType;
    data['inUsed'] = inUsed;
    data['createdDate'] = createdDate;
    data['profileId'] = profileId;
    return data;
  }
}
