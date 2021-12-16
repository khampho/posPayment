import 'package:get_storage/get_storage.dart';

get box => GetStorage();
removeToken() async {
  await box.remove('token');
  await box.remove('user');
}
