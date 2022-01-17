import 'package:dio/dio.dart';
import 'package:pospayment/apiUrl/api.dart';
import 'package:http/http.dart' as http;
import '../models/memodel.dart';
import 'package:pospayment/apiUrl/token.dart';

Future<Memodel> getProfile() async {
  var client = http.Client();
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(apiBaseUrl + "/api/me");
    var data = response.data['data'];
    Memodel res = Memodel.fromJson(data);
    await box.write('user', res);
    //print(res.marketId.name);
    return res;
  } finally {
    client.close();
  }
}
