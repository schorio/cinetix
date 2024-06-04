import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class TitleMovieWidget extends StatelessWidget {
  const TitleMovieWidget({
    Key? key,
    required this.film,
    required this.couleur,
    this.controller,
    this.selected = 0,
  }) : super(key: key);

  final Film film;
  final Color couleur;
  final PageController? controller;
  final int selected;

  @override
  Widget build(BuildContext context) {
    String title = film.title;
    if (title.length > 10) {
      title =
          '${title.substring(0, 15)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                Text(
                  title,
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
                    Text(
                      film.studio,
                      style: const TextStyle(
                        fontSize: 12,
                        color: MesCouleurs.noir,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (controller != null && film.trailer.isNotEmpty)
            InkWell(
              onTap: () {
                int control;
                selected == 0 ? control = selected + 1 : control = selected - 1;
                controller?.animateToPage(
                  control,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(
                selected == 0 ? Icons.play_circle : Icons.stop_circle,
                color: couleur,
                size: 55,
              ),
            ),
        ],
      ),
    );
  }
}
