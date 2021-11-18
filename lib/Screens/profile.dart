import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/loginlogout/login.dart';
import 'package:pospayment/loginlogout/logout.dart';
import 'homescreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
get box => GetStorage();
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນຜູ້ໃຊ້'),
        backgroundColor: Colors.green,
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
                Image.asset('assets/images/user_icon.png', width: 120,),

               Text(box.read('P_fname') +" "+ box.read('P_lname') , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin:  const EdgeInsetsDirectional.only(top: 7.0,start: 1.0, end: 1.0),
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
                      const Icon(Icons.security,
                        color: Colors.grey,
                        size: 30.0,),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ລະຫັດ :',
                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 16),
                        child: Column(
                          children:  <Widget>[
                            Text(box.read('P_id'),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

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
                      const Icon(Icons.phone,
                        color: Colors.grey,
                        size: 30.0,),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ເບີີໂທ :',
                            style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                        child: Column(
                          children:  <Widget>[
                            Text(box.read('p_mobile'),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
                      const Icon(Icons.commute_outlined,
                        color: Colors.grey,
                        size: 30.0,),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ຕໍາແໜ່ງ :',
                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                        child: Column(
                          children:  <Widget>[
                            Text(box.read('P_role'),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

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
                      const Icon(Icons.map,
                        color: Colors.grey,
                        size: 30.0,),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 8, 16),
                        child: Text(
                          'ທີ່ຢູ່ :',
                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                        child: Column(
                          children:  <Widget>[
                            Text( box.read('P_address'),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.orangeAccent))),
                      onPressed: () async {
                        await removeToken();
                        if (box.hasData('token') == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login(
                                  title: 'login',
                                )),
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                              const HomeScreen()
                          ));
                        }
                      },
                    child: const Text('ອອກຈາກລະບົບ'),
                  ),
                ),
               Container(
                 padding: const EdgeInsets.only(top: 40,bottom: 20),
                 child:   Align(
                   child: Text(
                       box.read('M_name'),
                       style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                   ),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

