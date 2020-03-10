import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/utils/number_util.dart';
import 'package:xiaokmusic/pages/music/singer_one_page.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/components/song_player_component.dart';
import 'package:xiaokmusic/utils/operate_util.dart';

import 'package:xiaokmusic/pages/music/message_list_page.dart';

class CdOnePage extends StatelessWidget {

  String id;

  CdOnePage({
    this.id
});

  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);
    Map _nowPlayStatusMap = _stateProvider.nowPlayStatusMap;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(1334),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(120)),
            child: CdOnePageBody(id:id),
          ),

          Positioned(
            bottom: 0,
            child: SongPlayerComponent(
              id: _nowPlayStatusMap['id'].toString(),
              name: _nowPlayStatusMap['name'].toString(),
              image: _nowPlayStatusMap['image'].toString(),
              voice_url: _nowPlayStatusMap['voice_url'].toString(),
              singer_name: _nowPlayStatusMap['singer_name'].toString(),
              cd_name:_nowPlayStatusMap['cd_name'].toString(),
            ),
          ),

        ],
      ),
    );
  }
}


class CdOnePageBody extends StatefulWidget {
  String id;

  CdOnePageBody({
    this.id
});

  @override
  _CdOnePageBodyState createState() => _CdOnePageBodyState();
}

class _CdOnePageBodyState extends State<CdOnePageBody> {

  Map cd;
  List songList;

  @override
  void initState() {
    super.initState();
    getCdOne();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          _topBody(),

          _playTextBox(),
//
          _songListBox(),


        ],
      ),
    );
  }

  Widget _topBody(){
    return Container(
      height: ScreenUtil().setHeight(260),
      color: Colors.cyanAccent,
      padding: EdgeInsets.all(5),
      child: cd != null ? Row(
        children: <Widget>[

          Image.network(
            cd['image'],width: ScreenUtil().setWidth(300),height: ScreenUtil().setHeight(250),fit: BoxFit.cover,
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Text(cd['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Image.network(
                            cd['singer_image'],
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(50),
                          ),

                          Container(
                            margin: EdgeInsets.all(6),
                            child: Text(cd['singer_name'],style: TextStyle(fontSize: 14),),
                          ),
                        ],
                      ),

                      IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){

                        if(cd != null){
                          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                            return SingerOnePage(id:cd['singer_id'].toString());
                          }));
                        }

                      }),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.favorite_border),
                            Text(NumberUtil().randomNumber(4)),
                          ],
                        ),
                        onTap: (){

                        },
                      ),

                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.message),
                            Text(NumberUtil().randomNumber(3)),
                          ],
                        ),
                        onTap: (){
                          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                            return MessageListPage(
                              cd_id: widget.id.toString(),
                            );
                          }));
                        },
                      ),

                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.screen_share),
                            Text('分享'),
                          ],
                        ),
                        onTap: (){

                        },
                      ),



                    ],
                  ),

                ],
              ),
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
              Icon(Icons.menu),
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
      subtitle: Text(item['description'],overflow: TextOverflow.ellipsis,),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: (){
          OperateUtil().openBottomModalSheet(context, {
            'id': item['id'].toString(),
            'name': item['name'].toString(),
            'image': item['image'].toString(),
            'singer_name': item['singer_name'].toString(),
            'cd_name': item['cd_name'].toString(),
            'voice_url': item['voice_url'].toString(),
          });
        },
      ),
    );
  }


  void getCdOne() async{
    if(widget.id == null || widget.id==''){
      return ;
    }
    var data = await MusicApi().getCdOne(widget.id.toString());

    setState(() {
      this.cd = data['data']['cd_row'];
      this.songList = data['data']['song_list'];
    });
  }

}

