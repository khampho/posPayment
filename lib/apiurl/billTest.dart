import 'package:dio/dio.dart';
import 'package:pospayment/apiUrl/token.dart';
import 'package:pospayment/models/dailybillmodel.dart';

Future<DataModel> getBill() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var response = await Dio().get('https://jsonkeeper.com/b/N1ZL');
  DataModel items = DataModel.fromJson(response.data);
  //print(response);
  return items;
}