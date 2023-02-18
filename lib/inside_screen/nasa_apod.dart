import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NasaAPOD extends StatefulWidget {
  const NasaAPOD({Key? key}) : super(key: key);

  @override
  State<NasaAPOD> createState() => _NasaAPODState();
}

class _NasaAPODState extends State<NasaAPOD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: WebView(
          initialUrl: "https://apod.nasa.gov/apod/astropix.html",
          javascriptMode: JavascriptMode.unrestricted,
        ),

      ),
    );
  }
}
