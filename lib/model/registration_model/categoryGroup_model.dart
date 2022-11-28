class CategoryGroupModel {
  CategoryGroupModel({
    this.tghCode,
    this.topGroupHead,
    this.groupHeadBng,
    this.simage,
    this.limage,
    this.orderby,
    this.url,
  });

  final tghCode;
  final topGroupHead;
  final groupHeadBng;
  final simage;
  final limage;
  final orderby;
  final url;

  factory CategoryGroupModel.fromJson(Map<String, dynamic> json) =>
      CategoryGroupModel(
        tghCode: json["TGHCode"],
        topGroupHead: json["TopGroupHead"],
        groupHeadBng: json["GroupHeadBng"],
        simage: json["Simage"],
        limage: json["Limage"],
        orderby: json["orderby"],
        url: json["URL"],
      );

  Map<String, dynamic> toJson() => {
        "TGHCode": tghCode,
        "TopGroupHead": topGroupHead,
        "GroupHeadBng": groupHeadBng,
        "Simage": simage,
        "Limage": limage,
        "orderby": orderby,
        "URL": url,
      };
}
