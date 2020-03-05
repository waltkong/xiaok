import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/components/song_player_component.dart';


class SongIndexPage extends StatefulWidget {

  String id;
  SongIndexPage({
    this.id
});

  @override
  _SongIndexPageState createState() => _SongIndexPageState();
}

class _SongIndexPageState extends State<SongIndexPage> {

  Map song;

  @override
  void initState() {
    super.initState();
    getSongOne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song==null?'':song['name']),
      ),
      body: Container(
        color: Colors.cyanAccent,
        padding: EdgeInsets.all(10),
        child: _bodyWidget(),
      ),
    );
  }


  Widget _bodyWidget(){
    if(song == null) {
      return Center(
        child: Text('加载中..'),
      );
    }
    return Stack(
      children: <Widget>[

        Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(150)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                child: Text("${song['singer_name']} - ${song['cd_name']}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14,),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10,bottom: 10),
                child: Image.network(song['image'],
                  width: ScreenUtil().setWidth(650),
                  height: ScreenUtil().setHeight(400),
                  fit: BoxFit.cover,
                ),
              ),

              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text('歌词',textAlign: TextAlign.center,),

                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text("  ${song['lyric']}"),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.file_download),
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.add_comment),
                      onPressed: (){},
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Color(0xff00ff00),
                ),
              ),

            ],
          ),
        ),

        Positioned(
          bottom: 0,
          child: SongPlayerComponent(
            id: song['id'].toString(),
            name: song['name'].toString(),
            image: song['image'].toString(),
            voice_url: song['voice_url'].toString(),
            singer_name: song['singer_name'].toString(),
          ),
        )

      ],
    );
  }

  void getSongOne() async{
    var data = await MusicApi().getSongOne(widget.id.toString());
    var _songdata = data['data']['song_row'];
    setState(() {
      this.song = _songdata;
    });
  }


}
