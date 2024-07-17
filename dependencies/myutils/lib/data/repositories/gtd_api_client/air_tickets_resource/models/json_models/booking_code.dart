import 'dart:convert';

class BookingCode {
  BookingCode({
    this.bookingCode,
    this.bookingNumber,
  });

  String? bookingCode;
  String? bookingNumber;

  factory BookingCode.fromRawJson(String str) => BookingCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingCode.fromJson(Map<String, dynamic> json) => BookingCode(
        bookingCode: json["bookingCode"],
        bookingNumber: json["bookingNumber"],
      );

  Map<String, dynamic> toJson() => {
        "bookingCode": bookingCode,
        "bookingNumber": bookingNumber,
      };
}
