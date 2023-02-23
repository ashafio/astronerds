import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class courseScreen extends StatefulWidget {
  // File? sub1;
  // courseScreen({
  //   required this.sub1,
  // });
  @override
  State<courseScreen> createState() => _courseScreenState();
}

class _courseScreenState extends State<courseScreen> {
  // File? sub1;
  // _courseScreenState({
  //   required this.sub1,
  // });
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.file(sub1!)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    _controller = VideoPlayerController.network(
      //'https://firebasestorage.googleapis.com/v0/b/astronerds.appspot.com/o/courses%2FVID-20230220-WA0001.mp4?alt=media&token=8606f8a1-cdf0-43ab-9420-739f6f00673c'
      'https://firebasestorage.googleapis.com/v0/b/astronerds.appspot.com/o/courses%2FAstronomy.mp4?alt=media&token=d4bcbbe7-aec7-4f90-9f5c-d858290e3598'
       // 'gs://astronerds.appspot.com/courses'

    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: false,
      looping: false,
    );
    return Scaffold(
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: Chewie(
            controller: chewieController,
          ),
        )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}