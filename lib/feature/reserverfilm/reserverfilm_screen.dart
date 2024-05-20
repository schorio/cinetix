import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/model/place_model.dart';
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
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 300,
            child: Row(
              children: [
                for (int i = 0; i < 2; i++)
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (_, index) {
                        final seat = seats[i][index];
                        final placeColor = seat.isHidden
                            ? Colors.white
                            : seat.isOccupied
                                ? Colors.black
                                : seat.isSelected
                                    ? MesCouleurs.primaire
                                    : Colors.grey.shade200;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              seat.isSelected = !seat.isSelected;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: placeColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
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
