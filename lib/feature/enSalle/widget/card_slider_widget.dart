import 'dart:ui' as ui;
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class CardSliderWidget extends StatefulWidget {
  const CardSliderWidget({
    super.key,
    required this.listFilm,
  });

  final List<Film> listFilm;

  @override
  State<CardSliderWidget> createState() => _CardSliderWidgetState();
}

class _CardSliderWidgetState extends State<CardSliderWidget> {
  late final PageController _movieCardPageController;
  late final PageController _movieTitlePageController;

  double _movieCardPage = 0.0;
  int _movieCardIndex = 0;
  // ignore: unused_field
  double _movieTitlePage = 0.0;

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieTitlePagePercentListener() {
    setState(() {
      _movieTitlePage = _movieTitlePageController.page!;
    });
  }

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);

    _movieTitlePageController = PageController()
      ..addListener(_movieTitlePagePercentListener);
    super.initState();
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieTitlePageController
      ..removeListener(_movieTitlePagePercentListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pochette(context),
        title(),
      ],
    );
  }

  Expanded title() {
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

  SizedBox pochette(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: PageView.builder(
          controller: _movieCardPageController,
          clipBehavior: Clip.none,
          itemCount: widget.listFilm.length,
          onPageChanged: (page) {
            _movieTitlePageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: const Interval(0.25, 1, curve: Curves.decelerate),
            );
          },
          itemBuilder: (_, index) {
            final movie = widget.listFilm[index];
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
