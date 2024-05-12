import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/date_model.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
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
        // Bloc du titre
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Date de projection",
            style: TextStyle(
              fontSize: 20,
              color: couleurDominant,
              fontFamily: 'MontSerrat_1',
            ),
          ),
        ),

        // Espacement
        const SizedBox(height: 12),

        // Bloc qui affiche les dates de projection
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: MesCouleurs.secondaire.withOpacity(0.3),
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
              border: Border.all(
                color: couleurDominant.withOpacity(0.05),
              ),
            ),
            height: 75,
            width: 365,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: film.date.length,
                itemBuilder: (contex, index) {
                  Date date = film.date[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: MesCouleurs.blanc.withOpacity(0.05),
                        borderRadius: BorderRadiusDirectional.circular(10),
                        border: Border.all(
                          color: couleurDominant.withOpacity(0.08),
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date.j.toString(),
                              style: TextStyle(
                                fontFamily: 'MontSerrat_1',
                                color: couleurDominant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              date.J,
                              style: const TextStyle(
                                fontFamily: 'MontSerrat_2',
                                color: MesCouleurs.noir,
                              ),
                            )
                          ]),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
