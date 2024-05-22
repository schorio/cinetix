import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/date_model.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/model/place_model.dart';
import 'package:cinetix/core/model/time_model.dart';
import 'package:cinetix/feature/detailsfilm/widget/boutton_reserver_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/button_back_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/date_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/place_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/screen_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/time_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/title_page_widget.dart';
import 'package:cinetix/feature/reserverfilm/widget/type_place_widget.dart';
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
    final selectedDate = ValueNotifier<DateTime>(DateTime.now());
    final selectedTime = ValueNotifier<TimeOfDay?>(null);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ButtonBackWidget(couleurDominant: couleurDominant),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 20,
            ),
            child: Column(
              children: [
                TitlePageWidget(couleurDominant: couleurDominant),
                const SizedBox(height: 25),
                ScreenWidget(couleurDominant: couleurDominant),
                const SizedBox(height: 0),
                PlaceWidget(couleurDominant: couleurDominant),
                const SizedBox(height: 20),
                TypePlaceWidget(couleurDominant: couleurDominant),
                const SizedBox(height: 30),
                DateWidget(
                  couleurDominant: couleurDominant,
                  selectedDate: selectedDate,
                ),
                const SizedBox(height: 10),
                TimeWidget(
                  selectedTime: selectedTime,
                  couleurDominant: couleurDominant,
                ),
              ],
            ),
          ),
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
