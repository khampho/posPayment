import 'package:dio/dio.dart';
import 'package:pospayment/models/dailyIncomeModel.dart';
import 'package:pospayment/apiUrl/token.dart';

Future<DailyIncomeModel> getDailyIncome() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var daTa = await Dio().get('https://jsonkeeper.com/b/5J1L');
  DailyIncomeModel res = DailyIncomeModel.fromJson(daTa.data);
  // print(res);
  return res;
}
