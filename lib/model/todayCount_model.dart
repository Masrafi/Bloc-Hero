class TodayCountModel {
  TodayCountModel({
    required this.message,
  });

  String message;

  factory TodayCountModel.fromJson(Map<String, dynamic> json) =>
      TodayCountModel(
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toString(),
      };
}
