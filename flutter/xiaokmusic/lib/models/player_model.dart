class PlayerItemModel{
  String id;
  String name;
  String image;
  String singer_name;
  String cd_name;
  String voice_url;

  PlayerItemModel({
    this.id,
    this.name,
    this.image,
    this.singer_name,
    this.cd_name,
    this.voice_url,
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory PlayerItemModel.fromJson(dynamic json){
    return PlayerItemModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      singer_name:json['singer_name'],
      cd_name:json['cd_name'],
      voice_url: json["voice_url"],
    );
  }

}

class PlayerListModel{

  List<PlayerItemModel> data;
  PlayerListModel(this.data);

  factory PlayerListModel.fromJson(List json){
    return PlayerListModel(
      json.map((i) => PlayerItemModel.fromJson((i))).toList(),
    );
  }


}