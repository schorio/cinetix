import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class BlocDetailsWidget extends StatelessWidget {
  const BlocDetailsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    String title = prochainement[index].title;
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
          industryFilm(),
          const SizedBox(height: 5),
          evaluationFilm(),
          const SizedBox(height: 5),
          voteFilm(),
        ],
      ),
    );
  }

  Row voteFilm() {
    return Row(
      children: const [
        Text(
          "10",
          style: TextStyle(
              color: MesCouleurs.primaire,
              fontSize: 15,
              fontFamily: 'MontSerrat_2'),
        ),
        SizedBox(width: 2),
        Text(
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
              num < prochainement[index].rating
                  ? Icons.star
                  : Icons.star_border,
              color: num < prochainement[index].rating
                  ? MesCouleurs.primaire
                  : MesCouleurs.noir,
            );
          }),
        ),
        const SizedBox(width: 3),
        Text(
          "(${prochainement[index].rating}.0)",
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
