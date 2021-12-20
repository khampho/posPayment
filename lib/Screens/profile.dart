import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/buttommenu/homebuttommenu.dart';
import 'package:pospayment/loginlogout/login.dart';
import 'package:pospayment/loginlogout/logout.dart';
import 'package:pospayment/models/callgetme.dart';
import 'package:pospayment/models/memodel.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
 dynamic data = GetStorage().read('user');

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນຜູ້ໃຊ້'),
        backgroundColor: Colors.tealAccent.shade400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
            child: FutureBuilder<Memodel>(
              future: getme(),
              builder: (_,snapshot){
                if(snapshot.hasData){
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/user_icon.png',
                        width: 120,
                      ),
                      AutoSizeText(
                        snapshot.data.firstName + "  " + snapshot.data.lastName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        maxLines: 2,
                      ),
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
                                  Text(
                                    snapshot.data.code,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
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
                                  Text(
                                    snapshot.data.mobile,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
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
                                  Text(
                                    snapshot.data.roleId.nameLa,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
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
                                    child: AutoSizeText(
                                      snapshot.data.address,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16),
                                      maxLines: 2,
                                    ),
                                  )
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeMenu()));
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            }
                          },
                          child: const Text('ອອກຈາກລະບົບ'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 70, bottom: 20),
                        child: Align(
                          child: Text(snapshot.data.marketId.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  );
                }else{
                  return const Text('waitting');
                }
              }
            ),
          ),
        ),
      ),
      backgroundColor: Colors.tealAccent.shade400,
    );
  }
}
