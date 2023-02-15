import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:astronerds/inside_screen/chatgpt.dart';
import 'package:flutter_glow/flutter_glow.dart';


class AskaQuestionScreen extends StatefulWidget {
  const AskaQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskaQuestionScreen> createState() => _AskaQuestionScreenState();
}

class _AskaQuestionScreenState extends State<AskaQuestionScreen> {

  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();
  final TextPostController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

      final askField =  TextField(
        autofocus: false,
        controller: TextPostController,
        keyboardType: TextInputType.multiline,


      onChanged: (value) {
        TextPostController.text = value;
        TextPostController.selection = TextSelection.fromPosition(TextPosition(offset: TextPostController.text.length));
      },
        textInputAction:TextInputAction.newline,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.question_answer_rounded),
            contentPadding: const EdgeInsets.fromLTRB(5, 50, 5, 50),
            hintText: "Hey AstroNerd!!! Ask a Question.",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ),
    );


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









      backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
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


                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GlowText(
                          'Get thoughts from Experts.',
                          style: TextStyle(fontSize: 20, color: Colors.cyan[300]),
                        ),
                      ),

                      SizedBox(height: 10,),
                      askField,
                      SizedBox(height: 20,),

                      ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),

                      ),

                      ),
                      onPressed: () {
                        // add imagepicker here ...............................................
                      },
                      icon: Icon(Icons.photo),
                      //style: Text('Add Photos'),
                        label: Text("Add Photos"),

                      ),


                      SizedBox(height: 10,),


                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black87, backgroundColor: Colors.blue[300],
                          minimumSize: Size(88, 36),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          // add userPost here ...............................................
                        },
                        child: const Text('Post',style: TextStyle(fontSize: 20),),
                      ),

                      SizedBox(height: 20,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          const Text("Want instant answers? "),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> chatGPT()));
                            },
                            child: Text("Ask ChatGPT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                          )
                        ],
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
}
