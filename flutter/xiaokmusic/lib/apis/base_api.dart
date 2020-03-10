
import 'package:xiaokmusic/localdatas/userinfo_form_data.dart';
import 'package:xiaokmusic/configs/app_config.dart';

class BaseApi{
  
  static Map getFullRequestData(Map data){

    return data;
  }

  static String getFullUrl(String url){
    return AppConfig.baseUrl + url;
  }

  static String getServerAssetUrl(String url){
    return AppConfig.rootUrl + url;
  }


  Future<String> getToken() async{
    var token = await UserinfoFormData().getData('token');
    var expiretime = await UserinfoFormData().getData('expiretime');

    //过期
    if(token==null ||
        token.toString().isEmpty ||
        int.parse(expiretime) * 1000 < DateTime.now().millisecondsSinceEpoch + 1000){
        return null;
    }
    return token;
  }



}