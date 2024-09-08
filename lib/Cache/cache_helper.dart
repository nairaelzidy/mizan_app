import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static initial () async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> saveData({required String key , required dynamic value}) async{
      if(value is String){
        return await sharedPreferences!.setString(key, value);
      }
      else if(value is bool){
        return await sharedPreferences!.setBool(key, value);
      }

      else if(value is double){
        return await sharedPreferences!.setDouble(key, value);
      }
      else {
        return await sharedPreferences!.setInt(key, value);
      }
  }

  static dynamic getData({required String key}){
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async{

    return await sharedPreferences!.remove(key);

  }

  static bool containKey({required String key}) {

    return  sharedPreferences!.containsKey(key);

  }

  static Future<bool> clear() async{

    return await sharedPreferences!.clear();

  }

}