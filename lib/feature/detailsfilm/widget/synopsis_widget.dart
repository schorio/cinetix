import 'package:animate_do/animate_do.dart';
import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class SynopsisWidget extends StatelessWidget {
  const SynopsisWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: const Text(
            "Synopsis",
            style: TextStyle(
                fontSize: 18,
                color: MesCouleurs.primaire,
                fontFamily: 'MontSerrat_2'),
          ),
        ),
        const SizedBox(height: 5),
        FadeInUp(
          delay: const Duration(milliseconds: 900),
          child: Text(
            film.synopsis,
            style: const TextStyle(
                fontSize: 12,
                color: MesCouleurs.noir,
                fontFamily: 'MontSerrat_3'),
          ),
        ),
      ],
    );
  }
}
