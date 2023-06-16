 import 'package:dio/dio.dart';
import 'package:done_premium/helper/shared_prefrences.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static String? restaurantName;
  static String? restaurantBranchName;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://baloons.arrowscars.com/api/dashboard/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            "resturant": "y7b42yskv43l_bab_amman",
          }),
    );
  }

  static Future<Response> getData({
    @required String? url,
    dynamic query,
    String? token,
  }) async {
    final translateName =
        await CacheHelper.getData(key: "localeIsArabic");
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': translateName ? 'ar' : "en",
      'resturant': 'y7b42yskv43l_bab_amman',
      // 'resturant': restaurantName,
      'Authorization': token == null ? "" : 'Bearer $token',
    };

    return await dio!.get(
      url ?? "",
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'resturant': 'y7b42yskv43l_bab_amman',
      'Authorization': token == null ? "" : 'Bearer $token',
    };
    return await dio!.post(
      url ?? "",
      queryParameters: query,
      data: data,
    );
  }
}
