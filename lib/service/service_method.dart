import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routers/application.dart';
import 'dart:async';
import 'dart:io';

import '../config/service_url.dart';

Future requestPost(url, {formData, BuildContext context, token}) async {
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token == null) {
      dio.options.headers['token'] = prefs.getString('token');
    } else {
      dio.options.headers['token'] = token;
    }

    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      if (response.data['code'] == 8888) {
        Application.router.navigateTo(context, '/login',
            transition: TransitionType.inFromRight);
      } else {
        return response.data;
      }
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
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers['token'] = prefs.getString('token');
    
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
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

Future requestGetDetail(url, {id}) async {
  try {
    print('开始获取数据...........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (id == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url] + '/${id}');
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
