import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    Key? key,
    required this.couleurDominant,
    required this.film,
  }) : super(key: key);

  final Color couleurDominant;
  final Film film;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timelapse_outlined,
          color: couleurDominant,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          film.duration,
          style: const TextStyle(
            fontSize: 13,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }
}
