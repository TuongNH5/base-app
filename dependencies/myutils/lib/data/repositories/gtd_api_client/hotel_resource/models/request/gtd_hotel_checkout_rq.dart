
class GtdHotelCheckoutRq {
    String tripId;
    String roomId;
    String ratePlanId;
    Map<String, Object>? metadata;

    GtdHotelCheckoutRq({
        required this.tripId,
        required this.roomId,
        required this.ratePlanId,
        this.metadata,
    });

    factory GtdHotelCheckoutRq.fromJson(Map<String, dynamic> json) => GtdHotelCheckoutRq(
        tripId: json["tripId"],
        roomId: json["roomId"],
        ratePlanId: json["ratePlanId"],
        metadata: json["metadata"],
    );

    Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "roomId": roomId,
        "ratePlanId": ratePlanId,
        "metadata": metadata,
    };
}