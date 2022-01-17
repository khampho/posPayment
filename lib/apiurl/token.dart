import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Dio dio = Dio();
get box => GetStorage();

getToken() async {
  String token = await box.read('token');
  return token;
}