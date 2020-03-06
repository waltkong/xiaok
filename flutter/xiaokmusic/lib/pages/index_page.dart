import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:xiaokmusic/pages/music/music_index_page.dart';
import 'package:xiaokmusic/pages/my/my_index_page.dart';
import 'package:xiaokmusic/components/drawer_component.dart';

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

        },
        child: Icon(Icons.music_note),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );

  }


}


