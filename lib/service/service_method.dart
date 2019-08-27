import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future get() async {
//   var token;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   token = prefs.getString(token);
//   return token;
// }

Future requestPost(url, {token, formData}) async {
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
    
    dio.options.headers['token'] = token;
    if(formData == null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口报错');
    }
  } catch (e) {
    return print('Error: ==========>${e}');
  }
}

Future requestGet(url, {formData}) async {
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if(formData == null){
      response = await dio.get(servicePath[url]);
    }else{
      response = await dio.get(servicePath[url], queryParameters: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口报错');
    }
  } catch (e) {
    return print('Error: ==========>${e}');
  }
}

Future requestGetDetail(url,{id}) async{
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if(id == null){
      response = await dio.get(servicePath[url]);
    }else{
      response = await dio.get(servicePath[url]+'/${id}');
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口报错');
    }
  } catch (e) {
    return print('Error: ==========>${e}');
  }
}
