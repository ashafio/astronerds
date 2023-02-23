import 'package:astronerds/inside_screen/ask_a_question.dart';
import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/model/blogView_model.dart';
import 'package:astronerds/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blogScreen extends StatefulWidget {
  const blogScreen({Key? key}) : super(key: key);

  @override
  State<blogScreen> createState() => _blogScreenState();
}

class _blogScreenState extends State<blogScreen> {

  Widget cardUI(BlogViewModel blogViewModel){
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 10.0,
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    blogViewModel.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,

                    ),
                  ),

                  Text(
                    blogViewModel.time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,

                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Image.network(
                blogViewModel.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0,),

              Text(
                blogViewModel.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
              ),
              ),
            ],
          ),

        ),
    );
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

      backgroundColor: Colors.white,

      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context,index){
                  Map<String, dynamic>? postMap =
                      snapshot.data?.docs[index].data();
                  BlogViewModel blogViewModel = BlogViewModel(
                    postMap!['imageUrl'],
                    postMap['description'],
                    postMap['date'],
                    postMap['time'],
                  );
                  return cardUI(blogViewModel);
                },
              );
            }
          },

        ),
      ),

    );
  }
}
