class CorrigenCountModel {
  CorrigenCountModel({
    required this.message,
  });

  String message;

  factory CorrigenCountModel.fromJson(Map<String, dynamic> json) =>
      CorrigenCountModel(
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toString(),
      };
}
