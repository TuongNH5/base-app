import 'dart:convert';

class InfoRs {
  InfoRs({
    this.code,
    this.message,
  });

  String? code;
  String? message;

  factory InfoRs.fromRawJson(String str) => InfoRs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoRs.fromJson(Map<String, dynamic> json) => InfoRs(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
