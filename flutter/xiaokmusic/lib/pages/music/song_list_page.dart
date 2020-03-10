import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:xiaokmusic/pages/songplayer/song_index_page.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/components/song_player_component.dart';
import 'package:xiaokmusic/utils/operate_util.dart';

class SongListPage extends StatelessWidget {

  String singer_id;
  String keyword;


  SongListPage({
    this.singer_id,
    this.keyword,
});

  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);
    Map _nowPlayStatusMap = _stateProvider.nowPlayStatusMap;

    return Scaffold(
      appBar: AppBar(
        title: Text('歌曲'),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('search_page');
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
      body:   Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(1334),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(120)),
            child: SongListPageBody(singer_id: this.singer_id,keyword:keyword),
          ),

          Positioned(
            bottom: 0,
            child: SongPlayerComponent(
              id: _nowPlayStatusMap['id'].toString(),
              name: _nowPlayStatusMap['name'].toString(),
              image: _nowPlayStatusMap['image'].toString(),
              voice_url: _nowPlayStatusMap['voice_url'].toString(),
              singer_name: _nowPlayStatusMap['singer_name'].toString(),
              cd_name: _nowPlayStatusMap['cd_name'].toString(),
            ),
          ),

        ],
      ),
    );
  }
}

class SongListPageBody extends StatefulWidget {

  String singer_id;
  String keyword;
  SongListPageBody({
    this.singer_id,
    this.keyword,
});

  @override
  _SongListPageBodyState createState() => _SongListPageBodyState();
}

class _SongListPageBodyState extends State<SongListPageBody> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  List songList = [];

  String total;
  int pageIndex = 1;
  int eachPage = 8;

  @override
  void initState() {
    super.initState();
    getSongListData();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        bgColor: Colors.white,
        textColor: Colors.blue,
        moreInfoColor: Colors.blue,
        showMore: true,
        noMoreText: '',
        moreInfo: '加载中...',
        loadReadyText: '上拉加载...',
      ),
      loadMore: () async{ _getMoreData();},
      child: ListView(
        children: <Widget>[

          _songListHeaderTextBox(),

          Divider(),

          songListBox(),

        ],
      ),
    );
  }

  Widget _songListHeaderTextBox(){
    return Container(
      padding: EdgeInsets.all(8),
      height: ScreenUtil().setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
            child: Text('好歌推荐',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(this.songList.length > 0 ? "共（${this.total}）" :'',style: TextStyle(fontSize: 14,color: Colors.red),),
          ),

        ],
      ),
    );
  }

  Widget songListBox(){

    if(songList.length == 0) {
      return Container(
        child: Center(
          child: Text('加载中...'),
        ),
      );
    }else{
      List<Widget> ret = this.songList.map((item) => this.songListBoxItem(item)).toList();
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: ret,
        ),
      );
    }


  }

  Widget songListBoxItem(item){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return SongIndexPage(
                  id:item['id'].toString(),
                  name: item['name'].toString(),
                  image: item['image'].toString(),
                  voice_url: item['voice_url'].toString(),
                  cd_name: item['cd_name'].toString(),
                  singer_name: item['singer_name'].toString(),
                );
              }));
            },
            child: Container(
              padding: EdgeInsets.only(bottom:3),
              height: ScreenUtil().setHeight(100),
              child: ListTile(
                leading: Image.network(
                  item['image'],
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(120),
                  fit: BoxFit.cover,
                ),
                title: Text(item['name']),
                subtitle: Text(
                  "${item['singer_name']} - ${item['cd_name']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: (){
                  OperateUtil().openBottomModalSheet(context, {
                    'id': item['id'].toString(),
                    'name': item['name'].toString(),
                    'image': item['image'].toString(),
                    'singer_name': item['singer_name'].toString(),
                    'cd_name': item['cd_name'].toString(),
                    'voice_url': item['voice_url'].toString(),
                  });
                }),
              ),
            ),
          ),
          Divider(
          ),
        ],
      ),
    );
  }


  void _getMoreData(){
    setState(() {
      this.pageIndex +=1;
    });
    getSongListData();
  }

  void getSongListData() async{
    var _map = {
      'eachPage':eachPage.toString(),
      'pageIndex':pageIndex.toString(),
    };

    if(widget.singer_id != null && widget.singer_id !=''){
      _map['singer_id'] = widget.singer_id;
    }
    if(widget.keyword != null && widget.keyword !=''){
      _map['name'] = widget.keyword;
    }

    var data = await MusicApi().getSongListData(_map);
    var _songdata = data['data']['data'];
    setState(() {
      this.total = data['data']['total'].toString();
      if(data['data']['count']>0){
        this.songList.addAll(_songdata);
      }
    });
  }

}

