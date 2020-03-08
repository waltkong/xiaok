import 'package:flutter/material.dart';

class MessageCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息中心'),
      ),
      body: Center(
        child: Text('消息界面'),
      ),
    );
  }
}
