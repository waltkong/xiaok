import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/utils/number_util.dart';
import 'package:xiaokmusic/pages/music/singer_one_page.dart';


class CdOnePage extends StatelessWidget {

  String id;

  CdOnePage({
    this.id
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: CdOnePageBody(id:id),
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
                      Column(
                        children: <Widget>[
                          Icon(Icons.favorite_border),
                          Text(NumberUtil().randomNumber(4)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.message),
                          Text(NumberUtil().randomNumber(3)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.screen_share),
                          Text('分享'),
                        ],
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
        onPressed: (){},
      ),
    );
  }


  void getCdOne() async{

    var data = await MusicApi().getCdOne(widget.id.toString());

    setState(() {
      this.cd = data['data']['cd_row'];
      this.songList = data['data']['song_list'];
    });
  }

}

