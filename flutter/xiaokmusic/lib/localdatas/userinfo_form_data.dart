import 'package:shared_preferences/shared_preferences.dart';


class UserinfoFormData{

  List keyList = [
    'username',
    'password',
    'token',
  ];

  String getFullKey(String key){
    return 'UserinfoFormData_'+ key;
  }


  Future setData(Map<String,String> _map) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _map.forEach((key,value){
      prefs.setString(this.getFullKey(key.toString()), value.toString());
    });

  }

  Future<String> getData(String keyname) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(this.getFullKey(keyname));
  }

  Future deleteData(String keyname) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.getFullKey(keyname), '');
  }



}