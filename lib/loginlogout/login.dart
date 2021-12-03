import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiurl/api.dart';
import 'package:pospayment/models/profile.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required String title}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<dynamic> createLoginModel() async {
    try {
      var rs = await http.post(
        Uri.parse(apiBaseUrl + '/app/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'email': email.text, 'password': password.text}),
      );
      Map<String, dynamic> res = Map<String, dynamic>.from(jsonDecode(rs.body));
      return res;
    } catch (e) {
      //print(e);
      return e;
    }
  }

  final box = GetStorage();
  getToken() async {
    var token = await createLoginModel();
    await box.write('token', token['data']['token']);
    // print(box.read('token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF1F8E9), // Selects a mid-range green.
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                'assets/images/infrasol_logo.jpg',
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ກະລຸນາປ້ອນອີເມວ!';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.lightGreen,
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  labelText: 'ອີເມລ',
                                  labelStyle:
                                      const TextStyle(color: Colors.green),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                )),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ!';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: password,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.lightGreen,
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  labelText: 'ລະຫັດຜ່ານ',
                                  labelStyle:
                                      const TextStyle(color: Colors.green),
                                  prefixIcon: const Icon(
                                    Icons.password_outlined,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                )),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Colors.white,
                                  backgroundColor: Colors.lightGreen,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: const BorderSide(
                                          color: Colors.lightGreen))),
                              onPressed: () async {
                                await getToken();
                                if (_formKey.currentState!.validate()) {
                                  if (box.hasData('token')) {
                                    await profile();
                                    await Navigator.pushNamed(
                                        context, '/HomeScreen');
                                  } else {
                                    Navigator.pushNamed(context, '/');
                                  }
                                }
                              },
                              child: const Text('ເຂົ້າສູ່ລະບົບ'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Power By: Infrasol",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ])),
      ),
    );
  }
}
