import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class ReserverFilm extends StatefulWidget {
  const ReserverFilm({super.key});

  @override
  State<ReserverFilm> createState() => _ReserverFilmState();
}

class _ReserverFilmState extends State<ReserverFilm> {
  late Film film;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Récupération du film à partir des arguments de la route
    film = ModalRoute.of(context)!.settings.arguments as Film;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
