import 'package:flutter/material.dart';
import 'package:pospayment/Screens/profile.dart';
import 'package:pospayment/buttommenu/homebuttommenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(box.read('M_name')),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.person,color: Colors.white, size: 50),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Profile();
                }));

              });
            },
          ),
        ],
      ),
      body: const HomeMenu(),
    );
  }
}
