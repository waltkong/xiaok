import 'package:xiaokmusic/apis/base_api.dart';
import 'dart:async';
import 'package:xiaokmusic/utils/http_util.dart';
import 'dart:convert';

class AppApi extends BaseApi{

  //主消息列表
  Future messageList(Map _map) async{
    var data = _map ;
    data = BaseApi.getFullRequestData(_map);

    String url = BaseApi.getFullUrl('/api/music/action/message_list');

    var res = await HttpUtil().postHttp(url, data);

    print(res);

    final _data = json.decode(res.toString());
    return _data;
  }


  //主消息列表
  Future addMessage(Map _map) async{
    var data = _map ;
    data = BaseApi.getFullRequestData(_map);
    data['token'] = await BaseApi().getToken();

    String url = BaseApi.getFullUrl('/api/music/action/add_message');

    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


}