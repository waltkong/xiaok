import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongModalSheetComponent extends StatefulWidget {

  String id;
  String name;
  String voice_url;

  SongModalSheetComponent({
    this.id,
    this.name,
    this.voice_url
});


  @override
  _SongModalSheetComponentState createState() => _SongModalSheetComponentState();
}

class _SongModalSheetComponentState extends State<SongModalSheetComponent> {

  @override
  Widget build(BuildContext context) {
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
            children: _itemList(),
          ),

        ],
      ),
    );
  }

  List<Widget> _itemList(){
    return [
      this._eachItemWidget('播放',Icon(Icons.play_circle_filled),'play'),
      this._eachItemWidget('下一首播放',Icon(Icons.queue_play_next),'next_play'),
      this._eachItemWidget('加到歌单',Icon(Icons.add_to_photos),'add_to_cd'),
      this._eachItemWidget('收藏',Icon(Icons.favorite_border),'like'),
      this._eachItemWidget('评论',Icon(Icons.insert_comment),'comment'),
      this._eachItemWidget('下载',Icon(Icons.file_download),'download'),
      this._eachItemWidget('分享',Icon(Icons.share),'share'),
      this._eachItemWidget('歌手详情',Icon(Icons.person),'singer_detail'),
    ];
  }


  Widget _eachItemWidget(String str,Icon _icon,String flag){
    return GestureDetector(
      onTap: (){
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
