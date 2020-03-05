import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaokmusic/apis/music_api.dart';
import 'package:xiaokmusic/pages/music/cd_one_page.dart';

class MyIndexPage extends StatefulWidget {
  @override
  _MyIndexPageState createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {

  List recommendCdList = [];

  @override
  void initState() {
    super.initState();
    getRecommendCdList();
  }

  void getRecommendCdList() async{
    var data = await MusicApi().recommendCdList();
    setState(() {
      this.recommendCdList = data['data']['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _searchBox(),

          _categoryBox(),

          _myPersonalCdBox(),  //我的歌单

          _recommendBox(), //推荐歌单

        ],
      ),
    );
  }

  Widget _myPersonalCdBox(){

    List<Widget> ret = recommendCdList.map((item) => _myPersonalCdBoxItem(item)).toList();

    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                child: Text('我的歌单',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),

              FlatButton(
                onPressed: (){},
                child: Text('新建'),
              ),

            ],
          ),

          Column(
            children: ret.length>0 ? ret: <Widget>[],
          ),
        ],
      ),
    );
  }

  Widget _myPersonalCdBoxItem(item){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          height: ScreenUtil().setHeight(100),
          child: ListTile(
            leading: Image.network(
              item['image'],
              fit: BoxFit.cover,
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(160),
            ),
            title: Text(item['name']),
            trailing: IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){}),
          ),
        ),
        Divider(),
      ],
    );
  }



  Widget _recommendBox(){

    List<Widget> ret = recommendCdList.map((_item) => _recommendBoxItem(_item)).toList();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                padding: EdgeInsets.all(3),
                child: Text(
                  '推荐歌单',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('cd_list');
                  },
                  child: Text('更多...',),
                ),
              ),

            ],

          ),


          Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing:10,
              runSpacing: 5,
              alignment: WrapAlignment.spaceAround,
              runAlignment: WrapAlignment.start,
              children: recommendCdList.length > 0 ? ret:<Widget>[],
            ),

          ),


        ],
      ),
    );
  }


  Widget _recommendBoxItem(item){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return CdOnePage(id:item['id'].toString());
        }));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(210),
            height: ScreenUtil().setHeight(160),
            fit: BoxFit.cover,
          ),
          Text(
            item['name'],
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }


  Widget _categoryBox(){
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.library_music),
                    Container(
                      child: Text('本地音乐'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.watch_later),
                    Container(
                      child: Text('最近播放'),
                    ),
                    Container(
                      child: Text('200'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Container(
                      child: Text('我喜欢的'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle),
                    Container(
                      child: Text('关注歌手'),
                    ),
                    Container(
                      child: Text('12'),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }


  Widget _searchBox(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 3),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(80),
      padding: EdgeInsets.fromLTRB(120, 3, 20, 3),
      decoration: BoxDecoration(
        color: Color.fromRGBO(233, 233, 233, 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('search_page');
          },
          child:Row(
            children: <Widget>[

              Icon(Icons.search),

              Container(
                child: Text('搜你想听的',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,),
              ),

            ],
          )
      ),
    );
  }

}