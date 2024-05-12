import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class ActorWidget extends StatelessWidget {
  const ActorWidget({
    Key? key,
    required this.couleurDominant,
    required this.film,
  }) : super(key: key);

  final Color couleurDominant;
  final Film film;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Acteurs",
            style: TextStyle(
                fontSize: 20,
                color: couleurDominant,
                fontFamily: 'MontSerrat_1'),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(film.actor.length, (index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: couleurDominant.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: MesCouleurs.secondaire.withOpacity(0.3),
                ),
                child: Text(
                  film.actor[index],
                  style: TextStyle(
                      color: couleurDominant,
                      fontFamily: 'MontSerrat_3',
                      fontSize: 13),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
