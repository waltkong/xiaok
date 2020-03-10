import 'dart:async';
import 'package:xiaokmusic/apis/base_api.dart';
import 'package:xiaokmusic/utils/http_util.dart';
import 'dart:convert';

class MusicApi extends BaseApi{

  Future bannerList() async{
    var data = BaseApi.getFullRequestData({});
    String url = BaseApi.getFullUrl('/api/music/data/banner_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  Future adList() async{
    var _map = {
      'eachPage':'5',
      'pageIndex':'1',
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/ad_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  Future recommendCdList() async{
    var _map = {
      'eachPage':'6',
      'pageIndex':'1',
      'is_recommend':'1',
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/cd_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  Future newSongRecommendList() async{
    var _map = {
      'eachPage':'10',
      'pageIndex':'1',
      'is_recommend':'1',
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/song_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


  Future getCdListData(Map _map) async{
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/cd_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  Future getSongListData(Map _map) async{
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/song_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


  Future getSingerListData(Map _map) async{
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/singer_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


  Future getCdOne(String id) async{
    var _map = {
      'id':id,
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/cd_one');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  Future getSingerOne(String id) async{
    var _map = {
      'id':id,
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/singer_one');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


  Future getSingerIdBySongId(String song_id) async{
    var _map = {
      'song_id':song_id,
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/get_singer_id_by_song_id');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


  Future getSongOne(String id) async{
    var _map = {
      'id':id,
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/song_one');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }





}