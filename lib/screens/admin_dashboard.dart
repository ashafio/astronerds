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
      home: Scaffold(
          appBar: AppBar(
        toolbarHeight: 100.0,
        /*leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
        },),*/
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
          body: Center(child: Column(children: <Widget>[
            Container(
              child: Text("Admin DashBoard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  //print('I got clicked');
                },
                child: Text('Reports'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.red),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                onPressed: () {
                  //print('I got clicked');
                },
                child: Text('See Insights'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20.0),
                    backgroundColor: Colors.red),
              ),
            ),

          ]
          ))
      ),
    );
  }
}
