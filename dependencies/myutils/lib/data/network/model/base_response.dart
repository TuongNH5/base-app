import 'package:myutils/data/network/model/base_model.dart';

/**
 * Created by Nguyen Huu Tu on 28/03/2022.
 */


class Response<T extends BaseModel> extends BaseModel {
  int? statusCode;
  String? message;

  Response({this.statusCode, this.message}) : super.init();
  Response.init({this.statusCode, this.message}) : super.init();
  Response.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

  Response<T> copyWith({
    int? statusCode,
    String? message,
    T? data,
  }) {
    return Response<T>(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }
}
