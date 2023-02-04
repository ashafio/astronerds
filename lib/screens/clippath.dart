import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class ClipAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clippath App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Clippath App Bar'),
          ),
          body: Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  color: Colors.black.withOpacity(.8),
                  height: 200,
                  alignment: Alignment.center,


                ),

              ),
              /*
              ClipPath(
                clipper: WaveClipper(waveDeep: 0, waveDeep2: 100 ),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  color: Colors.black.withOpacity(.8),
                  height: 180,
                  alignment: Alignment.center,

                ),
              ),
               */
            ],
          ),
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;


  WaveClipper({this.waveDeep = 100,this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25 , sh -waveDeep2*2);
    final Offset destinationPoint1 = Offset(sw * .5  , sh - waveDeep- waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75 , sh  - waveDeep*2 );
    final Offset destinationPoint2 = Offset(sw , sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height-waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, destinationPoint1.dx, destinationPoint1.dy
      )
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy ,destinationPoint2.dx, destinationPoint2.dy
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}