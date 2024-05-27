import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class TitleSliderWidget extends StatelessWidget {
  const TitleSliderWidget({
    Key? key,
    required PageController movieTitlePageController,
  })  : _movieTitlePageController = movieTitlePageController,
        super(key: key);

  final PageController _movieTitlePageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _movieTitlePageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: enProjection.length,
        itemBuilder: (_, index) {
          final movie = enProjection[index];
          return Hero(
            tag: movie.title,
            child: Center(
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
