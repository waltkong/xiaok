import 'package:xiaokmusic/configs/app_config.dart';
class BaseApi{
  
  static Map getFullRequestData(Map data){
    data['access_token'] = 'aaaaaaaaaa';
    return data;
  }

  static String getFullUrl(String url){
    return AppConfig.baseUrl + url;
  }

}