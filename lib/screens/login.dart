import 'dart:async';

import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/screens/admin_dashboard.dart';
import 'package:astronerds/screens/home.dart';
import 'package:astronerds/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Form key
  final formkey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  //firebase
  final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      //validator: (){},
      validator: (value)
      {
        if(value!.isEmpty){
          return ("Please Enter Your Email");
        }
        //regex expression for email validation
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return ("Please Enter a Valid Email.");
        }
        return null;
      },


      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      //validator: (){},
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty)
        {
          return ("Password is required for login");
        }
        if(!regex.hasMatch(value))
        {
          return ("Enter Minimum 6 characters)");
        }
      },



      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //Button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(onPressed: () {
          //loading animation
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator(),);
        },
        );
        
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); //pushreplacement doesnot copy previous page icons
        signIn(emailController.text, passwordController.text);
        
        // pop the loading animation
        Navigator.of(context).pop();
      },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
        minWidth: MediaQuery.of(context).size.width,

        child: Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[


                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/astrologo.png",fit: BoxFit.contain,),
                    ),

                    Text("AstroNerds",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold),),

                    SizedBox(height: 10,),

                    Text("Explore the Universe",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w300,fontFamily: 'Cursive')),

                    SizedBox(height: 45,),

                    emailField,
                    SizedBox(height: 25,),

                    passwordField,
                    SizedBox(height: 35,),

                    loginButton,
                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: (){
                            CircularProgressIndicator();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          },
                          child: Text(" Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }





  //route
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  adminScreen(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  homeScreen(),
            ),
          );
        }
      } else {
        //print('Document does not exist on the database');
        Fluttertoast.showToast(msg: "Document does not exist on the database");
        /*
        Alert(
            context: context,
            title: "Failed Login",
            desc: "Incorrect Email Or Password.")
            .show();
        */
      }
    });
  }





  // login
  void signIn(String email, String password) async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          //print('No user found for that email.');
          Fluttertoast.showToast(msg: 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          //print('Wrong password provided for that user.');
          Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
        }
      }
    }
  }




  //login function
  /*
  void signIN(String email, String password) async
  {
    if(formkey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()))

      }).catchError((e){
        Fluttertoast.showToast(msg: e);
      });
    }
  }
  */
}


