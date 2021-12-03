import 'package:get_storage/get_storage.dart';

get box => GetStorage();
removeToken() async {
  await box.remove('token');
  await box.remove('P_id');
  await box.remove('P_fname');
  await box.remove('P_lname');
  await box.remove('P_role');
  await box.remove('p_mobile');
  await box.remove('P_address');
  await box.remove('M_logo');
  await box.remove('M_name');
  await box.remove('M_code');
}
