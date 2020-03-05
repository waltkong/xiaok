import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongPlayerComponent extends StatefulWidget {

  String id;
  String name;
  String image;
  String voice_url;
  String singer_name;

  SongPlayerComponent({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.voice_url,
    @required this.singer_name
});

  @override
  _SongPlayerComponentState createState() => _SongPlayerComponentState();
}

class _SongPlayerComponentState extends State<SongPlayerComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(130),
                padding: EdgeInsets.all(3),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text("${widget.name}",style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,),
                    Text("${widget.singer_name}",style: TextStyle(fontSize: 10),overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: (){},
              ),

              IconButton(
                icon: Icon(Icons.play_arrow),  //pause
                onPressed: (){},
              ),

              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: (){},
              ),

              IconButton(
                icon: Icon(Icons.assignment),
                onPressed: (){},
              ),
            ],
          ),

        ],
      ),
    );
  }
}
