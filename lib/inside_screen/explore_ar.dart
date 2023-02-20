import 'package:astronerds/ar_screens/earth.dart';
import 'package:astronerds/ar_screens/universe.dart';
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
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Mercury'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Venus'),
                  ),


                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> earth_ar()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Earth'),
                  ),




                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Mars'),
                  ),



                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Jupitar'),
                  ),


                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Saturn'),
                  ),



              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                  shadowColor: Colors.grey, // elevation color
                  elevation: 5, // elevation of button
                ),
                child: const Text('Uranus'),
              ),



                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Neptune'),
                  ),



                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Pluto'),
                  ),



                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> uranus()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Sun'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> universe()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground color
                      shadowColor: Colors.grey, // elevation color
                      elevation: 5, // elevation of button
                    ),
                    child: const Text('Universe'),
                  ),


                ],
          ),
        ),
      ),
    ),);
  }
}
