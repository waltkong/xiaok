import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/utils/operate_util.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/utils/audio_player_util.dart';
import 'package:xiaokmusic/pages/songplayer/song_index_page.dart';
class SongPlayerComponent extends StatefulWidget {

  final String id;
  final String name;
  final String image;
  final String voice_url;
  final String singer_name;
  final String cd_name;

  SongPlayerComponent({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.voice_url,
    @required this.singer_name,
    @required this.cd_name,
});

  @override
  _SongPlayerComponentState createState() => _SongPlayerComponentState();
}

class _SongPlayerComponentState extends State<SongPlayerComponent> {


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);

    Map _nowPlayMap = _stateProvider.nowPlayStatusMap;

    return Container(
      color: Colors.blue,
      height: ScreenUtil().setHeight(120),
      width: ScreenUtil().setWidth(750),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(130),
                padding: EdgeInsets.all(3),
                child: widget.image == '' ? Icon(Icons.music_note) : Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text("${widget.name}",style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,),
                    Text("${widget.singer_name}",style: TextStyle(fontSize: 10),overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () async{
                  var resMap = await AudioPlayerUtil(context: context).doNextPlay(_stateProvider,-1);
                  if(resMap != null){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                      return SongIndexPage(
                        id:resMap['id'].toString(),
                        name: resMap['name'].toString(),
                        image: resMap['image'].toString(),
                        voice_url: resMap['voice_url'].toString(),
                        cd_name: resMap['cd_name'].toString(),
                        singer_name: resMap['singer_name'].toString(),
                      );
                    }));
                  }
                },
              ),

              IconButton(
                icon: _nowPlayMap['id']==widget.id && _nowPlayMap['is_play'] ? Icon(Icons.pause) : Icon(Icons.play_arrow),  //pause
                onPressed: () async{
                  //todo
                  bool pauseOrplay = _nowPlayMap['id']==widget.id && _nowPlayMap['is_play'] ? false:true;
                  if(pauseOrplay){

                    var _res = await AudioPlayerUtil(context: context).play(widget.voice_url.toString());

                    if(_res){
                      _stateProvider.setNowPlayStatusMap({
                        'is_play': true,
                        'id':widget.id,
                        'image':widget.image,
                        'name':widget.name,
                        'singer_name':widget.singer_name,
                        'cd_name':widget.cd_name,
                        'voice_url': widget.voice_url,
                      });
                      _stateProvider.addOneToPlayList({
                        'is_play': true,
                        'id':widget.id,
                        'image':widget.image,
                        'name':widget.name,
                        'singer_name':widget.singer_name,
                        'cd_name':widget.cd_name,
                        'voice_url': widget.voice_url,
                      },'head');
                    }


                  }else{

                    var _res = await AudioPlayerUtil(context: context).pause();
                    if(_res){
                      _stateProvider.setNowPlayStatusMap({
                        'is_play': false,
                      });
                    }
                  }

                },
              ),

              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () async{
                  var resMap = await AudioPlayerUtil(context: context).doNextPlay(_stateProvider,1);
                  if(resMap != null){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                      return SongIndexPage(
                        id:resMap['id'].toString(),
                        name: resMap['name'].toString(),
                        image: resMap['image'].toString(),
                        voice_url: resMap['voice_url'].toString(),
                        cd_name: resMap['cd_name'].toString(),
                        singer_name: resMap['singer_name'].toString(),
                      );
                    }));
                  }
                },
              ),

              IconButton(
                icon: Icon(Icons.assignment),
                onPressed: (){
                  OperateUtil().openSongListModal(context);
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}
