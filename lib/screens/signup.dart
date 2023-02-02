//import 'dart:js';

import 'package:astronerds/model/user_model.dart';
import 'package:astronerds/screens/email_verify.dart';
import 'package:astronerds/screens/login.dart';
import 'package:astronerds/screens/reset_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final firstnameEditingController = new TextEditingController();
  final lastnameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnameEditingController,
      keyboardType: TextInputType.name,
      //validator: (){},

        validator: (value){
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty)
          {
            return ("Firstname can not be empty");
          }
          if(!regex.hasMatch(value))
          {
            return ("Enter Minimum 3 characters)");
          }
        },

      onSaved: (value){
        firstnameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );




    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      keyboardType: TextInputType.name,
      //validator: (){},

      validator: (value){
       // RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty)
        {
          return ("Lastname can not be empty");
        }
        /*
          validator: (value){
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty)
          {
            return ("Firstname can not be empty");
          }
          if(!regex.hasMatch(value))
          {
            return ("Enter Minimum 3 characters)");
          }
        },
        * */
        return null;
      },

      onSaved: (value){
        lastnameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text=value!;
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


    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,

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
        passwordEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      //validator: (){},

      validator: (value){
        if(confirmpasswordEditingController.text != passwordEditingController.text)
          {
            return "Password doesn't match";
          }
        return null;
      },


      onSaved: (value){
        confirmpasswordEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(onPressed: () {  },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
        minWidth: MediaQuery.of(context).size.width,

        child: MaterialButton(onPressed: () {
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); //pushreplacement doesnot copy previous page icons
          signUp(emailEditingController.text, passwordEditingController.text);

        },

        child: Text("Signup",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    ));


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          Navigator.of(context).pop();
        },
          icon: Icon(Icons.arrow_back,color: Colors.black,),

        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[

                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/astrologo.png",fit: BoxFit.contain,),
                    ),


                    SizedBox(height: 10,),
                    firstnameField,
                    SizedBox(height: 20,),
                    lastnameField,
                    SizedBox(height: 20,),
                    emailField,
                    SizedBox(height: 20,),
                    passwordField,
                    SizedBox(height: 20,),
                    confirmPasswordField,
                    SizedBox(height: 20,),
                    signupButton,
                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                        )
                      ],
                    ),

                    TextButton(
                      child: Text('Forgot Password?'),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }






  void signUp(String email, String password) async
  {
    if(_formKey.currentState!.validate())
      {
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
          postDetailsToFirestore()
        }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });
      }
  }

  postDetailsToFirestore() async
  {
    // call firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // call usermodel
    UserModel userModel = UserModel();

    //send value
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstnameEditingController.text;
    userModel.lastname = lastnameEditingController.text;
    userModel.role = "user";

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully.");

    //Navigator.pushAndRemoveUntil(context as BuildContext, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    Navigator.pushAndRemoveUntil(context as BuildContext, MaterialPageRoute(builder: (context) => emailVerify()), (route) => false);

  }

}
