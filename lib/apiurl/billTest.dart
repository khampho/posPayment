import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/models/dailybillmodel.dart';
Dio dio = Dio();
get box => GetStorage();
getToken() async {
  String token = await box.read('token');
  return token;
}
Future<DataModel> getBill() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var response = await Dio().get('https://jsonkeeper.com/b/N1ZL');
  DataModel items = DataModel.fromJson(response.data);
  //print(response);
  return items;
}