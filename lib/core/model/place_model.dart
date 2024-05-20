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

class PlaceType {
  final String type;
  final Color couleur;

  PlaceType({
    required this.type,
    required this.couleur,
  });
}
