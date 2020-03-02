class TagItemModel{
  String id;
  String name;
  String image;

  TagItemModel({
    this.id,
    this.name,
    this.image,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory TagItemModel.fromJson(dynamic json){
    return TagItemModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }

}

class TagListModel{

  List<TagItemModel> data;
  TagListModel(this.data);

  factory TagListModel.fromJson(List json){
    return TagListModel(
      json.map((i) => TagItemModel.fromJson((i))).toList(),
    );
  }


}