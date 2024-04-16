import 'package:animate_do/animate_do.dart';
import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class EvaluationWidget extends StatelessWidget {
  const EvaluationWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Row(
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return Icon(
                size: 25,
                index < film.rating ? Icons.star : Icons.star_border,
                color: index < film.rating
                    ? MesCouleurs.primaire
                    : MesCouleurs.noir,
              );
            }),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "(${film.rating}.0)",
            style: const TextStyle(fontSize: 10, color: MesCouleurs.noir),
          ),
        ],
      ),
    );
  }
}
