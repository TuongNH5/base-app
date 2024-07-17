
class MemberCardsSimplified {
  String? cardNumber;
  String? cardType;

  MemberCardsSimplified({this.cardNumber, this.cardType});

  MemberCardsSimplified.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardNumber'] = cardNumber;
    data['cardType'] = cardType;
    return data;
  }
}