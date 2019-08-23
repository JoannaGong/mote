import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future requestPost(url, {formData}) async {
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
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
