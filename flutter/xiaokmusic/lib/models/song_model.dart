class SongItemModel{

  String id;
  String name;
  String cd_id;
  String cd_name;
  String singer_name;
  String singer_id;
  String description;
  String voice_url;
  String vedio_url;
  String image;
  String lyric;
  String is_recommend;
  List tag_ids;
  List tag_names;
  String createtime;

  SongItemModel({
    this.id,
    this.name,
    this.cd_id,
    this.cd_name,
    this.singer_name,
    this.singer_id,
    this.description,
    this.voice_url,
    this.vedio_url,
    this.image,
    this.lyric,
    this.is_recommend,
    this.tag_ids,
    this.tag_names,
    this.createtime
  });

  //不需要去new这个对象 可以直接使用
  //fromjson传入list类型数据  可以 map进行迭代
  factory SongItemModel.fromJson(dynamic json){
    return SongItemModel(
      id: json["id"],
      name: json["name"],
      cd_id: json["cd_id"],
      cd_name:json['cd_name'],
      singer_name:json['singer_name'],
      singer_id: json["singer_id"],
      description: json["description"],
      voice_url: json["voice_url"],
      vedio_url: json["vedio_url"],
      image: json["image"],
      lyric: json["lyric"],
      is_recommend: json["is_recommend"],
      tag_ids: json["tag_ids"],
      tag_names: json["tag_names"],
      createtime: json["createtime"],
    );
  }

}

class SongListModel{

  List<SongItemModel> data;
  SongListModel(this.data);

  factory SongListModel.fromJson(List json){
    return SongListModel(
      json.map((i) => SongItemModel.fromJson((i))).toList(),
    );
  }


}