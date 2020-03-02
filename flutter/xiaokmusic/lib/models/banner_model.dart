class BannerItemModel{
  String id;
  String name;
  String image;
  String route_type;
  String route_url;
  String createtime;

  BannerItemModel({
    this.id,
    this.name,
    this.image,
    this.route_type,
    this.route_url,
    this.createtime,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory BannerItemModel.fromJson(dynamic json){
    return BannerItemModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      route_type: json["route_type"],
      route_url: json["route_url"],
      createtime: json["createtime"],
    );
  }

}

class BannerListModel{

  List<BannerItemModel> data;
  BannerListModel(this.data);

  factory BannerListModel.fromJson(List json){
    return BannerListModel(
      json.map((i) => BannerItemModel.fromJson((i))).toList(),
    );
  }


}