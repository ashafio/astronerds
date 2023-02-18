import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class publishBlog extends StatefulWidget {
  const publishBlog({Key? key}) : super(key: key);

  @override
  State<publishBlog> createState() => _publishBlogState();
}

class _publishBlogState extends State<publishBlog> {

  final TextEditingController descriptionEditingController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  File? imageFile;
  bool loading = false;

  Future<void> chooseImage() async{
    //PickedFile? pickedFile = (await imagePicker.pickImage(source: ImageSource.gallery)) as PickedFile?;

    PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }


  void _validate(){
    if(imageFile==null && descriptionEditingController.text.isEmpty){
        Fluttertoast.showToast(msg: "Add image & Description");
    }
    else if(imageFile==null){
        Fluttertoast.showToast(msg: "You must add a photo");
    }
    else if(descriptionEditingController.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "You must add Description");
      }
    else{
      setState(() {
        loading = true;
      });
      uploadImg();
    }

  }


  void uploadImg(){
// Create a unique file name for image
  String imageFileName = DateTime.now().microsecondsSinceEpoch.toString();
  final Reference storageReference = FirebaseStorage.instance.ref()
  .child('blogphoto').child(imageFileName);
  
  final UploadTask uploadTask = storageReference.putFile(imageFile!);
  
  uploadTask.then((TaskSnapshot tasksnapshot){
  
    tasksnapshot.ref.getDownloadURL().then((imageUrl){
      //save into firestore
      saveData(imageUrl);

    });
    
  }).catchError((error){
    setState(() {
      loading = false;
    });
    Fluttertoast.showToast(msg: error.toString());
  });
  }


  void saveData(String imageUrl){

    var dateFormat = DateFormat('MMM d, yyyy');
    var timeFormat = DateFormat('EEEE, hh:mm a');

    String date = dateFormat.format(DateTime.now().toString() as DateTime);
    String time = timeFormat.format(DateTime.now().toString() as DateTime);

    FirebaseFirestore.instance.collection('blogs').add({
      'imageUrl' : imageUrl,
      'description' : descriptionEditingController.text,
      'date': date,
      'time' : time,

    }).whenComplete((){
      setState(() {
        loading = true;
      });
      Fluttertoast.showToast(msg: 'Blog Uploaded Successfully');
      Navigator.pop(context);
    }).catchError((error){
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(msg: error.toString());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publish a Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
             imageFile == null ? Container(
              width: double.infinity,
              height: 250.0,
              color: Colors.grey,
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    chooseImage();
                  },
                  icon: Icon(Icons.add_photo_alternate_outlined),
                  label: Text('Choose Image'),


                ),
              ),
            ):
             GestureDetector(
               onTap: (){
                 chooseImage();
               },
               child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(imageFile as File),
                    fit:BoxFit.cover
                  )
                ),
            ),
             ),

            SizedBox(height: 20,),
            TextField(
              controller: descriptionEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Write blog here...'
              ),
            ),
            SizedBox(height: 40,),

            loading? CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 10,
            ): GestureDetector(
              onTap: _validate,
              child: Container(
                color: Colors.teal[300],
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    "Publish",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
