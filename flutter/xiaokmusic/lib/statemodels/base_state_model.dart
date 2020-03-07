import 'package:flutter/material.dart';
import 'package:xiaokmusic/models/all_enum.dart';
import 'package:xiaokmusic/utils/list_util.dart';

class BaseStateModel extends ChangeNotifier{

  //当前播放器
  Map<String,dynamic> nowPlayStatusMap = {
    'is_play': false,
    'id':'',
    'image':'',
    'name':'',
    'singer_name':'',
    'cd_name':'',
    'voice_url': '',
  };

  var playMode = PlayerType.orderPlay;   //播放模式

  //设置播放模式
  void setPlayMode(_type){
    playMode = _type;
    notifyListeners();
  }

  //设置播放器的状态
  void setNowPlayStatusMap(Map<String,dynamic> _map){
    _map.forEach((key,value){
      nowPlayStatusMap[key] = value;
    });
    notifyListeners();
  }

  //当前播放列表
  /*
  *  map = {
  * 'id':'',
    'image':'',
    'name':'',
    'singer_name':'',
    'cd_name':'',
    'voice_url': '',
  * }
  *
  * */
  List nowPlayList = [];

  //往播放器播放列表添加一条数据
  void addOneToPlayList(Map _map, String position){
    if(ListUtil().in_map_list(_map['id'], 'id', nowPlayList)){
      return;
    }
    // position => head头 next下一个 tail最后
    switch(position){
      case 'head':
        nowPlayList.insert(0, _map);
        break;
      case 'next':
        if(nowPlayList.length>0){
          nowPlayList.insert(1, _map);
        }else{
          nowPlayList.insert(0, _map);
        }
        break;
      case 'tail':
        nowPlayList.add(_map);
        break;
    }
    notifyListeners();
  }

  //往播放器播放列表移除全部数据
  void deletePlayList(){
    nowPlayList = [];
    notifyListeners();
  }

  //往播放器播放列表移除某一个，根据歌曲id
  void deleteOnePlayList(String id){
    for(var i=0;i<nowPlayList.length;i++){
      if(nowPlayList[i]['id'] == id){
        nowPlayList.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }






}