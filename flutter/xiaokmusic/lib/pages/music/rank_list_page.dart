import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';


class RankListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排名'),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('search_page');
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: RankListPageBody(),
    );
  }
}

class RankListPageBody extends StatefulWidget {
  @override
  _RankListPageBodyState createState() => _RankListPageBodyState();
}

class _RankListPageBodyState extends State<RankListPageBody> {

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
        noMoreText: '没有更多了...',
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
            child: Text('热门歌曲',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
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
            onTap: (){},
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
                trailing: Icon(Icons.arrow_forward),
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

