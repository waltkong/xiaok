class CdItemModel{
  String id;
  String name;
  String image;
  String publishtime;
  String description;
  String is_recommend;
  List tag_ids;
  List tag_names;
  String singer_id;
  String singer_name;
  String createtime;

  CdItemModel({
    this.id,
    this.name,
    this.image,
    this.publishtime,
    this.description,
    this.is_recommend,
    this.tag_ids,
    this.tag_names,
    this.singer_id,
    this.singer_name,
    this.createtime,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory CdItemModel.fromJson(dynamic json){
    return CdItemModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      publishtime: json["publishtime"],
      description: json["description"],
      is_recommend: json["is_recommend"],
      tag_ids: json["tag_ids"],
      tag_names: json["tag_names"],
      singer_id: json["singer_id"],
      singer_name: json["singer_name"],
      createtime: json["createtime"],
    );
  }

}

class CdListModel{

  List<CdItemModel> data;
  CdListModel(this.data);

  factory CdListModel.fromJson(List json){
    return CdListModel(
      json.map((i) => CdItemModel.fromJson((i))).toList(),
    );
  }


}