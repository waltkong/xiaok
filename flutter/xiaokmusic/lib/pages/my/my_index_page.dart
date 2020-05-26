import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/pages/music/cd_one_page.dart';

import 'package:xiaokmusic/utils/login_util.dart';
import 'package:path_provider/path_provider.dart';

class MyIndexPage extends StatefulWidget {
  @override
  _MyIndexPageState createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {

  TextEditingController _collectionnamecontroller = TextEditingController();

  List myCollectionList = [
      {'name':'默认'}
    ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _collectionnamecontroller.dispose();
    super.dispose();
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

    List<Widget> ret = myCollectionList.map((item) => _myPersonalCollectionBoxItem(item)).toList();

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
                onPressed: (){
                  showDialog(context: context,builder: (BuildContext context){

                    return SimpleDialog(
                      title: Text('请输入歌单名'),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            Container(
                              width:ScreenUtil().setWidth(300),
                              child: TextField(
                                controller: _collectionnamecontroller,
                                maxLength: 20,
                                autofocus: false,//是否自动对焦
                                textAlign: TextAlign.left,//文本对齐方式
                                onSubmitted: (text) {//内容提交(按回车)的回调
                                  setState(() {
                                    myCollectionList.add( {'name':_collectionnamecontroller.text.toString()});
                                    _collectionnamecontroller.text = '';
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),

                            Container(
                              width:ScreenUtil().setWidth(80),
                              padding: EdgeInsets.all(5),
                              child: InkWell(
                                child: Text('确定'),
                                onTap: (){
                                  setState(() {
                                    myCollectionList.add( {'name':_collectionnamecontroller.text.toString()});
                                    _collectionnamecontroller.text = '';
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),

                          ],
                        ),
                      ],
                    );

                  });
                },
                child: Text('新建'),
              ),

            ],
          ),

          Column(
            children: ret,
          ),
        ],
      ),
    );

  }

  Widget _myPersonalCollectionBoxItem(item){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          height: ScreenUtil().setHeight(100),
          child: ListTile(
            leading: Icon(Icons.collections),
            title: Text(item['name'].toString()),
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
                    Icon(Icons.watch_later),
                    Container(
                      child: Text('最近播放'),
                    ),
                    Container(
                      child: Text('0'),
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
                      child: Text('0'),
                    ),
                  ],
                ),
              ),

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