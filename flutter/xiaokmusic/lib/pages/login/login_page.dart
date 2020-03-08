import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/utils/validate_util.dart';
import 'package:xiaokmusic/apis/user_api.dart';

import 'package:provider/provider.dart';
import 'package:xiaokmusic/statemodels/userinfo_state_model.dart';
import 'package:xiaokmusic/localdatas/userinfo_form_data.dart';
import 'package:xiaokmusic/apis/base_api.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body:LoginBodyPage(),
    );
  }
}



class LoginBodyPage extends StatefulWidget {
  @override
  _LoginBodyPageState createState() => _LoginBodyPageState();
}

class _LoginBodyPageState extends State<LoginBodyPage> {

//  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

////  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

////  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = '';  //密码
  var _username = ''; //用户名
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮

//
  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();

    this.initUserFormInfo();
  }

  void initUserFormInfo() async {
    var _u =await UserinfoFormData().getData('username');
    var _p =await UserinfoFormData().getData('password');

    setState(() {
      if(_u != null){
        _userNameController.text = _u;
      }
      if(_p != null){
        _passwordController.text = _p;
      }
    });

  }


//
  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

//  // 监听焦点
  Future<Null> _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);

    //清空登录信息
//    UserinfoStateModel _stateProvider = Provider.of<UserinfoStateModel>(context);
//    _stateProvider.logout();

    return GestureDetector(
      onTap: (){
        // 点击空白区域，回收键盘
        _focusNodePassWord.unfocus();
        _focusNodeUserName.unfocus();
      },
      child: new ListView(
        children: <Widget>[
          new SizedBox(height: ScreenUtil().setHeight(80),),
          logoImageArea(),
          new SizedBox(height: ScreenUtil().setHeight(70),),
          inputTextArea(),
          new SizedBox(height: ScreenUtil().setHeight(80),),
          loginButtonArea(),
          new SizedBox(height: ScreenUtil().setHeight(60),),
          thirdLoginArea(),
          new SizedBox(height: ScreenUtil().setHeight(60),),
          bottomArea(),
        ],
      ),
    );
  }


  // logo 图片区域
  Widget logoImageArea(){
    return new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形
      child: ClipOval(
        child: Image.asset(
          "images/logo.jpg",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String validateUserName(value){
    if(ValidateUtil().isPhone(value)){
      return 'null';
    }
    return '请输入正确手机号';
  }

  String validatePassWord(value){
    if(ValidateUtil().isPassword(value)){
      return 'null';
    }
    return '密码长度不对';
  }


  //输入文本框区域
  Widget inputTextArea(){
    return new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入手机号",
                prefixIcon: Icon(Icons.person),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    // 清空输入框内容
                    _userNameController.clear();
                  },
                )
                    : null ,
              ),
              //验证用户名
//              validator: validateUserName,
              //保存数据
              onSaved: (String value){
                _username = value;
              },
            ),
            new TextFormField(
              focusNode: _focusNodePassWord,
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: (){
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )
              ),
              obscureText: !_isShowPwd,
              //密码验证
//              validator:validatePassWord,
              //保存数据
              onSaved: (String value){
                _password = value;
              },
            )
          ],
        ),
      ),
    );
  }

// 登录按钮区域
  Widget loginButtonArea(){

    UserinfoStateModel _stateProvider = Provider.of<UserinfoStateModel>(context);

    return new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Colors.blue[300],
        child: Text(
          "登录",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: (){
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();

          if (_formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState.save();

            //todo 登录操作

            doLogin(_stateProvider,this._username, this._password);

          }

        },
      ),
    );
  }


  //  登录
  doLogin(UserinfoStateModel _stateProvider,String username,String password) async{

    if(ValidateUtil().isUsername(username) && ValidateUtil().isPassword(password)){

      var res = await UserApi().login({
        'account':username,
        'password':password,
      });
      print(res);

      if(res['code'] == 1){
        var userinfo = res['data']['userinfo'] ;

        //状态管理
        _stateProvider.setUserinfoMap({
          'id':userinfo['id'].toString(),
          'username':userinfo['username'].toString(),
          'nickname':userinfo['nickname'].toString(),
          'mobile':userinfo['mobile'].toString(),
          'avatar': BaseApi.getServerAssetUrl(userinfo['avatar'].toString()),
          'createtime': userinfo['createtime'].toString(),
          'expiretime': userinfo['expiretime'].toString(),
          'token': userinfo['token'].toString(),
        });

        //用户信息写入本地
        await UserinfoFormData().setData({
          'username': userinfo['username'].toString(),
          'password':password.toString(),
          'token':userinfo['token'].toString(),
        });

        Navigator.of(context).pushNamed('/');

      }else{
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('登录失败'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: (){},
          ),
        ));
      }

    }else{
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('请填写用户密码'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: (){},
        ),
      ));
    }


  }


  //第三方登录区域
  Widget thirdLoginArea(){
    return new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,

              ),
              Text(
                  '第三方登录'
              ),
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
          new SizedBox(
            height: 18,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                color: Colors.green[200],
                // 第三方库icon图标
                icon: Image.asset('images/wechat.jpg'),
                iconSize: 40.0,
                onPressed: (){

                },
              ),
              IconButton(
                color: Colors.green[200],
                icon: Image.asset('images/douyin.jpg'),
                iconSize: 40.0,
                onPressed: (){

                },
              ),
              IconButton(
                color: Colors.green[200],
                icon: Image.asset('images/qq.jpg'),
                iconSize: 40.0,
                onPressed: (){

                },
              ),

            ],
          )
        ],
      ),
    );
  }


  //忘记密码  立即注册
  Widget bottomArea(){
    return new Container(
      margin: EdgeInsets.only(right: 20,left: 30),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "忘记密码?",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
              ),
            ),
            //忘记密码按钮，点击执行事件
            onPressed: (){

            },
          ),
          FlatButton(
            child: Text(
              "快速注册",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
              ),
            ),
            //点击快速注册、执行事件
            onPressed: (){

            },
          )
        ],
      ),
    );
  }









}
