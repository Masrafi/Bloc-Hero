class LiveCountModel {
  LiveCountModel({
    required this.message,
  });

  String message;

  factory LiveCountModel.fromJson(Map<String, dynamic> json) => LiveCountModel(
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toString(),
      };
}
