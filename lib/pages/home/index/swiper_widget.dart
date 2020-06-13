import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterfshop/config/service_url.dart';
import 'package:provide/provide.dart';
import '../../../provide/home/home_provide.dart';


class SwiperWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //List<String> swipers = Provide.value<HomeProvide>(context).swipers;
    List<String> sw = Provide.value<HomeProvide>(context).swipers;
    return Container(
      height: ScreenUtil().setHeight(165),
      width: ScreenUtil().setWidth(375),
      child: Swiper(
        itemCount: sw.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              print("点击了${index}广告");
            },
            child: Image.network("${fileURL}${sw[index]}"),
          );
        },
      ),
    );
  }
}
