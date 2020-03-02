import 'dart:async';
import 'package:dio/dio.dart';


class DioUtil{

  static Dio dio;

  ///Get请求测试
  Future getHttp(String url) async {
    try {
      Response response = await Dio().get(url);
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

    ///Post请求测试
  Future postHttp(String url,Map parameters) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    print(url);
    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, data: parameters);
      var result = response.data;
      if (response.statusCode == 200) {
        return result;
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      print('请求出错：' + e.toString());
    }
  }

  Future<Map> requestHttp(String url,Map parameters,String method) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    Dio dio = createInstance();
    //请求结果
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        return result;
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
    }
    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.plain,
        // validateStatus: (status) {
        //   // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        //   return true;
        // },
        baseUrl: "",
      );
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }


}