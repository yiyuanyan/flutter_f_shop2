import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

//收取数据
Future request(url, {formData}) async{
  try{
    print("开始请求数据:${url}->formData:${formData}");
    Response response;
    Dio dio = new Dio();
    dio.options.responseType = ResponseType.json;
    if(formData == null){
      response = await dio.post(servicePATH[url]);
    }else{
      String uri = servicePATH[url]+"/"+formData;
      print("访问地址:"+uri);
      response = await dio.post(uri);
    }
    if(response.statusCode == 200){
      print("数据请求成功:${url}->状态码:${response.statusCode}");
      return response.data;
    }else{
      return print("后台接口异常:${url}->data:${formData}");
    }
  }catch(e){
    return print("ERROR:---------->${e}");
  }
}