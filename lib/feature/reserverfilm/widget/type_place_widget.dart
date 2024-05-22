import 'package:cinetix/core/model/place_model.dart';
import 'package:flutter/material.dart';

class TypePlaceWidget extends StatelessWidget {
  const TypePlaceWidget({
    Key? key,
    required this.couleurDominant,
  }) : super(key: key);

  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    listeTypePlaces[2].couleur = couleurDominant;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listeTypePlaces
          .map(
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 12,
                    width: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                        color: index.couleur,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      index.type,
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}
