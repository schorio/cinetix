import 'package:flutter/material.dart';

class TitlePageWidget extends StatelessWidget {
  const TitlePageWidget({
    Key? key,
    required this.couleurDominant,
  }) : super(key: key);

  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Réservation',
      style: TextStyle(
        fontFamily: 'MontSerrat_1',
        fontSize: 22,
        color: couleurDominant,
      ),
    );
  }
}
