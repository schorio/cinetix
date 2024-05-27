import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MesCouleurs.primaire,
            size: 30,
          ),
        ),
        const Center(
          child: Text(
            'Les films en salle',
            style: TextStyle(
              fontFamily: 'MontSerrat_1',
              fontSize: 22,
              color: MesCouleurs.primaire,
            ),
          ),
        ),
      ],
    );
  }
}
