import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:video_player/video_player.dart';

class DemoVideoPopup extends StatefulWidget {
  const DemoVideoPopup({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<DemoVideoPopup> createState() => _DemoVideoPopupState();
}

class _DemoVideoPopupState extends State<DemoVideoPopup> {
  bool isInitializing = true;
  late VideoPlayerController videoPlayerController;
  double? videoWidth;
  double? videoHeight;

  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    try {
      videoPlayerController =
          VideoPlayerController.network(widget.videoUrl);
      await videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.portraitUp],
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      );
      setState(() {
        videoWidth = videoPlayerController.value.size.width;
        videoHeight = videoPlayerController.value.size.height;
      });
    } catch(e) {
      log('init video player controller and chewie controller error: $e');
    } finally {
      setState(() {
        isInitializing = false;
      });
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: (videoWidth != null && videoHeight != null) ? (videoWidth! / videoHeight!) : 16 / 9,
        child: buildVideoPlayer(),
      ),
    );
  }

  Widget buildVideoPlayer() {
    if (chewieController != null && chewieController!.videoPlayerController.value.isInitialized) {
      return Chewie(controller: chewieController!);
    }

    if (!isInitializing) {
      return Center(child: Text(S.current.videoNotAvailable));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [CircularProgressIndicator()],
    );
  }
}
