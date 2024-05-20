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
  16,
  (index) => Place(
    isHidden: [0, 1, 4].contains(index),
    isOccupied: [].contains(index),
  ),
);

final section2 = List.generate(
  16,
  (index) => Place(
    isHidden: [].contains(index),
    isOccupied: [12, 13].contains(index),
  ),
);

final section3 = List.generate(
  16,
  (index) => Place(
    isHidden: [2, 3, 7].contains(index),
    isOccupied: [13, 14, 15].contains(index),
  ),
);

final section4 = List.generate(
  20,
  (index) => Place(
    isHidden: [].contains(index),
    isOccupied: [1, 2, 3].contains(index),
  ),
);

final section5 = List.generate(
  20,
  (index) => Place(
    isHidden: [].contains(index),
    isOccupied: [].contains(index),
  ),
);

final section6 = List.generate(
  20,
  (index) => Place(
    isHidden: [].contains(index),
    isOccupied: [14].contains(index),
  ),
);

final seats = [
  section1,
  section2,
  section3,
  section4,
  section5,
  section6,
];

// ------------------------------- Les types des places ------------------------------- //

class PlaceType {
  final String type;
  final Color couleur;

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
