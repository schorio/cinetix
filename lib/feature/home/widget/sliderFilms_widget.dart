import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/core/design/app_color.dart';

class SliderFilmsWidget extends StatefulWidget {
  const SliderFilmsWidget(
      {required this.listFilms,
      required this.sHeight,
      required this.sViewPortFraction,
      super.key});

  final List<Film> listFilms;
  final double sHeight;
  final double sViewPortFraction;

  @override
  State<SliderFilmsWidget> createState() => _SliderFilmsWidgetState();
}

class _SliderFilmsWidgetState extends State<SliderFilmsWidget> {
  int centerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.sHeight,
      child: CarouselSlider.builder(
        itemCount: widget.listFilms.length,
        options: CarouselOptions(
          height: widget.sHeight,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: centerIndex,
          viewportFraction: widget.sViewPortFraction,
          onPageChanged: (index, reason) {
            setState(() {
              centerIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, _) {
          return _FilmsItem(
            film: widget.listFilms[index],
            isCenter: index == centerIndex,
          );
        },
      ),
    );
  }
}

class _FilmsItem extends StatefulWidget {
  const _FilmsItem({
    required this.film,
    this.isCenter = false,
  });

  final Film film;
  final bool isCenter;

  @override
  State<_FilmsItem> createState() => __FilmsItemState();
}

class __FilmsItemState extends State<_FilmsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteName.detailsFilm,
            arguments: widget.film);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: widget.film.assetImage,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.film.assetImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.film.title,
            style: const TextStyle(color: MesCouleurs.noir, fontSize: 15),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
