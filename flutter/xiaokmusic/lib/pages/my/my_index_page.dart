import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/pages/music/cd_one_page.dart';

import 'package:xiaokmusic/utils/login_util.dart';

class MyIndexPage extends StatefulWidget {
  @override
  _MyIndexPageState createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _searchBox(),

          _categoryBox(),

          Divider(),

          _myPersonalCollectionBox(),  //我的歌单


        ],
      ),
    );
  }



  Widget _myPersonalCollectionBox(){


    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                child: Text('我的歌单',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),

              FlatButton(
                onPressed: (){},
                child: Text('新建'),
              ),

            ],
          ),

          Column(
            children: <Widget>[],
          ),
        ],
      ),
    );

  }

  Widget _myPersonalCdBoxItem(item){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          height: ScreenUtil().setHeight(100),
          child: ListTile(
            leading: Image.network(
              item['image'],
              fit: BoxFit.cover,
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(160),
            ),
            title: Text(item['name']),
            trailing: IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){}),
          ),
        ),
        Divider(),
      ],
    );
  }


  Widget _categoryBox(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.library_music),
                    Container(
                      child: Text('本地音乐'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.watch_later),
                    Container(
                      child: Text('最近播放'),
                    ),
                    Container(
                      child: Text('200'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle),
                    Container(
                      child: Text('关注歌手'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

            ],
          ),


          Container(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.music_note),
                    Container(
                      child: Text('歌曲收藏'),
                    ),
                    Container(
                      child: Text('120'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.collections),
                    Container(
                      child: Text('专辑收藏'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.video_label),
                    Container(
                      child: Text('MV收藏'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

            ],
          ),


        ],
      ),
    );
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

}