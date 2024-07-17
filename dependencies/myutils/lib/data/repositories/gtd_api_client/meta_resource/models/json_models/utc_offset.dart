class UtcOffset {
  UtcOffset({
    this.hours,
    this.minutes,
  });

  double? hours;
  int? minutes;

  factory UtcOffset.fromJson(Map<String, dynamic> json) => UtcOffset(
        hours: json["hours"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "minutes": minutes,
      };
}
