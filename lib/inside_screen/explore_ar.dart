import 'package:astronerds/ar_screens/earth.dart';
import 'package:astronerds/ar_screens/uranus.dart';
import 'package:astronerds/screens/home.dart';
import 'package:flutter/material.dart';

class xplorear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
          },),
          //title: Text(null),
          title: Text("3D Objects",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('Mercury'),
                onPressed: () {
                },
              ),

              TextButton(
                child: Text('Venus'),
                onPressed: () {
                },
              ),
          TextButton(
            child: Text('Earth'),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => earth_ar()));
            },),
    TextButton(
    child: Text('Mars'),
    onPressed: () {
    },),
    TextButton(
    child: Text('Jupiter'),
    onPressed: () {
    },),
    TextButton(
    child: Text('Saturn'),
    onPressed: () {
    },),
    TextButton(
    child: Text('Uranus'),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => uranus_ar()));
    },),
    TextButton(
    child: Text('Neptune'),
    onPressed: () {
    },),
    TextButton(
    child: Text('Pluto'),
    onPressed: () {
    },),
    TextButton(
    child: Text('Sun'),
    onPressed: () {
    },
    ), ],
          ),
        ),
      ),
    );
  }
}
