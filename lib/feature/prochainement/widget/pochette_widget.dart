import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class PochetteWidget extends StatelessWidget {
  const PochetteWidget({
    required this.width,
    required this.height,
    required this.film,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final Film film;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: film.assetImage,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              film.assetImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
