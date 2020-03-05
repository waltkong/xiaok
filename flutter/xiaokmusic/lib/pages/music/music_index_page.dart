import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/components/banner_component.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/pages/music/cd_one_page.dart';

import 'package:xiaokmusic/pages/songplayer/song_index_page.dart';

class MusicIndexPage extends StatefulWidget {
  @override
  _MusicIndexPageState createState() => _MusicIndexPageState();
}

class _MusicIndexPageState extends State<MusicIndexPage> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  var now_ad_index = 0;
  var ad_count = 0;
  Map now_ad;

  var new_song_list =[];

  AudioPlayer audioPlayer;

  var playObj;

  List recommendCdList = [];

  @override
  void initState() {
    super.initState();

    getAdList();

    getRecommendCdList();

    getNewSongList();

    audioPlayer = AudioPlayer();

    playObj = {
      'play_or_stop':'stop',
      'voice_url':'',
    };

  }

  void getAdList() async{
    var data = await MusicApi().adList();

    List addata = data['data'];

    setState(() {
      this.now_ad_index = 0;
      this.ad_count = addata.length;
      this.now_ad = addata[now_ad_index];
    });

    Timer.periodic(const Duration(milliseconds: 5000), (timer){

      setState(() {
        if(this.now_ad_index >= this.ad_count - 1){
          this.now_ad_index = 0;
          this.now_ad = addata[this.now_ad_index];
        }else{
          this.now_ad_index +=1;
          this.now_ad = addata[this.now_ad_index];
        }
      });

    });

  }

  void getRecommendCdList() async{
    var data = await MusicApi().recommendCdList();
    setState(() {
      this.recommendCdList = data['data']['data'];
    });
  }

  void getNewSongList() async{
    var data = await MusicApi().newSongRecommendList();
    setState(() {
//      this.new_song_list.addAll(data['data']['data']);
      this.new_song_list = data['data']['data'];
    });
  }


  @override
  void deactivate() async{
    print('结束');
    int result = await audioPlayer.release();
    if (result == 1) {
      print('release success');
    } else {
      print('release failed');
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
        refreshFooter: ClassicsFooter(
          key: _footerKey,
          bgColor: Colors.white,
          textColor: Colors.blue,
          moreInfoColor: Colors.blue,
          showMore: true,
          noMoreText: '没有更多了...',
          moreInfo: '加载中...',
          loadReadyText: '上拉加载...',
        ),
        loadMore: () async{ doLoadMore();},
        child: ListView(
          children: <Widget>[
            _searchBox(),
            // banner
            BannerComponent(),
            _categoryBox(),
//
            _adBox(),  //广告
//
            _recommendBox(), //推荐歌单
//
            _newSongListBox(),  //新歌速递


          ],
        ),
      ),
    );
  }

  void doLoadMore(){
//    getNewSongList();
  }

  Widget _searchBox(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 3),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(80),
      padding: EdgeInsets.fromLTRB(120, 3, 20, 3),
      decoration: BoxDecoration(
        color: Color.fromRGBO(233, 233, 233, 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('search_page');
          },
          child:Row(
            children: <Widget>[

              Icon(Icons.search),

              Container(
                child: Text('搜你想听的',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,),
              ),

            ],
          )
      ),
    );
  }


  Widget _categoryBox(){
    List _catlist = [
      {
        'id':'1',
        'name':'专辑',
        'image':"images/music_menu.jpg",
        'route':'cd_list',
      },
      {
        'id':'2',
        'name':'歌手',
        'image':"images/jay1.jpg",
        'route':'singer_list',
      },
      {
        'id':'3',
        'name':'歌单',
        'image':"images/new_song.jpg",
        'route':'song_list',
      },
      {
        'id':'4',
        'name':'排行榜',
        'image':"images/rank.jpg",
        'route':'rank_list',
      },
    ];

    List<Widget> ret = _catlist.map((item) => _categoryBoxItem(item)).toList();

    return Container(
      height: ScreenUtil().setHeight(170),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: ret,
      ),
    );

  }


  Widget _categoryBoxItem(item){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(item['route']);
      },
      child: Container(
        width: ScreenUtil().setWidth(130),
        margin: EdgeInsets.fromLTRB(10, 3, 10, 10),
        child: Column(
          children: <Widget>[

            Image.asset(
              item['image'],
              fit:BoxFit.cover,
              width: ScreenUtil().setWidth(90),
              height: ScreenUtil().setHeight(90),
            ),

            Container(
              margin: EdgeInsets.only(top:10),
              height: ScreenUtil().setHeight(30),
              child: Center(
                child: Text(item['name']),
              ),
            ),

          ],
        ),

      ),
    );
  }



  Widget _adBox(){
    return Container(
      height: ScreenUtil().setHeight(100),
      decoration: BoxDecoration(
        color:Colors.grey,
        borderRadius:BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[

          ad_count==0 ? Container():Image.network(now_ad['image'],fit: BoxFit.cover,width: ScreenUtil().setWidth(200),),

          Container(
            margin: EdgeInsets.only(left: 5),
            child: ad_count==0 ? Container():
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(now_ad['name'],style: TextStyle(fontSize: 16,color: Colors.white),overflow:TextOverflow.ellipsis,),
                  Text(now_ad['description'],style: TextStyle(fontSize: 14,color: Colors.white),overflow:TextOverflow.ellipsis,),
                ],
              ),
          ),



        ],
      ),
    );
  }


  Widget _recommendBox(){


    List<Widget> ret = recommendCdList.map((_item) => _recommendBoxItem(_item)).toList();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                padding: EdgeInsets.all(3),
                child: Text(
                  '推荐歌单',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('cd_list');
                  },
                  child: Text('更多...',),
                ),
              ),

            ],

          ),


          Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing:10,
              runSpacing: 5,
              alignment: WrapAlignment.spaceAround,
              runAlignment: WrapAlignment.start,
              children: recommendCdList.length > 0 ? ret:<Widget>[],
            ),

          ),


        ],
      ),
    );
  }


  Widget _recommendBoxItem(item){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return CdOnePage(id:item['id'].toString());
        }));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(210),
            height: ScreenUtil().setHeight(160),
            fit: BoxFit.cover,
          ),
          Text(
            item['name'],
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }



  Widget _newSongListBox(){

    List<Widget> ret = new_song_list.map((_item) => _newSongListBoxItem(_item)).toList();


    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                padding: EdgeInsets.all(3),
                child: Text(
                  '新歌速递',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('song_list');
                  },
                  child: Text('更多...',),
                ),
              ),

            ],

          ),

          Container(
            child: Column(
              children: new_song_list.length > 0?  ret:<Widget>[],
            ),
          ),

        ],
      ),
    );
  }


  Widget _newSongListBoxItem(item){
    return new Container(
      child: ListTile(
        leading: Image.network(
          item['image'],
          fit: BoxFit.cover,
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(230),
        ),
        title: Text("${item['name']}",overflow: TextOverflow.ellipsis,),
        subtitle: Row(
          children: <Widget>[
            Text("${item['singer_name']} - ${item['cd_name']}",overflow: TextOverflow.ellipsis,),
          ],
        ),
        trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
        onTap: (){

          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
            return SongIndexPage(id:item['id'].toString());
          }));

        },
      ),
    );
  }

  //播放
  play(src) async {
    int result = await audioPlayer.play(src);
    if (result == 1) {
      // success
      print('play success');
    } else {
      print('play failed');
    }
  }

  //暂停
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
      print('pause success');
    } else {
      print('pause failed');
    }
  }



}
