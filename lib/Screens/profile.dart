import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pospayment/loginlogout/logout.dart';
import 'package:pospayment/controllers/callgetme.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.users.value.marketId.name)),
        backgroundColor: Colors.tealAccent.shade400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/user_icon.png',
                  width: 120,
                ),
                Obx(() => AutoSizeText(
                      controller.users.value.firstName +
                          "  " +
                          controller.users.value.lastName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 2,
                    )),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      top: 7.0, start: 1.0, end: 1.0),
                  height: 2.0,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.security,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ລະຫັດ :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => Text(
                                controller.users.value.code.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ເບີີໂທ :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => Text(
                                controller.users.value.mobile.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.commute_outlined,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ຕໍາແໜ່ງ :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => Text(
                                controller.users.value.roleId.nameLa.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.map,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ທີ່ຢູ່ :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(34.0, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                                width: 170,
                                child: Obx(
                                  () => AutoSizeText(
                                    controller.users.value.address.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    maxLines: 2,
                                  ),
                                )),
                            //Text( box.read('P_address'),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side:
                                const BorderSide(color: Colors.orangeAccent))),
                    onPressed: () async {
                      await removeToken();
                      if (box.hasData('token')) {
                        Get.toNamed('/home');
                      } else {
                        Get.toNamed('/login');
                      }
                    },
                    child: const Text('ອອກຈາກລະບົບ'),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 70, bottom: 20),
                    child: Align(
                      child: Obx(
                        () => Text(
                            controller.users.value.marketId.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.tealAccent.shade400,
    );
  }
}
