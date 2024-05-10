import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class TrailerViewerWidget extends StatelessWidget {
  const TrailerViewerWidget({
    Key? key,
    required ChewieController? chewieController,
  })  : _chewieController = chewieController,
        super(key: key);

  final ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
        left: 30,
        right: 30,
        bottom: 459,
      ),
      child: _chewieController != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Chewie(
                controller: _chewieController!,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
