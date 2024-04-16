import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

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
                    color: MesCouleurs.secondaire,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: MesCouleurs.secondaire),
              child: Text(
                film.genre[index],
                style: const TextStyle(
                    color: MesCouleurs.primaire,
                    fontFamily: 'MontSerrat_3',
                    fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}
