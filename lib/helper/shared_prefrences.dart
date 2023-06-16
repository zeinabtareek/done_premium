import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth_screen/model/user_model.dart';



class CacheHelper{
  static SharedPreferences? prefereces  ;
  static User? loginShared;

  static init()async{
    prefereces=await SharedPreferences.getInstance();
    if (getData(key:"user") != null && getData(key: "user") != 'null') {
      loginShared = User.fromJson(jsonDecode(getData(key:"user")));
    }
  }
  static dynamic getData({required String key}){
    return prefereces!.get(key);
  }
  static Future<bool>saveData({
    required String key,
    required   value
  })async {
    if(value is String )return await prefereces!.setString(key, value);
    if(value is int )return await prefereces!.setInt(key, value);
    if(value is bool )return await prefereces!.setBool(key, value);
    if(value is List<String> )return await prefereces!.setStringList(key,  value);
    return await prefereces!.setDouble(key, value);
  }

  static Future<bool>clearData(){return prefereces!.clear();}
  static Future<bool>removeData({required key}){
    return prefereces!.remove(key);
  }

}