
import 'package:get_storage/get_storage.dart';
import 'memodel.dart';
dynamic data = GetStorage().read('user');
Future<Memodel>getme() async {
  Memodel items = Memodel.fromJson(data);
  //print(items.roleId.nameLa);
  return items;
}