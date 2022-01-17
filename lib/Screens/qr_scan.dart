import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr ສະແກນ'),
        backgroundColor: Colors.teal,
      ),
      body: Center(child: Expanded(flex: 6, child: _buildQrView(context))),
      // body: Column(
      //   children: <Widget>[
      //     Expanded(flex: 6, child: _buildQrView(context)),
      //     Expanded(
      //       flex: 1,
      //       child: FittedBox(
      //         fit: BoxFit.contain,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: <Widget>[
      //             if (result != null)
              
      //             Text(' Data: ${result.code}')
      //             else
      //               Text('Scan a code'),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  // _print() async {
  //   // Test regular text
  //   SunmiPrinter.text(
  //     'ໃບບິນ',
  //     styles: SunmiStyles(align: SunmiAlign.center),
  //   );

  //   SunmiPrinter.text(
  //     'ວັນທີ : 16/01/2022',
  //     styles: SunmiStyles(align: SunmiAlign.left),
  //   );
  //   SunmiPrinter.hr();
  //   SunmiPrinter.emptyLines(1);
  //   SunmiPrinter.row(
  //     cols: [
  //       SunmiCol(text: 'ລາຍການ', width: 6, align: SunmiAlign.left),
  //       SunmiCol(text: 'ຈຳນວນເງິນ', width: 6, align: SunmiAlign.right),
  //     ],
  //   );
  //   SunmiPrinter.text(result.code);
  //   SunmiPrinter.emptyLines(3);
  // }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 600.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10,
          borderLength: 40,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Get.toNamed('/dailyBill',arguments: result.code);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
