import 'package:astronerds/screens/home.dart';
import 'package:astronerds/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
//  await dotenv.load(fileName: ".env"); //chatgpt -> cg


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var isLogin = false;
  var auth = FirebaseAuth.instance;
  checkIfLogin() async{
    auth.authStateChanges().listen((User? user) {
      if(user!=null && mounted){
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASTRONERDS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: isLogin ? homeScreen() : LoginScreen(),
    );
  }
}
