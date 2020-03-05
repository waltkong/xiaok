import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaokmusic/utils/list_util.dart';
class SearchHistoryData{

  int maxCount = 20;
  String keyname = 'SearchHistoryData';
  List<String> _list = [];

  Future<List> addOne(String keyword) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _list = await getAll();
    if(ListUtil().in_array(keyword, _list)){
      return _list;
    }
    if(_list != null && _list.length>maxCount){
      _list = _list.sublist(0,-(maxCount -1));
    }
    _list.add(keyword);
    prefs.setStringList(keyname, _list);
    return _list;
  }

  Future<List> getAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _list = prefs.getStringList(keyname);
    return _list;
  }

  void deleteAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _list = [];
    prefs.setStringList(keyname, _list);
  }

}