import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';

class DetailsFilm extends StatefulWidget {
  const DetailsFilm({super.key});

  @override
  State<DetailsFilm> createState() => _DetailsFilmState();
}

class _DetailsFilmState extends State<DetailsFilm> {
  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)?.settings.arguments as Film;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(film.assetImage), fit: BoxFit.fill)),
          )
        ],
      )),
    );
  }
}
