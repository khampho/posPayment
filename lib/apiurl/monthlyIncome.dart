import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/models/monthlyPaymentModel.dart';

get dio => Dio();
get box => GetStorage();
getToken() async {
  String token = await box.read('token');
  return token;
}

Future<List<MonthlyPaymentModel>> getMonthlyPayment() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  final daTa = await dio.get('https://jsonkeeper.com/b/AKBF');
  List<MonthlyPaymentModel> res = daTa.data
      .map<MonthlyPaymentModel>((json) => MonthlyPaymentModel.fromJson(json))
      .toList();
  return res;
}
