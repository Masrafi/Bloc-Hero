class OptionModel {
  OptionModel({
    this.id,
    this.catcode,
    this.catname,
    this.groupHead,
    this.url,
    this.keyword,
    this.title,
    this.titleHTwo,
    this.metaDescription,
    this.ghCode,
  });

  final id;
  final catcode;
  final catname;
  final groupHead;
  final url;
  final keyword;
  final title;
  final titleHTwo;
  final metaDescription;
  final ghCode;

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        id: json["id"],
        catcode: json["catcode"],
        catname: json["catname"],
        groupHead: json["GroupHead"],
        url: json["URL"],
        keyword: json["keyword"],
        title: json["title"],
        titleHTwo: json["titleHTwo"],
        metaDescription: json["meta_description"],
        ghCode: json["GHCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catcode": catcode,
        "catname": catname,
        "GroupHead": groupHead,
        "URL": url,
        "keyword": keyword,
        "title": title,
        "titleHTwo": titleHTwo,
        "meta_description": metaDescription,
        "GHCode": ghCode,
      };
}
