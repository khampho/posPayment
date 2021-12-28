
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/models/profile.dart';
import 'memodel.dart';


class CounterController extends GetxController {
   Rx<Memodel> users = Rx<Memodel>();
   getData() async{
      Memodel userdata = await getProfile();
      users.value = userdata;
      update();
   }

}



