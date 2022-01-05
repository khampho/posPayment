import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/models/dailyIncomeModel.dart';

Dio dio = Dio();
get box => GetStorage();
getToken() async {
  String token = await box.read('token');
  return token;
}

Future<DailyIncomeModel> getDailyIncome() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var daTa = await Dio().get('https://jsonkeeper.com/b/5J1L');
  DailyIncomeModel res = DailyIncomeModel.fromJson(daTa.data);
  // print(res);
  return res;
}
