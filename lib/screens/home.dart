
import 'package:astronerds/inside_screen/ask_a_question.dart';
import 'package:astronerds/inside_screen/blogs.dart';
import 'package:astronerds/inside_screen/courses.dart';
import 'package:astronerds/inside_screen/nasa_apod.dart';
import 'package:astronerds/inside_screen/profile.dart';
import 'package:astronerds/inside_screen/explore_ar.dart';
import 'package:astronerds/inside_screen/photo_of_the_day.dart';
import 'package:astronerds/screens/clippath.dart';
import 'package:astronerds/screens/login.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        /*leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),*/
        title: Center(child: Text("AstroNerds", style: TextStyle(color: Colors.white),)),
        //centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        //children: [
/*
          Container(
            width: w,
            height: 100,
            child:         ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.black,

              ),
            ),
      ),
*/
          child: Padding(
          padding: const EdgeInsets.all(15.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        children: [

          InkWell(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  SizedBox(
                    height: h*0.1,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/post.json'),
                    ),
                  ),
                  Text("Feed",style: TextStyle(color: Colors.black,fontSize: 22),)
                ],),
            ),
            onTap: (){

            },
          ),

          InkWell(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.account_circle_rounded,size: 50,color: Colors.white),
                  SizedBox(
                    height: h*0.1,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/profile.json'),
                    ),
                  ),
                  Text("Profile",style: TextStyle(color: Colors.black,fontSize: 22),)
                ],),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),

          InkWell(
            child:   Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.,size: 50,color: Colors.white),
                  SizedBox(
                    height: h*0.1,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/telescope.json'),
                    ),
                  ),
                  /*InkWell(
                onTap: (){},
                child: Image.asset('assets/tele.png',height: 50,width: 50,),
              ),*/
                  Text("Explore AR",style: TextStyle(color: Colors.black,fontSize: 22),)
                ],),
            ),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => xplorear()));
            },
          ),

          InkWell(
            child:  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  //Lottie.asset('assets/elearn.json'),
                  SizedBox(
                    height: h*0.12,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/elearn.json'),
                    ),
                  ),
                  Text("Courses",style: TextStyle(color: Colors.black,fontSize: 22,),),
                ],),
            ),
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>clippathScreen()));
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClipAppScreen()));
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: context)) => ClipAppScreen();
            },
          ),

          InkWell(
            child:  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  //Lottie.asset('assets/elearn.json'),
                  SizedBox(
                    height: h*0.1,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/photojson.json'),
                    ),
                  ),

                    Text("Photo of the day",style: TextStyle(color: Colors.black,fontSize: 20,),),
                ],),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NasaAPOD()));
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>potdScreen()));
            },
          ),

          InkWell(
            child:  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  //Lottie.asset('assets/elearn.json'),
                  SizedBox(
                    height: h*0.15,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/askqna.json'),
                    ),
                  ),
                  Text("Ask a Question",style: TextStyle(color: Colors.black,fontSize: 20,),),
                ],),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AskaQuestionScreen()));
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
          ),

          InkWell(
            child:  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  //Lottie.asset('assets/elearn.json'),
                  SizedBox(
                    height: h*0.15,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/blogs.json'),
                    ),
                  ),
                  Text("Blogs",style: TextStyle(color: Colors.black,fontSize: 22,),),
                ],),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>blogScreen()));
            },
          ),

          InkWell(
            child:  Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(Icons.home,size: 50,color: Colors.white),
                  //Lottie.asset('assets/elearn.json'),
                  SizedBox(
                    height: h*0.1,
                    child: OverflowBox(
                      minHeight: h*0.33,
                      maxHeight: h*0.33,
                      child: Lottie.asset('assets/events.json'),
                    ),
                  ),
                  Text("Recent Events",style: TextStyle(color: Colors.black,fontSize: 20,),),
                ],),
            ),
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
          ),




        ],
      ),
    ),
    ),

      );
  }
}



class MyClipper extends CustomClipper<Path> {
@override
  Path getClip(Size size){
  return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width/4, size.height-40, size.width/2, size.height-20,)
      ..quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height-30)
      ..lineTo(size.width, 0);
}
@override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
  return false;
}
}


/*

ClipPath(
clipper: MyClipper(),
child: Container(
width: double.infinity,
height: 100,
color: Colors.black,


),
),

class MyClipper extends CustomClipper<Path> {
@override
  Path getClip(Size size){
  return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width/4, size.height-40, size.width/2, size.height-20,)
      ..quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height-30)
      ..lineTo(size.width, 0);
}
@override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
  return false;
}
}
*/


