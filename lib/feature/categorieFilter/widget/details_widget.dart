import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final ToutFilm film;

  @override
  Widget build(BuildContext context) {
    String title = film.contenue.title;
    if (title.length > 10) {
      title =
          '${title.substring(0, 15)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleFilm(title),
          const SizedBox(height: 3),
          industryFilm(film.contenue.studio),
          const SizedBox(height: 5),
          evaluationFilm(),
          const SizedBox(height: 7),
          classeFilm(film.contenue.vote),
        ],
      ),
    );
  }

  Row classeFilm(int vote) {
    return Row(
      children: [
        const Icon(
          Icons.event,
          color: MesCouleurs.primaire,
          size: 14,
        ),
        const SizedBox(width: 4),
        Text(
          film.classe,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'MontSerrat_2',
          ),
        )
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
              num < film.contenue.rating ? Icons.star : Icons.star_border,
              color: num < film.contenue.rating
                  ? MesCouleurs.primaire
                  : MesCouleurs.noir,
            );
          }),
        ),
        const SizedBox(width: 3),
        Text(
          "(${film.contenue.rating}.0)",
          style: const TextStyle(
            fontSize: 8,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }

  Row industryFilm(String studio) {
    return Row(
      children: [
        const Icon(
          Icons.local_fire_department_outlined,
          color: MesCouleurs.primaire,
          size: 12,
        ),
        const SizedBox(width: 5),
        Text(
          studio,
          style: const TextStyle(
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
