import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class PochetteViewerWidget extends StatelessWidget {
  const PochetteViewerWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 55,
        left: 30,
        right: 30,
        bottom: 305,
      ),
      child: Hero(
        tag: film.assetImage,
        child: Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(film.assetImage),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
