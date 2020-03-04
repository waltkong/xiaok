import 'package:flutter/material.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';


class SingerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌手'),
      ),
      body: SingerListPageBody(),
    );
  }
}

class SingerListPageBody extends StatefulWidget {
  @override
  _SingerListPageBodyState createState() => _SingerListPageBodyState();
}

class _SingerListPageBodyState extends State<SingerListPageBody> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  List singerList = [];

  String total;
  int pageIndex = 1;
  int eachPage = 8;

  @override
  void initState() {
    super.initState();
    getSingerListData();
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

          _singerListHeaderTextBox(),

          Divider(),

          singerListBox(),

        ],
      ),
    );
  }

  Widget _singerListHeaderTextBox(){
    return Container(
      padding: EdgeInsets.all(8),
      height: ScreenUtil().setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
            child: Text('歌手',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(this.singerList.length > 0 ? "推荐（${this.total}人）" :'推荐',style: TextStyle(fontSize: 14,color: Colors.red),),
          ),

        ],
      ),
    );
  }

  Widget singerListBox(){

    if(singerList.length == 0) {
      return Container(
        child: Center(
          child: Text('加载中...'),
        ),
      );
    }else{
      List<Widget> ret = this.singerList.map((item) => this.singerListBoxItem(item)).toList();
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: ret,
        ),
      );
    }


  }

  Widget singerListBoxItem(item){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){},
          child: Container(
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(
                  item['one_image'],
                ),
              ),
              title: Text(item['name']),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }


  void _getMoreData(){
    setState(() {
      this.pageIndex +=1;
    });
    getSingerListData();
  }

  void getSingerListData() async{
    var _map = {
      'eachPage':eachPage.toString(),
      'pageIndex':pageIndex.toString(),
    };
    var data = await MusicApi().getSingerListData(_map);
    var _singerdata = data['data']['data'];
    setState(() {
      this.total = data['data']['total'].toString();
      if(data['data']['count']>0){
        this.singerList.addAll(_singerdata);
      }
    });
  }
}
