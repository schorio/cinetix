import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          film.title,
          style: const TextStyle(
              fontSize: 25,
              color: MesCouleurs.noir,
              fontFamily: 'MontSerrat_2'),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              color: MesCouleurs.secondaire,
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
