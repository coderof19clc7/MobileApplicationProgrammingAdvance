import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class DemoVideoPopup extends StatefulWidget {
  const DemoVideoPopup({super.key});

  @override
  State<DemoVideoPopup> createState() => _DemoVideoPopupState();
}

class _DemoVideoPopupState extends State<DemoVideoPopup> {
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
    videoPlayerController =
        VideoPlayerController.network('https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
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
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (videoWidth != null && videoHeight != null) ? (videoWidth! / videoHeight!) : 16 / 9,
      child: buildVideoPlayer(),
    );
  }

  Widget buildVideoPlayer() {
    if (chewieController != null && chewieController!.videoPlayerController.value.isInitialized) {
      return Chewie(controller: chewieController!);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [CircularProgressIndicator()],
    );
  }
}
