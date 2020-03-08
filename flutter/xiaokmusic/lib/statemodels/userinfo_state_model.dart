import 'package:flutter/material.dart';

class UserinfoStateModel extends ChangeNotifier{

  //当前播放器
  Map<String,dynamic> userinfo = {
    'id':'',
    'username':'',
    'nickname':'',
    'mobile':'',
    'avatar':'',  //http://..
    'createtime': '',
    'expiretime': '',
    'token':'',
  };

  //设置播放器的状态
  void setUserinfoMap(Map<String,dynamic> _map){
    _map.forEach((key,value){
      userinfo[key] = value;
    });
    notifyListeners();
  }

  void logout(){
    userinfo = {
      'id':'',
      'username':'',
      'nickname':'',
      'mobile':'',
      'avatar':'',   //base64
      'createtime': '',
      'expiretime': '',
      'token':'',
    };
    notifyListeners();
  }



}