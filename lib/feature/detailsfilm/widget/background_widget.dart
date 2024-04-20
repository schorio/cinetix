import 'dart:ui' as ui;
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.film,
    required this.couleurDominant,
  }) : super(key: key);

  final Film film;
  final ui.Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(film.assetImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: couleurDominant.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
