import 'dart:async';

import 'package:draggable_floating_button/draggable_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodescanner/hizmetler/reklam_hizmeti.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRTaramaSonucSayfa extends StatefulWidget {
  Barcode result;

  QRTaramaSonucSayfa(this.result);
  @override
  _QRTaramaSonucSayfaState createState() => _QRTaramaSonucSayfaState();
}

class _QRTaramaSonucSayfaState extends State<QRTaramaSonucSayfa> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  Barcode result;
  final ReklamHizmet _reklamHizmet = ReklamHizmet();

  @override
  void initState() {
    result = widget.result;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 24.0, bottom: 0, left: 8, right: 8),
            child: WebView(
              initialUrl: result.code,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          ),
          DraggableFloatingActionButton(
            elevation: 6,
            offset: new Offset(730, 1145),
            backgroundColor: Color(0xFFFD9515c),
            child: new Icon(
              Icons.qr_code_scanner,
              size: 40,
            ),
            onPressed: () {
              _reklamHizmet.showIntersitial();
              Navigator.pop(context);
            },
            appContext: context,
          ),
        ],
      ),
    );
  }
}
