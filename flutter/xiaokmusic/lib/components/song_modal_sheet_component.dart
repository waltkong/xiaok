import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';

class SongModalSheetComponent extends StatefulWidget {

  String id;
  String name;
  String image;
  String singer_name;
  String cd_name;
  String voice_url;

  SongModalSheetComponent({
    @required this.id,
    @required this.image,
    @required this.singer_name,
    @required this.cd_name,
    @required this.name,
    @required this.voice_url,
});


  @override
  _SongModalSheetComponentState createState() => _SongModalSheetComponentState();
}

class _SongModalSheetComponentState extends State<SongModalSheetComponent> {

  @override
  Widget build(BuildContext context) {

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);

    return Container(
      height: ScreenUtil().setHeight(400),
      child: ListView(
        children: <Widget>[

          Container(
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("${widget.name}"),
                FlatButton(
                  child: Text('取消'),
                  onPressed: (){
                    Navigator.of(context).pop('close');
                  },
                ),
              ],
            ),
          ),

          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _itemList(_stateProvider),
          ),

        ],
      ),
    );
  }

  List<Widget> _itemList(_stateProvider){
    return [
      this._eachItemWidget(_stateProvider,'播放',Icon(Icons.play_circle_filled),'play'),
      this._eachItemWidget(_stateProvider,'下一首播放',Icon(Icons.queue_play_next),'next_play'),
      this._eachItemWidget(_stateProvider,'加到歌单',Icon(Icons.add_to_photos),'add_to_cd'),
      this._eachItemWidget(_stateProvider,'收藏',Icon(Icons.favorite_border),'like'),
      this._eachItemWidget(_stateProvider,'评论',Icon(Icons.insert_comment),'comment'),
      this._eachItemWidget(_stateProvider,'下载',Icon(Icons.file_download),'download'),
      this._eachItemWidget(_stateProvider,'分享',Icon(Icons.share),'share'),
      this._eachItemWidget(_stateProvider,'歌手详情',Icon(Icons.person),'singer_detail'),
    ];
  }


  void _listenThisItemTap(String flag,BaseStateModel _stateProvider){

    print(flag);

    switch(flag){
      case 'play':
        _stateProvider.addOneToPlayList({
          'id':widget.id,
          'image':widget.image,
          'name':widget.name,
          'singer_name':widget.singer_name,
          'cd_name':widget.cd_name,
          'voice_url':widget.voice_url,
        },'head');
        break;
      case 'next_play':
        _stateProvider.addOneToPlayList({
          'id':widget.id,
          'image':widget.image,
          'name':widget.name,
          'singer_name':widget.singer_name,
          'cd_name':widget.cd_name,
          'voice_url':widget.voice_url,
        },'next');
        break;
    }
  }

  Widget _eachItemWidget(BaseStateModel _stateProvider,String str,Icon _icon,String flag){

    return GestureDetector(
      onTap: (){
        _listenThisItemTap(flag,_stateProvider);
        Navigator.of(context).pop(flag);
      },
      child: Container(
        width: ScreenUtil().setWidth(180),
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.lightBlueAccent,
              ),
              child: _icon,
            ),

            Container(
              margin: EdgeInsets.all(3),
              child: Text(str,style: TextStyle(fontSize: 12),),
            )

          ],
        ),
      ),
    );
  }




}
