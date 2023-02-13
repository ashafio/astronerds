import 'package:astronerds/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';


class uranus_ar extends StatefulWidget {
  const uranus_ar({Key? key}) : super(key: key);

  @override
  State<uranus_ar> createState() => _uranus_arState();
}

class _uranus_arState extends State<uranus_ar> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
          },),
          title: Text('Uranus'),
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
        body: BabylonJSViewer(
          src: 'https://drive.google.com/file/d/1tsbXRGyXc929xV7XelbaTJx8gapgy2M9/view?usp=share_link',
        ),
      ),
    );
  }

}

