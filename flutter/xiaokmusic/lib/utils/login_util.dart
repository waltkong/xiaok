import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/userinfo_state_model.dart';


class LoginUtil{

  bool checkIsLogin(BuildContext context){

    UserinfoStateModel _stateProvider = Provider.of<UserinfoStateModel>(context);
    Map _userinfo = _stateProvider.userinfo;

    int _nowtime = DateTime.now().millisecondsSinceEpoch;

    if(_userinfo['token']== null
        || _userinfo['token'].toString().isEmpty
        ||  _nowtime> int.parse(_userinfo['expiretime']) *1000
    ){
      return false;
    }else{
      return true;
    }
  }

  Map getUserinfo(BuildContext context){
    UserinfoStateModel _stateProvider = Provider.of<UserinfoStateModel>(context);
    Map _userinfo = _stateProvider.userinfo;
    return _userinfo;
  }

  void logout(BuildContext context){
    UserinfoStateModel _stateProvider = Provider.of<UserinfoStateModel>(context);
    _stateProvider.logout();
  }


}