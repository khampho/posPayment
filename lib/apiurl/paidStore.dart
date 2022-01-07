import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/models/paidStore.dart';

Dio dio = Dio();
get box => GetStorage();
getToken() async {
  String token = await box.read('token');
  return token;
}

Future<List<PaidStoreModel>> getPaidStore() async {
  String token = await getToken();
  dio.options.headers["Authorization"] = "Bearer $token";
  var daTa = await Dio().get('https://jsonkeeper.com/b/G4G1');
  List<PaidStoreModel> res = daTa.data
      .map<PaidStoreModel>((json) => PaidStoreModel.fromJson(json))
      .toList();
  // print(res);
  return res;
}