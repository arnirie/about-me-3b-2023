import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoPortfolioScreen extends StatefulWidget {
  const VideoPortfolioScreen({super.key});

  @override
  State<VideoPortfolioScreen> createState() => _VideoPortfolioScreenState();
}

class _VideoPortfolioScreenState extends State<VideoPortfolioScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://freetestdata.com/wp-content/uploads/2022/02/Free_Test_Data_7MB_MP4.mp4');
    // _controller = VideoPlayerController.asset('assets/videos/sample.mp4');
    _controller.initialize().then((value) {
      //after the controller has been initialized, set the ChewieController to get the correct aspectratio
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
        aspectRatio: _controller.value.aspectRatio,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value.aspectRatio);
    //check first if the controller has been initialized
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (_controller.value.isPlaying) {
      //       _controller.pause();
      //     } else {
      //       _controller.play();
      //     }
      //     setState(() {});
      //   },
      //   child: FaIcon(_controller.value.isPlaying
      //       ? FontAwesomeIcons.pause
      //       : FontAwesomeIcons.play),
      // ),
    );
  }
}
