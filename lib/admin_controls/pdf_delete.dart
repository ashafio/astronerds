import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class deleteebooks extends StatefulWidget {
  const deleteebooks({Key? key}) : super(key: key);

  @override
  State<deleteebooks> createState() => _deleteebooksState();
}

class _deleteebooksState extends State<deleteebooks> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pdffiles").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){

          deletepdf() async {
            /*
            await FirebaseFirestore.instance.runTransaction((
                transaction) async =>
            await transaction.delete(DocumentReference as DocumentReference<Object?>));
             */

            await FirebaseFirestore.instance.collection("pdffiles").doc().delete().then(
                  (doc) => print("Document deleted"),
              onError: (e) => print("Error updating document $e"),
            );

          };


          if(snapshot.hasData){
            return Container(
              //height: 50,

              //color: Colors.amber[600],
              child: ListView.builder(

                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,i){
                    QueryDocumentSnapshot x = snapshot.data!.docs[i];
                    //String currenti = i.toString();

                    return Column(

                      /*
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfview(pdfurl: x['fileurl'],)));
                      },
                       */
                      children: [

                               Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: TextButton.icon(
                                    onPressed: deletepdf,
                                    /*
                                    onPressed: () async {
                                      await FirebaseFirestore.instance.collection("pdffiles").doc(currenti).delete().then(
                                              (doc) => print("Document deleted"),
                                          onError: (e) => print("Error updating document $e"),);
                                    },
                                     */

                                    icon: Icon(Icons.delete),
                                    label: Text(x["num"],style: TextStyle(fontSize: 20),)),
                              ),

                    ],
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
