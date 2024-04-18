import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    Key? key,
    required this.film,
    required this.couleur_1,
    required this.couleur_2,
  }) : super(key: key);

  final Film film;
  final Color couleur_1;
  final Color couleur_2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          film.genre.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: couleur_2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: couleur_2),
              child: Text(
                film.genre[index],
                style: TextStyle(
                    color: couleur_1, fontFamily: 'MontSerrat_3', fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}
