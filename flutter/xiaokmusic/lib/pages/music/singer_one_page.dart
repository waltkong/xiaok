import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xiaokmusic/utils/number_util.dart';
import 'package:xiaokmusic/pages/music/song_list_page.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/components/song_player_component.dart';

class SingerOnePage extends StatelessWidget {

  String id;

  SingerOnePage({
    this.id
  });

  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);
    Map _nowPlayStatusMap = _stateProvider.nowPlayStatusMap;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(1334),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(120)),
            child: SingerOnePageBody(id:id),
          ),

          Positioned(
            bottom: 0,
            child: SongPlayerComponent(
              id: _nowPlayStatusMap['id'].toString(),
              name: _nowPlayStatusMap['name'].toString(),
              image: _nowPlayStatusMap['image'].toString(),
              voice_url: _nowPlayStatusMap['voice_url'].toString(),
              singer_name: _nowPlayStatusMap['singer_name'].toString(),
            ),
          ),

        ],
      ),
    );
  }
}

class SingerOnePageBody extends StatefulWidget {

  String id;
  SingerOnePageBody({
    this.id
});

  @override
  _SingerOnePageBodyState createState() => _SingerOnePageBodyState();
}

class _SingerOnePageBodyState extends State<SingerOnePageBody> {

  Map singer;
  List songList;

  @override
  void initState() {
    super.initState();
    getSingerOne();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          _topBody(),

          _playTextBox(),
////
          _songListBox(),


        ],
      ),
    );
  }


  Widget _topBody(){
    return Container(
      height: ScreenUtil().setHeight(400),
//      color: Colors.green,
      padding: EdgeInsets.all(0),
      child: singer != null ? Stack(
        children: <Widget>[
          Image.network(
            singer['one_image'],
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(400),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(singer['name'],style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("粉丝"+NumberUtil().randomNumber(5),style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.add,color: Colors.white,),onPressed: (){},),
                      Text("关注",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ) : Center(child: Text('加载中...'),),
    );
  }


  Widget _playTextBox(){
    return Container(
      margin: EdgeInsets.only(top:10),
      height: ScreenUtil().setHeight(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.play_circle_outline), onPressed: (){}),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  songList != null ? "播放全部（ 共${songList.length}首 ）" :"播放全部" ,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('更多'),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){

                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return SongListPage(singer_id:widget.id.toString());
                }));

              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _songListBox(){

    if(songList == null) { return Container(child: Text(''),);}

    List<Widget> ret = songList.map((item) => _songListBoxItem(item)).toList();

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: ret,
      ),
    );
  }

  Widget _songListBoxItem(item){
    return ListTile(
      title: Text(item['name'],overflow: TextOverflow.ellipsis,),
      subtitle: Text("${singer['name']}-${item['cd_name']}",overflow: TextOverflow.ellipsis,),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: (){},
      ),
    );
  }

  void getSingerOne() async{

    var data = await MusicApi().getSingerOne(widget.id.toString());
    setState(() {
      this.singer = data['data']['singer_row'];
      this.songList = data['data']['song_list'];
    });
  }


}
