import 'package:flutter/material.dart';
import 'package:flutterfshop/pages/widgets/cell_header_widget.dart';
import 'package:flutterfshop/pages/widgets/cell_item_normal_widget.dart';
import '../../../model/location_model.dart';
class ListViewNearby extends StatelessWidget {
  final String headerTitle;
  final List<Nearby> nearby;
  const ListViewNearby({Key key, this.headerTitle="附近地址", @required this.nearby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CellHeaderWidget(title: this.headerTitle,),
          Column(
            children: _cellItems(),
          ),
        ],
      ),
    );
  }
  List<Widget> _cellItems(){
    List<Widget> items = this.nearby.map((e){
      return CellItemNormalWidget(title: e.communityName);
    }).toList();
    return items;
    
  }
}