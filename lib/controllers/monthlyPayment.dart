import 'package:get/get.dart';
import 'package:pospayment/apiurl/monthlyIncome.dart';
import 'package:pospayment/models/monthlyPaymentModel.dart';

class RoomNameController extends GetxController {
  List<MonthlyPaymentModel> roomName = List<MonthlyPaymentModel>();

  getRoomName() async {
    var rooms = await getMonthlyPayment();
    //print(rooms.length);
    roomName = rooms;
    update();
  }
}
