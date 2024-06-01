import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class PochetteWidget extends StatelessWidget {
  const PochetteWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            prochainement[index].assetImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
