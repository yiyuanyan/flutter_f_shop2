import 'package:flutter/material.dart';
import '../../../model/location_model.dart';
import 'package:flutterfshop/pages/widgets/cell_header_widget.dart';
import 'package:flutterfshop/provide/location/location_provide.dart';
import 'package:provide/provide.dart';
class ListViewMyAddress extends StatelessWidget {
  final String headerTitle;
  final String address;  //收货地址
  final String contacts; //联系人
  const ListViewMyAddress({Key key,this.headerTitle="我的收货地址", this.address, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ReceivingAdd> receivingAdd = Provide.value<LocationProvide>(context).receivingAdd;
    return Container(
      child: Column(
        children: <Widget>[
          CellHeaderWidget(title: this.headerTitle,),
          Container(
            child: Column(
              children: _listTiles(receivingAdd),
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> _listTiles(List<ReceivingAdd> receivingAdd){
    List<Widget> items = receivingAdd.map((e){
      return ListTile(
        onTap: (){
          print(e.id);
        },
        dense: true,
        title: Text(
          e.myAdd,
        ),
        subtitle: Text(
          e.contact + " " + e.telephone,
        ),
      );
    }).toList();
    return items;
  }
}