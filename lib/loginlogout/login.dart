import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiUrl/api.dart';
import 'package:pospayment/bottomMenu/homeBottomMenu.dart';
import 'package:pospayment/models/memodel.dart';
import 'package:pospayment/apiUrl/profile.dart';
import 'logout.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final box = GetStorage();
  Future<dynamic> createLoginModel() async {
    var client = http.Client();
    try {
      var rs = await client.post(Uri.parse(apiBaseUrl + '/app/login'),
          // headers: <String, String>{
          //   'Content-Type': 'application/json; charset=UTF-8',
          // },
          // body: jsonEncode(
          //     <String, String>{'email': email.text, 'password': password.text}),
          body: {'email': email.text, 'password': password.text});
      //print('Response status: ${rs.statusCode}');
      //print('Response body: ${rs.body}');
      if (rs.statusCode == 200) {
        Map<String, dynamic> res =
            Map<String, dynamic>.from(jsonDecode(rs.body));
        await box.write('token', res['data']['token']);
        //print(res['data']['token']);
        //return token;
      }
    } finally {
      client.close();
    }
  }

  onPressLogin() async {
    if (_formKey.currentState.validate()) {
      await createLoginModel();
      if (box.hasData('token')) {
        await getProfile();
        if (box.hasData('user')) {
          Memodel role = box.read('user');
          if (role.roleId.role == 3) {
            print(role.roleId.role);
            //Navigator.pushNamed(context, '/home');
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeMenu(),
            ));
          } else {
            await removeToken();
            print('role != 3');
            Login();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Text(
                          'InfraSol - POS Staff',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'null';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: email,
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'ອີເມລ',
                                        labelStyle: const TextStyle(
                                            color: Colors.green),
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          color: Colors.green,
                                          size: 20.0,
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'null';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: password,
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'ລະຫັດຜ່ານ',
                                        labelStyle: const TextStyle(
                                            color: Colors.green),
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Colors.green,
                                          size: 20.0,
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 250,
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ElevatedButton(
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        primary: Colors.white,
                                        backgroundColor: Colors.green,
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Colors.lightGreen))),
                                    onPressed: () {
                                      onPressLogin();
                                    },
                                    child: const Text('ເຂົ້າສູ່ລະບົບ'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
      backgroundColor: Colors.tealAccent.shade400,
    );
  }
}
