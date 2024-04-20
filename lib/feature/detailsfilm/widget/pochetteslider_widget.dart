import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class PochetteSliderWidget extends StatelessWidget {
  const PochetteSliderWidget({
    Key? key,
    required this.film,
    required this.listPochette,
    required this.selected,
    required this.couleurDominant,
  }) : super(key: key);

  final Film film;
  final List<String> listPochette;
  final int selected;
  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: film.assetImage,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 55, left: 30, right: 30, bottom: 305),
        child: Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(listPochette[selected]),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: couleurDominant,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
