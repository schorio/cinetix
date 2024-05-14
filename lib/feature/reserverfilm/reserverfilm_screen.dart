import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/feature/detailsfilm/widget/boutton_reserver_widget.dart';
import 'package:flutter/material.dart';

class ReserverFilm extends StatefulWidget {
  const ReserverFilm({
    super.key,
  });

  @override
  State<ReserverFilm> createState() => _ReserverFilmState();
}

class _ReserverFilmState extends State<ReserverFilm> {
  // late Film film;
  late Color couleurDominant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Récupération du film à partir des arguments de la route
    // film = ModalRoute.of(context)!.settings.arguments as Film;
    couleurDominant = ModalRoute.of(context)!.settings.arguments as Color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MesCouleurs.secondaire.withOpacity(0.9),
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 117,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: 155,
                decoration: BoxDecoration(
                  color: couleurDominant,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                    'Reserver',
                    style: TextStyle(
                      color: MesCouleurs.blanc,
                      fontFamily: 'MontSerrat_2',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
