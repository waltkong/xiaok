import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/models/all_enum.dart';

class PlaylistModalSheetComponent extends StatefulWidget {
  @override
  _PlaylistModalSheetComponentState createState() => _PlaylistModalSheetComponentState();
}

class _PlaylistModalSheetComponentState extends State<PlaylistModalSheetComponent> {
  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);

    return Container(
      height: ScreenUtil().setHeight(500),
      child: ListView(
        children: <Widget>[

          _headerTextBox(_stateProvider),

          _listBox(_stateProvider),

        ],
      ),
    );
  }

  Widget _listBox(BaseStateModel _stateProvider){

    List _nowPlayList = _stateProvider.nowPlayList;

    List<Widget> ret = _nowPlayList.map((item){
      return Container(
        height: ScreenUtil().setHeight(60),
        child: ListTile(
          leading: Text("${item['name']}",overflow: TextOverflow.ellipsis,),
          title: Text("${item['singer_name']}",style: TextStyle(fontSize: 13),overflow: TextOverflow.ellipsis,),
          trailing: IconButton(
            icon: Icon(Icons.close), onPressed: (){
              _stateProvider.deleteOnePlayList(item['id'].toString());
            }
          ),
        ),
      );
    }).toList();

    return ret.length == 0 ? Center(
      child: Text('播放列表为空..'),
    ) : Column(
      children: ret,
    );
  }


  Widget _headerTextBox(BaseStateModel _stateProvider){

    var _playMode = _stateProvider.playMode;

    Map playmodeShow = {
      PlayerType.orderPlay : {
        'icon' : Icon(Icons.rounded_corner),
        'text' : Text('顺序播放'),
      },
      PlayerType.randomPlay : {
        'icon' : Icon(Icons.shuffle),
        'text' : Text('随机播放'),
      },
      PlayerType.singlePlay : {
        'icon' : Icon(Icons.music_note),
        'text' : Text('单曲循环'),
      },
    };

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              if(_playMode ==  PlayerType.orderPlay) {
                _stateProvider.setPlayMode(PlayerType.randomPlay);return;
              }
              if(_playMode ==  PlayerType.randomPlay) {
                _stateProvider.setPlayMode(PlayerType.singlePlay);return;
              }
              if(_playMode ==  PlayerType.singlePlay) {
                _stateProvider.setPlayMode(PlayerType.orderPlay);return;
              }
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  playmodeShow[_playMode]['icon'],
                  playmodeShow[_playMode]['text'],
                ],
              ),
            ),
          ),

          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  _stateProvider.deletePlayList();
                },
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: FlatButton(
                  child: Text('关闭'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),

        ],
      ),
    );
  }



}
