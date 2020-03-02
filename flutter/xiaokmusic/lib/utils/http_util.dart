import 'package:http/http.dart' as http;
import 'dart:async';


class HttpUtil {

  Future getHttp(String url, Map params) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      http.Response res = await http.get(url);
      return res.body;
    } catch (e) {
      print('请求出错：' + e.toString());
    }
  }

  Future postHttp(String url, Map params) async {
    print(url);
    try {
      http.Response res = await http.post(url, body: params);
      return res.body;
    } catch (e) {
      print('请求出错：' + e.toString());
    }

  }




}