class PrivateCountModel {
  PrivateCountModel({
    required this.message,
  });

  String message;

  factory PrivateCountModel.fromJson(Map<String, dynamic> json) =>
      PrivateCountModel(
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toString(),
      };
}
