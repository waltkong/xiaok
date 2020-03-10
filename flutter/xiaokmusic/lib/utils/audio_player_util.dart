import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/models/all_enum.dart';
import 'package:xiaokmusic/utils/number_util.dart';

class AudioPlayerUtil{


  BuildContext context;

  AudioPlayerUtil({
    @required this.context,
});

  static AudioPlayer aPlayer;

  //获取播放器对象
  AudioPlayer getPlayer() {
    if(aPlayer == null){
      aPlayer = AudioPlayer();
//      aPlayer.setReleaseMode(ReleaseMode.STOP);
//      aPlayer.onDurationChanged.listen((Duration d) {
//        print('Max duration: $d');
//      });
      listenPlayer();
    }
    return aPlayer;
  }

  listenPlayer(){

    var _player = getPlayer();
    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);

    //进度最大值监听
//    _player.onDurationChanged.listen((Duration d) {
////      print('Max duration: $d');
//      _stateProvider.setMaxDuration(d);
//    });
//
//    //进度改变
//    _player.onAudioPositionChanged.listen((Duration  p){
////      print('Position Changed: $p');
//      _stateProvider.setCurrentPosition(p);
//    });

    _player.onPlayerCompletion.listen((event) async{
      print('on Player Completion');
      doNextPlay(_stateProvider,1);
    });

  }

  // num 1 或者 -1
  Future doNextPlay(BaseStateModel _stateProvider,int num) async{

    List _playlist = _stateProvider.nowPlayList;

    if(_playlist == null || _playlist.length == 0){
      return null;
    }
    Map _nowPlayStatusMap = _stateProvider.nowPlayStatusMap;

    print(_playlist);

    var  _playmode = _stateProvider.playMode;
    var nextPlayIndex;

    //得到下一个播放的id
    var nowIndex = getIndexBySongId(_nowPlayStatusMap['id'],_playlist);

    if(_playmode == PlayerType.orderPlay){

      if(num == 1){   //前进
        if(nowIndex + 2 > _playlist.length){
          nextPlayIndex = 0;
        }else{
          nextPlayIndex = nowIndex + 1;
        }
      }else{    //后退
        if(nowIndex==0){
          nextPlayIndex = _playlist.length -1;
        }else{
          nextPlayIndex = nowIndex -1;
        }
      }
    }else if(_playmode == PlayerType.randomPlay){
      nextPlayIndex = NumberUtil().randomInMaxNumber(_playlist.length);
      if(nextPlayIndex > _playlist.length -1){
        nextPlayIndex = 0;
      }
    }else{ //单曲
      nextPlayIndex = nowIndex;
    }



    if(nextPlayIndex != null){

      if(_nowPlayStatusMap['is_play'] == true){

        await play(_playlist[nextPlayIndex]['voice_url']);

        _stateProvider.setNowPlayStatusMap({
          'is_play': true,
          'id': _playlist[nextPlayIndex]['id'],
          'image':_playlist[nextPlayIndex]['image'],
          'name': _playlist[nextPlayIndex]['name'],
          'singer_name': _playlist[nextPlayIndex]['singer_name'],
          'cd_name': _playlist[nextPlayIndex]['cd_name'],
          'voice_url': _playlist[nextPlayIndex]['voice_url'],
        });
      }
      return {
        'id': _playlist[nextPlayIndex]['id'],
        'image':_playlist[nextPlayIndex]['image'],
        'name': _playlist[nextPlayIndex]['name'],
        'singer_name': _playlist[nextPlayIndex]['singer_name'],
        'cd_name': _playlist[nextPlayIndex]['cd_name'],
        'voice_url': _playlist[nextPlayIndex]['voice_url'],
      };
    }else{
      return null;
    }

  }
  
  
  int getIndexBySongId(String id, List list){
    for(var i=0;i<list.length;i++){
      if(list[i]['id'].toString() == id){
        return i;
      }
    }
    return null;
  }



  //播放
  Future<bool> play(String voice_url) async {

    if(voice_url == null || voice_url.isEmpty || !voice_url.contains('.mp3')){
      return false;
    }
    int result = await getPlayer().play(voice_url);
    if (result == 1) {
      print('play success');
      return true;
    } else {
      print('play failed');
      return false;
    }
  }

  //暂停
  Future<bool> pause() async {
    int result = await getPlayer().pause();
    if (result == 1) {
      print('pause success');
      return true;
    } else {
      print('pause failed');
      return false;
    }
  }


  Future<bool> stop() async{
    int result = await getPlayer().stop();
    if (result == 1) {
      print('stop success');
      return true;
    } else {
      print('stop failed');
      return false;
    }
  }


  //释放资源
  Future deactivateRelease() async{
    int result = await getPlayer().release();
    if (result == 1) {
      print('release success');
    } else {
      print('release failed');
    }
  }



}