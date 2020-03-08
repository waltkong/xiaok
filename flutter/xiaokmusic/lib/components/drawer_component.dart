import 'package:flutter/material.dart';
import 'package:xiaokmusic/localdatas/userinfo_form_data.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {

  int highLightIndex = 0;
  bool hideOrShow = true;

  Map userinfo;

  @override
  void initState() {
    super.initState();

    getUserInfo();
  }

  void getUserInfo() async{

    var avatar = await UserinfoFormData().getData('avatar');
    var mobile = await UserinfoFormData().getData('mobile');
    var nickname = await UserinfoFormData().getData('nickname');
    var expiretime = await UserinfoFormData().getData('expiretime');

    setState(() {

      if(DateTime.now().millisecondsSinceEpoch <= int.parse(expiretime)*1000 ){
        userinfo = {
          'nickname' : nickname==null ? '' : nickname,
          'avatar' : avatar==null ? '' : avatar,
          'mobile' : mobile==null ? '' : mobile,
        };
      }

    });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[

          drawerHeaderBox(),

          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              '消息中心', style: TextStyle(fontSize: 20,color: highLightIndex==0? Colors.blue : Colors.black),
            ),
            onTap: (){
              setState(() {
                highLightIndex = 0;
              });
              Navigator.of(context).pushNamed('message_center');
            },
            trailing: Icon(Icons.navigate_next),
          ),

//          Divider(
//            height: 1,
//          ),
//
//          ListTile(
//            leading: Icon(Icons.ac_unit),
//            title: Text(
//              '设置', style: TextStyle(fontSize: 20,color: highLightIndex==1? Colors.blue : Colors.black),
//            ),
//
//            onTap: (){
//              setState(() {
//                highLightIndex = 1;
//              });
//              Navigator.of(context).pushNamed('config_page');
//            },
//            trailing: Icon(Icons.navigate_next),
//          ),


          Divider(
            height: 1,
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            onTap: (){
              setState(() {
                highLightIndex = 2;
              });
              Navigator.of(context).pushNamed('login');
            },
            title: Text(
              '退出登录', style: TextStyle(fontSize: 20,color: highLightIndex==2? Colors.blue : Colors.black),
            ),
            trailing: Icon(Icons.navigate_next),
          ),

          Divider(
            height: 1,
          ),

        ],
      ),
    );

  }


  Widget drawerHeaderBox(){

    return UserAccountsDrawerHeader(
      accountName: Text(userinfo==null ? '未登录':userinfo['nickname'].toString(),),
      accountEmail: Text(
        userinfo==null ? '--': '手机:'+userinfo['mobile'].toString(),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: userinfo==null || userinfo['avatar'].toString().isEmpty?
          AssetImage("images/music_menu.jpg"):
          NetworkImage(userinfo['avatar'].toString()),
      ),
    );


  }



}

