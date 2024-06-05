import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class SousTitleWidget extends StatelessWidget {
  const SousTitleWidget({
    required this.titleCategorie,
    Key? key,
  }) : super(key: key);

  final String titleCategorie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Categorie :",
          style: TextStyle(
            fontFamily: "MontSerrat_2",
            fontSize: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(9),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: MesCouleurs.primaire.withOpacity(0.05),
              width: 4,
            ),
            borderRadius: BorderRadius.circular(15),
            color: MesCouleurs.primaire.withOpacity(0.5),
          ),
          child: Text(
            titleCategorie,
            style: const TextStyle(
              color: MesCouleurs.blanc,
              fontFamily: 'MontSerrat_2',
            ),
          ),
        ),
      ],
    );
  }
}
