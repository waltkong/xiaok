class SingerItemModel{
  String id;
  String name;
  String one_image;
  String description;
  String many_images;
  String createtime;

  SingerItemModel({
    this.id,
    this.name,
    this.one_image,
    this.description,
    this.many_images,
    this.createtime,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory SingerItemModel.fromJson(dynamic json){
    return SingerItemModel(
      id: json["id"],
      name: json["name"],
      one_image: json["one_image"],
      description:json['description'],
      many_images:json['many_images'],
      createtime: json["createtime"],
    );
  }

}

class SingerListModel{

  List<SingerItemModel> data;
  SingerListModel(this.data);

  factory SingerListModel.fromJson(List json){
    return SingerListModel(
      json.map((i) => SingerItemModel.fromJson((i))).toList(),
    );
  }


}