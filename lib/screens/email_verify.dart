import 'package:astronerds/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class emailVerify extends StatefulWidget {
  const emailVerify({Key? key}) : super(key: key);

  @override
  State<emailVerify> createState() => _emailVerifyState();
}

class _emailVerifyState extends State<emailVerify> {

  //Form key
  final formkey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController emailController = new TextEditingController();


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




    //Button
    final verifyButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(onPressed: () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); //pushreplacement doesnot copy previous page icons
        verify(emailController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())); //pushreplacement doesnot copy previous page icons
      },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
        minWidth: MediaQuery.of(context).size.width,

        child: Text("Verify Email",
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


                    verifyButton,
                    SizedBox(height: 25,),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  //verify function
  void verify(String email) async
  {
    await _auth.currentUser?.sendEmailVerification();

/*    _auth.sendSignInLinkToEmail(
      //email: "rocky_balboa@example.com",
      email: "abidurrahman780@gmail.com",
      actionCodeSettings: ActionCodeSettings(
          url: "https://example.page.link/cYk9",
          androidPackageName: "com.example.app",
          iOSBundleId: "com.example.app",
          handleCodeInApp: true,
          androidMinimumVersion: "16",
          androidInstallApp: true),
    );*/
  }
}