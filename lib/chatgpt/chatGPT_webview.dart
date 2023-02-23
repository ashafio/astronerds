import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class chatGPTweb extends StatefulWidget {
  const chatGPTweb({Key? key}) : super(key: key);

  @override
  State<chatGPTweb> createState() => _chatGPTwebState();
}

class _chatGPTwebState extends State<chatGPTweb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: WebView(
          initialUrl: "https://chat.openai.com/auth/login",
          javascriptMode: JavascriptMode.unrestricted,
        ),

      ),
    );
  }
}
