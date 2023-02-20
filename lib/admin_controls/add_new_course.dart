import 'dart:io';

import 'package:astronerds/inside_screen/ask_a_question.dart';
import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/screens/home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:astronerds/admin_controls/firebase_api.dart';
import 'package:path/path.dart';

class uploadCourse extends StatefulWidget {
  const uploadCourse({Key? key}) : super(key: key);

  @override
  State<uploadCourse> createState() => _uploadCourseState();
}

class _uploadCourseState extends State<uploadCourse> {

  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {

    final fileName = file != null ? basename(file!.path) : 'No File Selected.';


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

      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton.icon(
                  onPressed:  () async {
                    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
                    if(result == null);
                    final path = result?.files.single.path!;


                    setState(() => file = File(path!));
                  },
                  icon: Icon(Icons.attach_file),
                  label: Text('Select File')
              ),

              SizedBox(height: 8,),

              Text(
                fileName,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),

              TextButton.icon(
                  onPressed: () async {
                    if(file == null) return;
                    final fileName = basename(file!.path);
                    final destination = 'courses/$fileName';

                    task = FirebaseApi.uploadFile(destination,file as File);
                    if(task == null) return;

                    final snapshot = await task!.whenComplete(() => null);
                    final urlDownload = await snapshot.ref.getDownloadURL();

                    print('Download-Link:  $urlDownload');
                  },
                  icon: Icon(Icons.cloud_upload_outlined),
                  label: Text('Upload File')
              )

            ],
          ),
        ),
      ),

    );
  }




}
