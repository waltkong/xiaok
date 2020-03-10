import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/base_api.dart';
import 'package:xiaokmusic/apis/app_api.dart';

class LeaveMessageComponent extends StatefulWidget {

  String song_id;  //音乐id
  String cd_id;  //专辑id
  String singer_id;  //歌手id
  String msg_id;  //消息id


  LeaveMessageComponent({
    this.song_id,
    this.singer_id,
    this.cd_id,
    this.msg_id,
});

  @override
  _LeaveMessageComponentState createState() => _LeaveMessageComponentState();
}


class _LeaveMessageComponentState extends State<LeaveMessageComponent> {


  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return  Container(
      color: Colors.white70,
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(10),
            height: 0.5,
            width: ScreenUtil().setWidth(750),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            height: ScreenUtil().setHeight(80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                SizedBox(
                  width: ScreenUtil().setWidth(30),
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  height: ScreenUtil().setHeight(80),
                  width: ScreenUtil().setWidth(570),
                  child: TextField(
                    controller: _controller,
                    maxLength: 150,
                    autofocus: false,//是否自动对焦
                    textAlign: TextAlign.left,//文本对齐方式
                    onSubmitted: (text) {//内容提交(按回车)的回调
                      print('submit $text');
                      setState(() {
                        _controller.text = text;
                      });
                      doSendMsg();
                    },
                  ),
                ),

                SizedBox(
                  width: ScreenUtil().setWidth(3),
                ),

                Container(
                  width: ScreenUtil().setWidth(145),
                  child: FlatButton(
                    onPressed: () async{
                      await doSendMsg();
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(145),
                      padding: EdgeInsets.all(5),
                      color: Colors.grey,
                      child: Text('发送',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }


  Future doSendMsg() async{
    var token =await BaseApi().getToken();
    if(token == null){
      Navigator.of(context).pushNamed('login');
    }
    if(_controller.text == null || _controller.text.toString().isEmpty){
      return null;
    }
    Map _map = {
      'msg': _controller.text.toString(),
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

    var response = await AppApi().addMessage(_map);

    setState(() {
      _controller.text = '';
    });

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('消息发送成功'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: (){},
      ),
    ));

  }

}
