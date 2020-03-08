import 'package:flutter/material.dart';
import 'package:xiaokmusic/localdatas/search_history_data.dart';
import 'package:xiaokmusic/pages/music/cd_list_page.dart';
import 'package:xiaokmusic/pages/music/singer_list_page.dart';
import 'package:xiaokmusic/pages/music/song_list_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        child: SearchPageBody(),
      ),
    );
  }
}

class SearchPageBody extends StatefulWidget {
  @override
  _SearchPageBodyState createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {

  TextEditingController _controller;

  String changedText ='';

  String pickedMenuValue = 'singer';

  List searchHistory =[];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    getSearchHistory();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void getSearchHistory() async{
    var res = await SearchHistoryData().getAll();
    setState(() {
      searchHistory = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _inputBox(),

          _textTitleBox('历史搜索'),

          _wordBox(),
        ],
      ),
    );
  }

  Widget _inputBox(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

          Container(
            child: DropdownButton(
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('搜歌手',style: TextStyle(color: pickedMenuValue=='singer'?Colors.red:Colors.grey),),
                  value: 'singer',
                ),
                DropdownMenuItem(
                  child: Text('搜歌曲',style: TextStyle(color: pickedMenuValue=='song'?Colors.red:Colors.grey),),
                  value: 'song',
                ),
                DropdownMenuItem(
                  child: Text('搜专辑',style: TextStyle(color: pickedMenuValue=='cd'?Colors.red:Colors.grey),),
                  value: 'cd',
                ),
              ],
              value: pickedMenuValue,
              hint: Text('搜索类型'),
              onChanged: (selectvalue){
                setState(() {
                  pickedMenuValue = selectvalue;
                });
              },
              elevation: 20,
              style: new TextStyle(//设置文本框里面文字的样式
                  color: Colors.blue,
                  fontSize: 15
              ),
              iconSize: 30,//设置三角标icon的大小
//              underline: Container(height: 1,color: Colors.blue,),// 下划线
            ),
          ),

          Expanded(
            child: TextField(
              controller: _controller,
              maxLength: 30,
              maxLines: 1,
              autofocus: true,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20,color: Colors.blue),
              onSubmitted: (text){
                print(text);
                setState(() {
                  _controller.text = text;
                });
                submitForm();
              },
              onChanged: (text){
                print(text);
                setState(() {
                  changedText = text;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){
              setState(() {
                _controller.text = changedText;
              });
              submitForm();
            },
          ),
        ],
      ),
    );
  }

  void submitForm() async{
    print(_controller.text);
    if(_controller.text != null && _controller.text !=''){
      addHistory();
      jump_route();
    }
  }


  void jump_route(){
    switch(pickedMenuValue){
      case 'singer':
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return SingerListPage(keyword:_controller.text.toString());
        }));
        break;
      case 'song':
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return SongListPage(keyword:_controller.text.toString());
        }));
        break;
      case 'cd':
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return CdListPage(keyword:_controller.text.toString());
        }));
        break;
    }
  }


  void addHistory() async{
    var res = await SearchHistoryData().addOne(_controller.text);
    setState(() {
      searchHistory = res;
    });
  }

  void deleteHistory() async{
     var res = await SearchHistoryData().deleteAll();
     setState(() {
       searchHistory = [];
     });
  }

  Widget _textTitleBox(String str){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(str,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                deleteHistory();
              },
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
  
  Widget _wordBox(){
    if(searchHistory == null || searchHistory.length==0){
      return Container();
    }

    List<Widget> ret = searchHistory.map((item){
      return Container(
        margin: EdgeInsets.all(5),
        child: InkWell(
          onTap: (){
            setState(() {
              _controller.text = item;
            });
          },
          child: Chip(label: Text(item)),
        ),
      );
    }).toList();
    
    return Wrap(
      children: ret,
    );
    
  }
  
  

}
