import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class FilmDetailsWidget extends StatelessWidget {
  const FilmDetailsWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    String title = film.title;
    if (title.length > 18) {
      title =
          '${title.substring(0, 18)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleFilm(title),
          const SizedBox(height: 3),
          industryFilm(),
          const SizedBox(height: 5),
          evaluationFilm(),
          const SizedBox(height: 5),
          dateFilm(),
        ],
      ),
    );
  }

  Row dateFilm() {
    return Row(
      children: const [
        Icon(
          Icons.date_range_rounded,
          color: MesCouleurs.primaire,
          size: 15,
        ),
        SizedBox(width: 5),
        Text(
          "2018",
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'MontSerrat_2',
          ),
        ),
      ],
    );
  }

  Row evaluationFilm() {
    return Row(
      children: [
        Wrap(
          children: List.generate(5, (int num) {
            return Icon(
              size: 15,
              num < film.rating ? Icons.star : Icons.star_border,
              color:
                  num < film.rating ? MesCouleurs.primaire : MesCouleurs.noir,
            );
          }),
        ),
        const SizedBox(width: 3),
        Text(
          "(${film.rating}.0)",
          style: const TextStyle(
            fontSize: 8,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }

  Row industryFilm() {
    return Row(
      children: const [
        Icon(
          Icons.local_fire_department_outlined,
          color: MesCouleurs.primaire,
          size: 12,
        ),
        SizedBox(width: 5),
        Text(
          'Marvel Studio',
          style: TextStyle(
            fontSize: 10,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }

  Text titleFilm(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'MontSerrat_2',
      ),
    );
  }
}
