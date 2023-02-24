import 'dart:io';
import 'dart:math';
import 'package:astronerds/admin_controls/pdf_delete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfup extends StatefulWidget {
  const pdfup({Key? key}) : super(key: key);

  @override
  State<pdfup> createState() => _pdfupState();
}

class _pdfupState extends State<pdfup> {


  String pdfurl = "";
  int? number;
  uploadPDF() async {

    //generate random number
    number = Random().nextInt(10);

    //pick pdf file
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();

    String name = DateTime.now().millisecondsSinceEpoch.toString();

    //upload file to firebase
    //var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
    var pdfFile = FirebaseStorage.instance.ref().child("ebooks").child(name+"/.pdf");
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    pdfurl = await snapshot.ref.getDownloadURL();

    //upload url to cloud database
    await FirebaseFirestore.instance.collection('pdffiles').doc().set(
      {
        'fileurl':pdfurl,
        'num':"Book: "+number.toString(),
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: Column(
        children: [
          Center(
                  child: ElevatedButton(
                    onPressed: () {
                      uploadPDF();
                    },
                    child: const Text('Select and Upload eBook'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.teal),
                    ),
                  ),
          ),
          SizedBox(height: 30,),

          Center(
            child: ElevatedButton(
              onPressed: () {
                //uploadPDF();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>deleteebooks()));
              },
              child: const Text('Delete eBook'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.teal),
              ),
            ),
          ),
        ],
      ));

          /*
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pdffiles").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,i){
              QueryDocumentSnapshot x = snapshot.data!.docs[i];

              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfview(pdfurl: x['fileurl'],)));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(x["num"]),
                ),
              );
            });
          }

          return Center(child: CircularProgressIndicator(),);
        },
      ),

      */
      //floatingActionButton: FloatingActionButton(onPressed: uploadPDF,child: Icon(Icons.add),),
    //);
  }
}

/*
class pdfview extends StatelessWidget {
//  const pdfview({Key? key}) : super(key: key);

  PdfViewerController? _pdfViewerController;
  final pdfurl;
  pdfview({this.pdfurl});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eBooks"),
      ),
      body: SfPdfViewer.network(
        pdfurl,
        controller: _pdfViewerController,
      ),
    );
  }
}
*/