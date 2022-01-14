import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiUrl/api.dart';
import 'package:http/http.dart' as http;
import 'memodel.dart';

final boxx = GetStorage();

Dio dio = Dio();
getToken() async {
  String token = await boxx.read('token');
  return token;
}

Future<Memodel> getProfile() async {
  var client = http.Client();
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(apiBaseUrl + "/api/me");
    var data = response.data['data'];
    Memodel res = Memodel.fromJson(data);
    await boxx.write('user', res);
    //print(res.marketId.name);
    return res;
  } finally {
    client.close();
  }
}
