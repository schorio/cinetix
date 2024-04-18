import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.film,
    required this.couleur,
  }) : super(key: key);

  final Film film;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          film.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 30, color: couleur, fontFamily: 'MontSerrat_2'),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              color: couleur,
              size: 15,
            ),
            const SizedBox(width: 5),
            const Text(
              'Marvel Studio',
              style: TextStyle(
                fontSize: 12,
                color: MesCouleurs.noir,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
