import 'package:xiaokmusic/apis/base_api.dart';
import 'dart:async';
import 'package:xiaokmusic/utils/http_util.dart';
import 'dart:convert';

class UserApi extends BaseApi{

  Future login(Map _map) async{
    var data = _map ;
    String url = BaseApi.getFullUrl('/api/user/login');

    var res = await HttpUtil().postHttp(url, data);

    final _data = json.decode(res.toString());
    return _data;
  }


}