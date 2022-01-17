import 'package:pospayment/apiUrl/token.dart';
import 'package:pospayment/models/paidStore.dart';

Future<List<PaidStoreModel>> getPaidStore() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var daTa = await dio.get('https://jsonkeeper.com/b/G4G1');
  List<PaidStoreModel> res = daTa.data
      .map<PaidStoreModel>((json) => PaidStoreModel.fromJson(json))
      .toList();
  // print(res);
  return res;
}
