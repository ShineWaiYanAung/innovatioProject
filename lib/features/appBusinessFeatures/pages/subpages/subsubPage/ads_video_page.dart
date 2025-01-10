import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../responsiveScreenControllerAbstract/parent_screen_controller.dart';

class FullScreenAdVideo extends StatefulWidget {
  @override
  _FullScreenAdVideoState createState() => _FullScreenAdVideoState();
}

class _FullScreenAdVideoState extends State<FullScreenAdVideo> {
  late VideoPlayerController _controller;
  int _remainingSeconds = 15;
  bool _isAdCompleted = false;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller
    _controller = VideoPlayerController.asset('video/ads_car_video.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
        _startCountdown();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_remainingSeconds > 0 && mounted) {
        setState(() {
          _remainingSeconds--;
        });
        _startCountdown();
      } else if (mounted) {
        setState(() {
          _isAdCompleted = true;
        });
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Your Data is Ready'),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.black),
        content: Text(
          'Thank you for choosing Us! Click start to continue.',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ScreenFactory.getPlatformScreen(Theme.of(context).platform)
                        .build(context),
              ));
              // Close dialog
              // Navigate to the next screen or perform action
            },
            child: Text(
              'Start',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          if (!_isAdCompleted)
            Positioned(
              top: 50,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '$_remainingSeconds seconds remaining',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
