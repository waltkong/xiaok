import 'package:flutter/material.dart';

import 'dart:async';

class LoadingPage extends StatefulWidget{

  _LoadingPageState createState() => new _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Image.asset(
        "images/loading.jpg",
      ),
    );
  }


}