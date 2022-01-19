import 'package:pospayment/apiUrl/token.dart';
import 'package:pospayment/models/monthlyPaymentModel.dart';

Future<List<MonthlyPaymentModel>> getMonthlyPayment() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  final response = await dio.get('https://jsonkeeper.com/b/BXSA');
  List<MonthlyPaymentModel> res = response.data
      .map<MonthlyPaymentModel>((json) => MonthlyPaymentModel.fromJson(json))
      .toList();
  return res;
}
