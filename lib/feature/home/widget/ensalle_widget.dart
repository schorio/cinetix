import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';

class SliderFilmsWidget extends StatefulWidget {
  const SliderFilmsWidget({required this.listFilms, super.key});

  final List<Film> listFilms;

  @override
  State<SliderFilmsWidget> createState() => _SliderFilmsWidgetState();
}

class _SliderFilmsWidgetState extends State<SliderFilmsWidget> {
  int centerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: CarouselSlider.builder(
        itemCount: widget.listFilms.length,
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: centerIndex,
          viewportFraction: 0.7,
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
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
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
          const SizedBox(height: 16),
          Text(
            widget.film.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.black, fontSize: 16),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
