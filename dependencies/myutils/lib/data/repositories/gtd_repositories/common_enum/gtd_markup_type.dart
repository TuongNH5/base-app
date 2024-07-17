enum GtdMarkupType {
  percent("PERCENT"),
  fixed("FIXED");

  final String value;
  const GtdMarkupType(this.value);

  static GtdMarkupType findByCode(String code) {
    var result = GtdMarkupType.values.where((element) => element.value.toLowerCase() == code.toLowerCase()).firstOrNull;
    return result ?? GtdMarkupType.fixed;
  }
}
