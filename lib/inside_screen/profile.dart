import 'package:astronerds/model/user_model.dart';
import 'package:astronerds/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text("Hello AstroNerd!", style: TextStyle(color: Colors.white),),
        //centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SizedBox(
                height: 350,
                child: Image.asset("assets/logo.png",fit: BoxFit.contain),

              ),
              Text("Welcome Back!!!", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstname} ${loggedInUser.lastname}",
                  style: TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.w500
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.w500
                  )),

              SizedBox(height: 15,),

              ActionChip(label: Text("Logout"),onPressed: (){
                logout(context);
              })

            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
