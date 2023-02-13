import 'dart:typed_data';

import 'package:astronerds/screens/home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:astronerds/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(now);


class potdScreen extends StatefulWidget {
  const potdScreen({Key? key}) : super(key: key);

  @override
  _potdScreenState createState() => _potdScreenState();
}


class _potdScreenState extends State<potdScreen> {

/*
  firebase_storage.FirebaseStorage storage1 =
  firebase_storage.FirebaseStorage.instanceFor(
      bucket: 'secondary-storage-bucket');


  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://astrofire-38a8c.appspot.com');
*/

  final FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://astrofire-38a8c.appspot.com');

  Uint8List ?imageBytes;
  late String errorMsg;

  _potdScreenState() {
    storage.ref().child('ben-kolde-bs2Ba7t69mM-unsplash.jpg').getData(10000000).then((data) =>
        setState(() {
          imageBytes = data!;
        })
    ).catchError((e) =>
        setState(() {
          errorMsg = e.error;
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    var img = imageBytes != null ? Image.memory(
      imageBytes!,
      fit: BoxFit.cover,
    ) : Text(errorMsg != null ? errorMsg : "Loading...");

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
          },),
          //title: Text(null),
          backgroundColor: Colors.black, // appbar color.
          foregroundColor: Colors.white, // appbar text color.
          actions: [
            IconButton(
              icon: Icon(Icons.home,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_active,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search_rounded,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_2_rounded,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
            // add more IconButton
          ],
        ),



        body: new ListView(
          children: <Widget>[
            Center(child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Photo of the day",style: TextStyle(fontSize: 30),),
            )
            ),
            Center(child: Text(formattedDate,style: TextStyle(fontSize: 20),)),
            SizedBox(
              height: 20.0,
            ),
            img,
          ],
        ));
  }
}

