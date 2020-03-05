import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/pages/music/cd_one_page.dart';

class CdListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('专辑'),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('search_page');
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: CdListPageBody(),
    );
  }
}

class CdListPageBody extends StatefulWidget {
  @override
  _CdListPageBodyState createState() => _CdListPageBodyState();
}

class _CdListPageBodyState extends State<CdListPageBody> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  List cdList = [];

  int pageIndex = 1;
  int eachPage = 8;

  @override
  void initState() {
    super.initState();

    getCdListData();

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

          _cdHeaderTextBox(),

          cdListBox(),

        ],
      ),
    ) ;
  }

  Widget _cdHeaderTextBox(){
    return Container(
      padding: EdgeInsets.all(8),
      height: ScreenUtil().setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
            child: Text('精选歌单',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text('推荐',style: TextStyle(fontSize: 14,color: Colors.red),),
          ),


        ],
      ),
    );
  }


  Widget cdListBox(){

    List<Widget> ret = cdList.map((item) => cdBoxItem(item)).toList();

    Widget _cdListBoxWidget =  Container(
      padding: EdgeInsets.all(5),
      child: Wrap(
        spacing:10,
        runSpacing: 5,
        alignment: WrapAlignment.spaceAround,
        runAlignment: WrapAlignment.start,
        children: cdList.length > 0 ? ret : <Widget>[
          Center(
            child: Text('加载中...'),
          )
        ],
      ),
    );

    return _cdListBoxWidget;
  }


  Widget cdBoxItem(item){
    return GestureDetector(
      onTap: (){

        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return CdOnePage(id:item['id'].toString());
        }));

      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Image.network(
              item['image'],
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(300),
              fit: BoxFit.cover,
            ),

            Text(item['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),

            Text(item['singer_name'],style: TextStyle(fontSize: 13,color: Colors.grey),),

          ],
        ),
      ),
    );
  }

  void _getMoreData(){
    setState(() {
      this.pageIndex +=1;
    });
    getCdListData();
  }

  void getCdListData() async{

    var _map = {
      'eachPage':eachPage.toString(),
      'pageIndex':pageIndex.toString(),
    };
    var data = await MusicApi().getCdListData(_map);
    var _cddata = data['data']['data'];

    setState(() {
      if(data['data']['count']>0){
        this.cdList.addAll(_cddata);
      }
    });

  }




}
