import 'dart:io';

import 'package:astronerds/inside_screen/ask_a_question.dart';
import 'package:astronerds/model/user_model.dart';
import 'package:astronerds/screens/admin_dashboard.dart';
import 'package:astronerds/screens/home.dart';
import 'package:astronerds/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  XFile? imgFile;
  final ImagePicker imagePicker = ImagePicker();
  late File displayIMG;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });
  }


  GetImageFromGallery() async
  {
    var imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imgFile;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
          Navigator.pop(context);
        },),
        //title: Text(null),
        backgroundColor: Colors.black, // appbar color.
        foregroundColor: Colors.white, // appbar text color.


        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.home,color: Colors.white,size: 35,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.notifications_active,color: Colors.white,size: 35,),
              onPressed: () {
                //                Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 35,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AskaQuestionScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.search_rounded,color: Colors.white,size: 35,),
              onPressed: () {
                //                Navigator.push(context, MaterialPageRoute(builder: (context) => AskaQuestionScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: IconButton(
              icon: Icon(Icons.person_2_rounded,color: Colors.white,size: 35,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));

              },
            ),
          ),
          // add more IconButton
        ],
      ),



      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [

              GestureDetector(
                onTap: ()
                {
                  GetImageFromGallery();
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.2,
                  backgroundColor: Colors.black,
                  backgroundImage: imgFile == null ? null : FileImage(
                      displayIMG = File(imgFile!.path),
                  ),
                  child: imgFile == null ? Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width*0.1,
                  ): null ,
                ),
              ),




              //const Text("Welcome Back!!!", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstname} ${loggedInUser.lastname}",
                  style: const TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.w500
                  )),
              Text("${loggedInUser.email}",
                  style: const TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.w500
                  )),

              const SizedBox(height: 15,),

              ActionChip(label: const Text("Logout"),onPressed: (){
                logout(context);
              }),
              //Visibility(child: Text("Admin Panel"),)


              TextButton(
                child: const Text('User Info'),
                onPressed: () {
                  isAdmin();
                },
              ),


            ],
          ),
        ),
      ),
    );
  }


  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
    //Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) =>
            new LoginScreen()),
            (route) => false);
  }

  //late bool _showButton;
  isAdmin() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const adminScreen()),);
          /*
          return TextButton(
              child: const Text('See Admin Dashboard'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const adminScreen()),);
              }
          );
           */
          return Fluttertoast.showToast(msg: "Logged in as ${loggedInUser.firstname} ${loggedInUser.lastname}. Redirecting to Admin Dashboard");

        } else {
          return Fluttertoast.showToast(msg: "Logged in as ${loggedInUser.firstname} ${loggedInUser.lastname}.");
        }
      } else {
        return Fluttertoast.showToast(msg: "Something went wrong");
      }
    });
  }
        /*
        Alert(
            context: context,
            title: "Failed Login",
            desc: "Incorrect Email Or Password.")
            .show();
        */
        }

  /*
  buttonVisibility()
  {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _showButton,
      child: const Text("AdminPanel",style: TextStyle(color: Colors.red),),
    );
  }
  */

