
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'memodel.dart';


class CounterController extends GetxController {
   Rx<Memodel> users = Rx<Memodel>();
   getData(){
      var userdata =  GetStorage().read('user');
      Memodel res = Memodel.fromJson(userdata);
      users.value = res;
      update();
   }

}



