import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {

  int highLightIndex = 0;
  bool hideOrShow = true;


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

          Divider(
            height: 1,
          ),

          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(
              '设置', style: TextStyle(fontSize: 20,color: highLightIndex==1? Colors.blue : Colors.black),
            ),

            onTap: (){
              setState(() {
                highLightIndex = 1;
              });
              Navigator.of(context).pushNamed('config_page');
            },
            trailing: Icon(Icons.navigate_next),
          ),


          Divider(
            height: 1,
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            onTap: (){
              setState(() {
                highLightIndex = 2;
              });
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
      accountName: Text('马云',),
      accountEmail: Text(
        'mayun@163.com'
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("images/dog1.jpg"),
      ),
    );
  }

}

