class AdItemModel{
  String id;
  String name;
  String image;
  String description;
  String content;
  String route_type;
  String route_url;
  String createtime;

  AdItemModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.content,
    this.route_type,
    this.route_url,
    this.createtime,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory AdItemModel.fromJson(dynamic json){
    return AdItemModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description:json['description'],
      content:json['content'],
      route_type: json["route_type"],
      route_url: json["route_url"],
      createtime: json["createtime"],
    );
  }

}

class AdListModel{

  List<AdItemModel> data;
  AdListModel(this.data);

  factory AdListModel.fromJson(List json){
    return AdListModel(
      json.map((i) => AdItemModel.fromJson((i))).toList(),
    );
  }


}