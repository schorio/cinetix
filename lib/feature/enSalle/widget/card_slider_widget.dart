import 'dart:ui' as ui;
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class CardSliderWidget extends StatelessWidget {
  const CardSliderWidget({
    Key? key,
    required PageController movieCardPageController,
    required PageController movieTitlePageController,
    required double movieCardPage,
    required int movieCardIndex,
  })  : _movieCardPageController = movieCardPageController,
        _movieTitlePageController = movieTitlePageController,
        _movieCardPage = movieCardPage,
        _movieCardIndex = movieCardIndex,
        super(key: key);

  final PageController _movieCardPageController;
  final PageController _movieTitlePageController;
  final double _movieCardPage;
  final int _movieCardIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: PageView.builder(
          controller: _movieCardPageController,
          clipBehavior: Clip.none,
          itemCount: enProjection.length,
          onPageChanged: (page) {
            _movieTitlePageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: const Interval(0.25, 1, curve: Curves.decelerate),
            );
          },
          itemBuilder: (_, index) {
            final movie = enProjection[index];
            final progress = (_movieCardPage - index);
            final scale = ui.lerpDouble(1, .8, progress.abs())!;
            final isCurrentPage = index == _movieCardIndex;
            final isScrolling =
                _movieCardPageController.position.isScrollingNotifier.value;
            final isFirstPage = index == 0;

            return Transform.scale(
              alignment: Alignment.lerp(
                Alignment.topLeft,
                Alignment.center,
                -progress,
              ),
              scale: isScrolling && isFirstPage ? 1 - progress : scale,
              child: GestureDetector(
                onTap: () {},
                child: Hero(
                  tag: movie.assetImage,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.identity()
                      ..translate(
                        isCurrentPage ? 0.0 : -20.0,
                        isCurrentPage ? 0.0 : 60.0,
                      ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 25,
                          offset: const Offset(0, 25),
                          color: Colors.black.withOpacity(.2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(movie.assetImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
