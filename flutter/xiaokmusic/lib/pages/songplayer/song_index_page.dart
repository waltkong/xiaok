import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/components/song_player_component.dart';
import 'package:xiaokmusic/pages/music/message_list_page.dart';
import 'package:xiaokmusic/utils/number_util.dart';

class SongIndexPage extends StatefulWidget {

  String id = '';
  String name = '';
  String image = '';
  String voice_url = '';
  String cd_name = '';
  String singer_name = '';


  SongIndexPage({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.voice_url,
    @required this.cd_name,
    @required this.singer_name,
});

  @override
  _SongIndexPageState createState() => _SongIndexPageState();
}

class _SongIndexPageState extends State<SongIndexPage> {

  Map song;

  int like_count = NumberUtil().randomInMaxNumber(1000);
  int download_count = NumberUtil().randomInMaxNumber(1000);

  @override
  void initState() {
    super.initState();
    getSongOne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
      ),
      body: Container(
        color: Colors.cyanAccent,
        child: _bodyWidget(),
      ),
    );
  }


  Widget _bodyWidget(){
    return Stack(
      children: <Widget>[

        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(150)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                child: Text( "${widget.singer_name} - ${widget.cd_name}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14,),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:10,bottom: 10),
                child: Image.network("${widget.image}",
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
                      child: Text(song==null? '加载中...' : " ${song['lyric']}"),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.favorite_border),
                          Text(like_count.toString()),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          like_count +=1;
                        });
                      },
                    ),

                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.message),
                          Text(song==null? '' : " ${song['message_count']}"),
                        ],
                      ),
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                          return MessageListPage(
                            song_id: widget.id.toString(),
                          );
                        }));
                      },
                    ),

                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.file_download),
                          Text(download_count.toString()),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          download_count +=1;
                        });
                      },
                    ),

                    InkWell(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.add_comment),
                          Text('加入歌单',style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      onTap: (){},
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
            id: widget.id.toString(),
            name: widget.name.toString(),
            image: widget.image.toString(),
            voice_url: widget.voice_url.toString(),
            singer_name: widget.singer_name.toString(),
            cd_name:  widget.cd_name.toString(),
          ),
        ),

      ],
    );
  }

  void getSongOne() async{
    if(widget.id == null || widget.id==''){
      return ;
    }
    var data = await MusicApi().getSongOne(widget.id.toString());
    var _songdata = data['data']['song_row'];
    setState(() {
      this.song = _songdata;
    });
  }


}
