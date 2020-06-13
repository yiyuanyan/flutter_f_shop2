import 'package:flutter/material.dart';
import '../../../config/service_url.dart';
import '../../../provide/home/home_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EventsBannerWidget extends StatelessWidget {
  const EventsBannerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String events_banner = Provide.value<HomeProvide>(context).eventsBanner;
    return Container(
      child: Image.network(
        "${fileURL}${events_banner}",
        width: ScreenUtil().setWidth(375),
        height: ScreenUtil().setHeight(120),
      ),
    );
  }
}