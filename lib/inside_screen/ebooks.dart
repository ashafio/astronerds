import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ebooks extends StatefulWidget {
  const ebooks({Key? key}) : super(key: key);

  @override
  State<ebooks> createState() => _ebooksState();
}

class _ebooksState extends State<ebooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pdffiles").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return Container(
              //height: 50,

              //color: Colors.amber[600],
              child: ListView.builder(

                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,i){
                    QueryDocumentSnapshot x = snapshot.data!.docs[i];

                    return InkWell(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfview(pdfurl: x['fileurl'],)));
                      },
                      child: Container(
                        height: 50,
                        color: Colors.amber[600],
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(x["num"],style: TextStyle(fontSize: 20),),
                          ),
                        ),
                      ),
                    );
                  }
                  ),
            );
          }

          return Center(child: CircularProgressIndicator(),);
        },
      ),
      //floatingActionButton: FloatingActionButton(onPressed: uploadPDF,child: Icon(Icons.add),),
    );
  }
}

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
