import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:xiaokmusic/pages/music/music_index_page.dart';
import 'package:xiaokmusic/pages/my/my_index_page.dart';
import 'package:xiaokmusic/components/drawer_component.dart';

import 'package:xiaokmusic/pages/songplayer/song_index_page.dart';
import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/base_state_model.dart';
import 'package:xiaokmusic/components/song_player_component.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}


class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.music_note),
      title: Text("音乐"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("我的"),
    ),
  ];

  final List<Widget> tabBodies = [
    MusicIndexPage(),
    MyIndexPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); //iphone6 必须build里写

    BaseStateModel _stateProvider = Provider.of<BaseStateModel>(context);
    Map _nowPlayStatusMap = _stateProvider.nowPlayStatusMap;

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){

          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(  //状态保持
        index: currentIndex,
        children: tabBodies,
      ),
      appBar: AppBar(
        title: Text("音乐屋",textAlign: TextAlign.center,),
      ),
      drawer: Drawer(
        child: DrawerComponent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
            return SongIndexPage(
              id:_nowPlayStatusMap['id'].toString(),
              name: _nowPlayStatusMap['name'].toString(),
              image: _nowPlayStatusMap['image'].toString(),
              voice_url: _nowPlayStatusMap['voice_url'].toString(),
              cd_name: _nowPlayStatusMap['cd_name'].toString(),
              singer_name: _nowPlayStatusMap['singer_name'].toString(),
            );
          }));

        },
        child: Icon(Icons.music_note),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );

  }


}


