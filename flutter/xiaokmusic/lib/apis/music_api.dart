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
      'eachPage':6,
      'pageIndex':1,
      'is_recommend':1
    };
    var data = BaseApi.getFullRequestData(_map);
    String url = BaseApi.getFullUrl('/api/music/data/cd_list');
    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }

  


}