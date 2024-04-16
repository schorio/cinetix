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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 30,
              color: MesCouleurs.primaire,
              fontFamily: 'MontSerrat_2'),
        ),
        const SizedBox(height: 3),
        Row(
          children: const [
            Icon(
              Icons.local_fire_department_outlined,
              color: MesCouleurs.primaire,
              size: 15,
            ),
            SizedBox(width: 5),
            Text(
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
