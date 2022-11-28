class RelatedCategoryModel {
  RelatedCategoryModel({
    this.ghCode,
    this.groupHead,
    this.groupHeadBng,
    this.tghCode,
    this.orderby,
    this.url,
  });

  final ghCode;
  final groupHead;
  final groupHeadBng;
  final tghCode;
  final orderby;
  final url;

  factory RelatedCategoryModel.fromJson(Map<String, dynamic> json) =>
      RelatedCategoryModel(
        ghCode: json["GHCode"],
        groupHead: json["GroupHead"],
        groupHeadBng: json["GroupHeadBng"],
        tghCode: json["TGHCode"],
        orderby: json["orderby"],
        url: json["URL"],
      );

  Map<String, dynamic> toJson() => {
        "GHCode": ghCode,
        "GroupHead": groupHead,
        "GroupHeadBng": groupHeadBng,
        "TGHCode": tghCode,
        "orderby": orderby,
        "URL": url,
      };
}
