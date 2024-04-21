import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerViewerWidget extends StatelessWidget {
  const TrailerViewerWidget({
    Key? key,
    required VideoPlayerController? trailerController,
  })  : _trailerController = trailerController,
        super(key: key);

  final VideoPlayerController? _trailerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
        left: 30,
        right: 30,
        bottom: 450,
      ),
      child:
          _trailerController != null && _trailerController!.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AspectRatio(
                    aspectRatio: _trailerController!.value.aspectRatio,
                    child: VideoPlayer(_trailerController!),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
