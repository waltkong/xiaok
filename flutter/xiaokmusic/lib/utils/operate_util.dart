import 'package:flutter/material.dart';
import 'package:xiaokmusic/components/song_modal_sheet_component.dart';
import 'package:xiaokmusic/components/playlist_modal_sheet_component.dart';

class OperateUtil{

  static GlobalKey<ScaffoldState> _playerSheetKey;

  //获取弹出底部播放器页面的key
  GlobalKey<ScaffoldState> getPlayerSheetKey(){
    if(_playerSheetKey == null){
      _playerSheetKey = GlobalKey<ScaffoldState>();
    }
    return _playerSheetKey;
  }

  //每首歌对应的一些按钮模态框
  Future openBottomModalSheet(context,String id,String name, String voice_url) async {
    final option = await showModalBottomSheet(context: context, builder: (BuildContext context){
      return SongModalSheetComponent(id:id,name:name,voice_url:voice_url);
    });
    return option;
  }

  //播放器点击弹出播放列表
  Future openSongListModal(context) async {
    final option = await showModalBottomSheet(context: context, builder: (BuildContext context){
      return PlaylistModalSheetComponent();
    });
    return option;
  }

  Future togglePlayerSheet() async{
    getPlayerSheetKey().currentState.showBottomSheet((BuildContext context){
      return Container();
    });
  }



}