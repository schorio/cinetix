import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

class BouttonReserverWidget extends StatelessWidget {
  const BouttonReserverWidget({
    Key? key,
    required this.film,
    required this.couleurDominant,
  }) : super(key: key);

  final Film film;
  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 117,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouteName.reserverFilm,
            arguments: couleurDominant,
          );
        },
        child: Container(
          height: 45,
          width: 155,
          decoration: BoxDecoration(
            color: couleurDominant,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: const Center(
            child: Text(
              'Reserver',
              style: TextStyle(
                color: MesCouleurs.blanc,
                fontFamily: 'MontSerrat_2',
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
