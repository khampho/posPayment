import 'package:flutter/material.dart';

import 'outstanding_report_day.dart';
import 'outstanding_report_month.dart';
class OutStanding extends StatefulWidget {
  const OutStanding({Key? key}) : super(key: key);

  @override
  _OutStandingState createState() => _OutStandingState();
}

class _OutStandingState extends State<OutStanding> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('ລາຍງານການຖອກຊຳລະ'),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('ລາຍວັນ',style: TextStyle(fontSize: 18,),)),
              Tab(child: Text('ລາຍເດືອນ',style: TextStyle(fontSize: 18),)),
            ],
          ),
        ),
        body:  const TabBarView(
          children: <Widget>[
            OutstandingReportOfDay(),
            OutStandingReportOfMonth(),

          ],
        ),
      ),
    );
  }
}
