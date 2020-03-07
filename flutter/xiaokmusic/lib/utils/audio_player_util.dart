import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class AudioPlayerUtil{

  static AudioPlayer aPlayer;

  //获取播放器对象
  AudioPlayer getPlayer(){
    if(aPlayer == null){
      aPlayer = AudioPlayer();
    }
    return aPlayer;
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