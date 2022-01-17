import 'package:pospayment/apiUrl/token.dart';
import 'api.dart';
import 'package:http/http.dart' as http;

getIncomeHistory() async {
  var client = http.Client();
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = dio.get(apiBaseUrl + "/api/income-history");
    print(response);
  } finally {
    client.close();
  }
}
