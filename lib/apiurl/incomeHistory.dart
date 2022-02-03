import 'package:dio/dio.dart';
import 'package:pospayment/apiUrl/api.dart';
import 'package:http/http.dart' as http;
import 'package:pospayment/apiUrl/token.dart';
import 'package:pospayment/models/incomHistoryModel.dart';

Future<List<IncomeHistory>> getIncomeHistory() async {

  var client = http.Client();
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(apiBaseUrl + "/api/income-history");
    var data = response.data['data'];
    List<IncomeHistory> res = data.map<IncomeHistory>((json) => IncomeHistory.fromJson(json))
      .toList();
    return res;
  } finally {
    client.close();
  }
}
