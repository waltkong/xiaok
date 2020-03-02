import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xiaokmusic/apis/music_api.dart';

class BannerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BannerComponentBox();
  }
}


class BannerComponentBox extends StatefulWidget {
  @override
  _BannerComponentBoxState createState() => _BannerComponentBoxState();
}


class _BannerComponentBoxState extends State<BannerComponentBox> {

  static List list;

  @override
  void initState() {
    super.initState();

    if(list == null){
      list = [];
      getList();
    }

  }

  void getList() async{
    var _data = await MusicApi().bannerList();
    setState(() {
      list = _data['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      width: ScreenUtil().setWidth(730),
      height: ScreenUtil().setHeight(230),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Swiper(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
          return Image.network(
            list[index]['image'],
            width: ScreenUtil().setWidth(730),
            height: ScreenUtil().setHeight(230),
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

}

