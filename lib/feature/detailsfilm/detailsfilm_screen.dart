import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/feature/detailsfilm/widget/background_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/evaluation_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/genre_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/indicator_scroll_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/indicatorpochette_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/pochette_viewer_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/pochetteslider_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/synopsis_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/title_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/trailer_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:video_player/video_player.dart';

class DetailsFilm extends StatefulWidget {
  const DetailsFilm({super.key});

  @override
  State<DetailsFilm> createState() => _DetailsFilmState();
}

class _DetailsFilmState extends State<DetailsFilm> {
  PageController pochetteController = PageController(initialPage: 0);
  PaletteGenerator? paletteGenerator;
  late Film film;
  int selected = 0;
  VideoPlayerController? _trailerController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Récupération du film à partir des arguments de la route
    film = ModalRoute.of(context)!.settings.arguments as Film;
    generateColors();
    trailerVideo();
  }

  void generateColors() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(film.assetImage),
      size: const Size(100, 100),
      region: const Rect.fromLTRB(0, 0, 50, 50),
    );

    setState(() {});
  }

  void trailerVideo() {
    _trailerController = VideoPlayerController.asset(film.trailer)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _trailerController?.dispose();
    pochetteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color couleurDominant = paletteGenerator != null
        ? paletteGenerator!.darkVibrantColor != null
            ? paletteGenerator!.darkVibrantColor!.color
            : MesCouleurs.noir
        : MesCouleurs.noir;

    final listPochette = [film.assetImage, film.trailer];

    return Scaffold(
      backgroundColor: couleurDominant.withOpacity(0.5),
      body: Stack(
        children: [
          BackgroundWidget(
            film: film,
            couleurDominant: couleurDominant,
          ),
          PageView.builder(
            controller: pochetteController,
            itemCount: listPochette.length,
            onPageChanged: (value) {
              setState(() {
                selected = value;
              });
              if (selected == 1 &&
                  _trailerController != null &&
                  _trailerController!.value.isInitialized) {
                _trailerController!.play();
              } else {
                _trailerController?.pause();
              }
            },
            itemBuilder: (context, index) {
              if (listPochette[index] == film.trailer) {
                return TrailerViewerWidget(
                  trailerController: _trailerController,
                );
              } else {
                return PochetteViewerWidget(film: film);
              }
            },
          ),
          IndicatorPochetteWidget(
            listPochette: listPochette,
            selected: selected,
            couleurDominant: couleurDominant,
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: DraggableScrollableSheet(
              initialChildSize: 0.32,
              minChildSize: 0.32,
              maxChildSize: 0.97,
              expand: true,
              snap: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: MesCouleurs.secondaire.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: couleurDominant,
                        blurRadius: 3,
                        spreadRadius: 3,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 20),
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 400),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IndicatorScroll(couleur: couleurDominant),
                            TitleWidget(
                              film: film,
                              couleur: couleurDominant,
                              controller: pochetteController,
                              selected: selected,
                            ),
                            const SizedBox(height: 10),
                            EvaluationWidget(
                              film: film,
                              couleur: couleurDominant,
                            ),
                            const SizedBox(height: 20),
                            GenreWidget(
                              film: film,
                              couleur_1: couleurDominant,
                              couleur_2:
                                  MesCouleurs.secondaire.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            SynopsisWidget(
                              film: film,
                              couleur: couleurDominant,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
