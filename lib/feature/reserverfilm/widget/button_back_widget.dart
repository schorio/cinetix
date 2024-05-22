import 'package:flutter/material.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({
    Key? key,
    required this.couleurDominant,
  }) : super(key: key);

  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 25,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: couleurDominant,
          size: 30,
        ),
      ),
    );
  }
}
