import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';

import 'package:xiaokmusic/components/leave_message_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/app_api.dart';

class MessageListPage extends StatelessWidget {

  String song_id = '';  //音乐id
  String cd_id = '';  //专辑id
  String singer_id = '';  //歌手id
  String msg_id = '';  //消息id

  MessageListPage({
    this.song_id,
    this.singer_id,
    this.cd_id,
    this.msg_id
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('评论专区'),
      ),
      body: Container(
        child: MessageListPageMiddleware(
          song_id: song_id,
          cd_id: cd_id,
          singer_id: singer_id,
          msg_id: msg_id,
        ),
      ),
    );
  }


}


class MessageListPageMiddleware extends StatefulWidget {

  String song_id = '';  //音乐id
  String cd_id = '';  //专辑id
  String singer_id = '';  //歌手id
  String msg_id = '';  //消息id

  MessageListPageMiddleware({
    this.song_id,
    this.singer_id,
    this.cd_id,
    this.msg_id
  });

  @override
  _MessageListPageMiddlewareState createState() => _MessageListPageMiddlewareState();
}

class _MessageListPageMiddlewareState extends State<MessageListPageMiddleware> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: <Widget>[

          Container(
            height: ScreenUtil().setHeight(1334),
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(105)),
            child: MessageListPageBody(
              singer_id: widget.singer_id,
              song_id: widget.song_id,
              msg_id: widget.msg_id,
              cd_id: widget.cd_id,
            ),
          ),

          Positioned(
            bottom: 0,
            child: LeaveMessageComponent(
              singer_id: widget.singer_id,
              song_id: widget.song_id,
              msg_id: widget.msg_id,
              cd_id: widget.cd_id,
            ),
          ),

        ],
      ),
    );
  }
}




class MessageListPageBody extends StatefulWidget {

  String song_id = '';  //音乐id
  String cd_id = '';  //专辑id
  String singer_id = '';  //歌手id
  String msg_id = '';  //消息id


  MessageListPageBody({
    this.song_id,
    this.singer_id,
    this.cd_id,
    this.msg_id,
  });

  @override
  _MessageListPageBodyState createState() => _MessageListPageBodyState();
}

class _MessageListPageBodyState extends State<MessageListPageBody> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  List dataList = [];

  int pageIndex = 1;
  int eachPage = 8;


  @override
  void initState() {
    super.initState();

    getListData(false);
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

          _headerTextBox(),

          _listBox(),

        ],
      ),
      onRefresh: doOnRefresh,
    );
  }

  Future doOnRefresh() async{
    setState(() {
      pageIndex = 1;
      eachPage = 8;
    });
    await getListData(true);
  }

  Widget _headerTextBox(){
    return Container(
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('热门评论',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }


  Widget _listBox(){

    List<Widget> ret = dataList.map((item){
      return Column(
        children: <Widget>[
          _listBoxBoxItem(item),
          Divider(),
        ],
      );
    }).toList();

    return Column(
      children: ret,
    );

  }


  Widget _listBoxBoxItem(item){
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: <Widget>[

          Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(90),
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(item['avatar'].toString()),
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            width: ScreenUtil().setWidth(540),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item['username'].toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        Text(item['createtime'].toString(),style: TextStyle(fontSize: 12),),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(item['like_count'].toString()),
                        IconButton(
                          icon: Icon(Icons.thumb_up),
                          onPressed: (){

                          },
                        )
                      ],
                    )
                  ],
                ),

                Container(
                  width: ScreenUtil().setWidth(540),
                  color: Colors.teal,
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '    '+item['msg'].toString(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: (){

                          },
                          child: Text('查看更多回复..'),
                        )
                    ),
                  ],
                )


              ],
            ),
          ),


        ],
      ),
    );
  }



  void _getMoreData(){
    setState(() {
      this.pageIndex +=1;
    });
    getListData(false);
  }


  Future getListData(bool isRefresh) async{
    var _map = {
      'eachPage':eachPage.toString(),
      'pageIndex':pageIndex.toString(),
    };

    if(widget.song_id != null){
      _map['song_id'] = widget.song_id;
    }
    if(widget.cd_id != null){
      _map['cd_id'] = widget.cd_id;
    }
    if(widget.singer_id != null) {
      _map['singer_id'] = widget.singer_id;
    }
    if(widget.msg_id != null){
      _map['msg_id'] = widget.msg_id;
    }

    var data = await AppApi().messageList(_map);
    var _dataList = data['data']['data'];



    if(isRefresh){
      setState(() {
        if(data['data']['count']>0){
          this.dataList = _dataList;
        }
      });
    }else{
      setState(() {
        if(data['data']['count']>0){
          this.dataList.addAll(_dataList);
        }
      });
    }

  }


}



