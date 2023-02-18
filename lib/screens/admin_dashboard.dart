import 'package:astronerds/admin_controls/publish_a_blog.dart';
import 'package:astronerds/inside_screen/ask_a_question.dart';
import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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







          body: Center(child: Column(children: <Widget>[
            SizedBox(height: 40,),
            Container(
              child: Text("Admin DashBoard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            Container(
              height: 70,
              width: 200,

              margin: EdgeInsets.all(25),
              child: TextButton.icon(
                onPressed: () {
                  //print('I got clicked');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> publishBlog()));
                },
                //Text('Publish a Blog'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.teal), icon: Icon(Icons.add_circle_rounded), label: Text("Publish a blog"),
              ),
            ),

            Container(
              height: 70,
              width: 250,
              margin: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  //print('I got clicked');
                },
                child: Text('Add Photo of the day'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.teal),
              ),
            ),

            Container(
              height: 70,
              width: 250,
              margin: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  //print('I got clicked');
                },
                child: Text('Add Upcoming Events'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.teal),
              ),
            ),


            Container(
              height: 70,
              width: 250,
              margin: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  //print('I got clicked');
                },
                child: Text('Upload a New Course'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.teal),
              ),
            ),

          ]
          ))
      ),
    );
  }
}
