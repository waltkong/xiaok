import 'package:flutter/material.dart';

class OperateStateModel extends ChangeNotifier{

  bool messageSendRefresh = false;

  doMessageSendRefresh(bool _value){
    messageSendRefresh = _value;
    notifyListeners();
  }

}