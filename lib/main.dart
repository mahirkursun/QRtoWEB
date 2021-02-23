import 'package:flutter/material.dart';
import 'package:qrcodescanner/qr_tarama_sayfa.dart';

void main() {
  runApp(QRApp());
}

class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRtoWEB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRTaramaSayfa(),
    );
  }
}
