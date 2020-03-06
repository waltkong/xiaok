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
  Future openBottomModalSheet(context,Map _map) async {
    final option = await showModalBottomSheet(context: context, builder: (BuildContext context){
      return SongModalSheetComponent(
        id:_map['id'],
        name:_map['name'],
        voice_url:_map['voice_url'],
        singer_name: _map['singer_name'],
        image: _map['image'],
        cd_name: _map['cd_name'],
      );
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