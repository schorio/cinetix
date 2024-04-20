import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class IndicatorPochetteWidget extends StatelessWidget {
  const IndicatorPochetteWidget({
    Key? key,
    required this.listPochette,
    required this.selected,
    required this.couleurDominant,
  }) : super(key: key);

  final List<String> listPochette;
  final int selected;
  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 283.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          listPochette.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 8.0,
            width: selected == index ? 20.0 : 8.0,
            margin: const EdgeInsets.only(right: 4.0),
            decoration: BoxDecoration(
              color: selected == index
                  ? couleurDominant
                  : MesCouleurs.secondaire.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
