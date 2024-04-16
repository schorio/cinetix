import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/feature/detailsfilm/widget/evaluation_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/genre_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/indicator_scroll_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/synopsis_widget.dart';
import 'package:cinetix/feature/detailsfilm/widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:animate_do/animate_do.dart';

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
      backgroundColor: MesCouleurs.noir,
      body: Stack(
        children: [
          Hero(
            tag: film.assetImage,
            child: Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(film.assetImage),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: DraggableScrollableSheet(
              initialChildSize: 0.42,
              minChildSize: 0.42,
              maxChildSize: 0.97,
              expand: true,
              snap: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: MesCouleurs.blanc,
                    boxShadow: [
                      BoxShadow(
                        color: MesCouleurs.primaire,
                        blurRadius: 3,
                        spreadRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 400),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const IndicatorScroll(),
                            TitleWidget(film: film),
                            const SizedBox(height: 10),
                            EvaluationWidget(film: film),
                            const SizedBox(height: 20),
                            GenreWidget(film: film),
                            const SizedBox(height: 20),
                            SynopsisWidget(film: film)
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
