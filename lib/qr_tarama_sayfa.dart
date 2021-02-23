import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:qrcodescanner/hizmetler/reklam_hizmeti.dart';
import 'package:qrcodescanner/qr_tarama_sonuc_sayfa.dart';

class QRTaramaSayfa extends StatefulWidget {
  @override
  _QRTaramaSayfaState createState() => _QRTaramaSayfaState();
}

class _QRTaramaSayfaState extends State<QRTaramaSayfa> {
  Barcode result;

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final ReklamHizmet _reklamHizmet = ReklamHizmet();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _qrTarama(),
        ],
      ),
    );
  }

  Widget _qrTarama() {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    return Expanded(
      flex: 3,
      child: Container(
        child: QRView(
          key: qrKey,
          cameraFacing: CameraFacing.back,
          onQRViewCreated: _qrTaramaSonuc,
          formatsAllowed: [BarcodeFormat.qrcode],
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
        ),
      ),
    );
  }

  void _qrTaramaSonuc(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      controller.pauseCamera();
      Route r = MaterialPageRoute(
          builder: (context) => QRTaramaSonucSayfa(result),
          fullscreenDialog: false);
      Navigator.push(context, r).then((value) => controller.resumeCamera());
      _reklamHizmet.showIntersitial();
    });
  }
}
