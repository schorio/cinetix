import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';

class EnSalleWidget extends StatefulWidget {
  const EnSalleWidget({required this.listFilms, super.key});

  final List<Film> listFilms;

  @override
  State<EnSalleWidget> createState() => _EnSalleWidgetState();
}

class _EnSalleWidgetState extends State<EnSalleWidget> {
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
          return _EnProjectionItem(
            film: widget.listFilms[index],
            isCenter: index == centerIndex,
          );
        },
      ),
    );
  }
}

class _EnProjectionItem extends StatefulWidget {
  const _EnProjectionItem({
    required this.film,
    this.isCenter = false,
  });

  final Film film;
  final bool isCenter;

  @override
  State<_EnProjectionItem> createState() => __EnProjectionItemState();
}

class __EnProjectionItemState extends State<_EnProjectionItem> {
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
