import 'package:get/get.dart';
import 'package:pospayment/apiUrl/profile.dart';
import '../models/memodel.dart';

class CounterController extends GetxController {
  Rx<Memodel> users = Rx<Memodel>();
  getData() async {
    Memodel userdata = await getProfile();
    //print(userdata.marketId.name);
    users.value = userdata;
    update();
  }
}
