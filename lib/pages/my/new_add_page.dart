import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';

class NewAddPage extends StatefulWidget {
  final String user_id;

  const NewAddPage({Key key, this.user_id}) : super(key: key);

  @override
  _NewAddPageState createState() => _NewAddPageState();
}

//class _NewAddPageState extends State<NewAddPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}



class _NewAddPageState extends State<NewAddPage> {
  String _nameText;
  String _phoneText;
  String _addText;
  String shi;  //选择城市
  String qu;   //选择区县
  //收货人控制器
  TextEditingController _nameTextEditingController = TextEditingController();
  //手机号码控制器
  TextEditingController _phoneTextEditingController = TextEditingController();
  //收货地址

  //详细地址控制器
  TextEditingController _addTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FocusNode blankNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.grey[600],
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "新增收货地址",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: _addInfoInputView(context),
      ),
    );
  }

  Widget _addInfoInputView(BuildContext context){
    return Container(
      color: Colors.white,
      child: Column(

        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(553.9),
            child: ListView.separated(
              itemBuilder: (BuildContext context, index){
                return _inputItems(context, index);
              },
              separatorBuilder: (BuildContext context, index){
                return Container(height: 1, color: Colors.grey[300],);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10), top: ScreenUtil().setHeight(5)),
              
            ),
          ),
          submitButton(context),
        ],
      ),
    );
  }
  Widget _inputItems(BuildContext context, int index){

    switch(index){
      case 0:
        return Container(
          height: ScreenUtil().setHeight(45),
          //color: Colors.blue,
          child: Row(
            children: <Widget>[
              Text(
                "收货人:",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(25),),
              //输入框
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _nameTextEditingController,
                  textCapitalization: TextCapitalization.none,
                  //键盘类型
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //内容的内边距
                    contentPadding: EdgeInsets.all(10.0),
                    //提示文本
                    //labelText: '请输入你的用户名',
                      hintText: '请输入您的用户名',
                    //取消下边框
                    border: InputBorder.none
                  ),
                  //键盘插件按钮样式
                  textInputAction: TextInputAction.go,
                ),
              ),
            ],
          ),
        );
        break;
      case 1:
        return Container(
          height: ScreenUtil().setHeight(45),
          child: Row(
            children: <Widget>[
              Text(
                "手机号码：",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _phoneTextEditingController,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "输入手机号码",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      case 2:
        return Container(
          height: ScreenUtil().setHeight(45),
          child: Row(
            children: <Widget>[
              Text(
                "收货地区：",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(8),),
              Expanded(
                flex: 1,
                child: DropdownButton(
                    value: this.shi,
                    icon: Icon(Icons.arrow_right), iconSize: 40, iconEnabledColor: Colors.grey[400],
                    hint: Text('请选择城市'), isExpanded: true, underline: Container(height: 1, color: Colors.grey[400]),
                    items: [
                      DropdownMenuItem(
                        value: "北京市",
                        child: Center(
                          child: Text(
                            "北京市",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "上海市",
                        child: Center(
                          child: Text(
                            "上海市",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "天津市",
                        child: Center(
                          child: Text(
                            "天津市",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                    onChanged:(value) {
                      setState(() {
                        this.shi = value;
                      });
                    }
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(20),),
              Expanded(
                flex: 1,
                child: DropdownButton(
                  value: this.qu,
                    icon: Icon(Icons.arrow_right), iconSize: 40, iconEnabledColor: Colors.grey[400],
                    hint: Text('请选择地区'), isExpanded: true, underline: Container(height: 1, color: Colors.grey[400]),
                    items: [
                      DropdownMenuItem(
                        value: "海淀区",
                        child: Center(
                          child: Text(
                            "海淀区",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "朝阳区",
                        child: Center(
                          child: Text(
                            "朝阳区",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "通州区",
                        child: Center(
                          child: Text(
                            "通州区",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                    onChanged:(value){
                    setState(() {
                      this.qu = value;
                    });
                      print(value);
                    },
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(40),),
            ],
          ),
        );
        break;
      case 3:
        return Container(
          height: ScreenUtil().setHeight(45),
          child: Row(
            children: <Widget>[
              Text(
                "详细地址：",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _addTextEditingController,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "输入详细地址",
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        );
        break;
    }

  }
  //确定按钮
  Widget submitButton(BuildContext context){
    return InkWell(
      onTap: (){
        //Application.router.navigateTo(context, "/newAdd?user_id=1");
        print("点击了确定按钮");
        print(this._addTextEditingController.text);
      },
      child: Container(
        height: ScreenUtil().setHeight(35),
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            "确认",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
