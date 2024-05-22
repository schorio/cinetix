import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class Place {
  final bool isHidden;
  final bool isOccupied;
  bool isSelected;

  Place({
    required this.isHidden,
    required this.isOccupied,
    this.isSelected = false,
  });
}

final section1 = List.generate(
  25,
  (index) => Place(
    isHidden: [0, 1, 5].contains(index),
    isOccupied: [].contains(index),
  ),
);

final section2 = List.generate(
  25,
  (index) => Place(
    isHidden: [3, 4, 9].contains(index),
    isOccupied: [12, 13].contains(index),
  ),
);

final section3 = List.generate(
  25,
  (index) => Place(
    isHidden: [20].contains(index),
    isOccupied: [].contains(index),
  ),
);

final section4 = List.generate(
  25,
  (index) => Place(
    isHidden: [24].contains(index),
    isOccupied: [].contains(index),
  ),
);

final seats = [
  section1,
  section2,
  section3,
  section4,
];

// ------------------------------- Les types des places ------------------------------- //

class PlaceType {
  final String type;
  Color couleur;

  PlaceType({
    required this.type,
    required this.couleur,
  });
}

List<PlaceType> listeTypePlaces = [
  PlaceType(
    type: "Disponible",
    couleur: MesCouleurs.secondaire,
  ),
  PlaceType(
    type: "Réserver",
    couleur: MesCouleurs.noir,
  ),
  PlaceType(
    type: "Sélectionner",
    couleur: MesCouleurs.primaire,
  )
];
