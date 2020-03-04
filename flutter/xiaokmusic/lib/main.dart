import 'package:flutter/material.dart';

import 'package:xiaokmusic/pages/others/loading_page.dart';
import 'package:xiaokmusic/pages/index_page.dart';
import 'package:xiaokmusic/pages/others/message_center_page.dart';
import 'package:xiaokmusic/pages/others/config_page.dart';
import 'package:xiaokmusic/pages/others/search_page.dart';
import 'package:xiaokmusic/pages/music/cd_list_page.dart';
import 'package:xiaokmusic/pages/music/rank_list_page.dart';
import 'package:xiaokmusic/pages/music/singer_list_page.dart';
import 'package:xiaokmusic/pages/music/song_list_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: MaterialApp(
        title: "音乐屋",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: "/",
        routes: {

          'index_loading' :  (context) => LoadingPage(),   //入口跳转页面
          '/': (context) => IndexPage(),  //主页
          'message_center': (context) => MessageCenterPage(),  //消息中心
          'config_page': (context) => ConfigPage(),  //设置页面
          'search_page': (context) => SearchPage(),  //搜索页面

          'cd_list': (context) => CdListPage(),  //专辑列表页面
          'rank_list':(context) => RankListPage(),  //排名列表页面
          'singer_list':(context) => SingerListPage(),  //歌手列表页面
          'song_list':(context) => SongListPage(),  //歌曲列表页面

        },
      ),

    );
  }
}