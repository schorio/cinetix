import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class VoteDetailsWidget extends StatelessWidget {
  const VoteDetailsWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    String title = film.title;
    if (title.length > 10) {
      title =
          '${title.substring(0, 12)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleFilm(title),
          const SizedBox(height: 3),
          industryFilm(film.studio),
          const SizedBox(height: 5),
          evaluationFilm(),
          const SizedBox(height: 5),
          voteFilm(film.vote),
        ],
      ),
    );
  }

  Row voteFilm(int vote) {
    return Row(
      children: [
        Text(
          vote.toString(),
          style: const TextStyle(
              color: MesCouleurs.primaire,
              fontSize: 15,
              fontFamily: 'MontSerrat_2'),
        ),
        const SizedBox(width: 2),
        const Text(
          "vote(s)",
          style: TextStyle(
            fontSize: 10,
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
