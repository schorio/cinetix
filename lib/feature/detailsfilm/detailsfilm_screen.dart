import 'package:cinetix/core/design/app_color.dart';
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
      backgroundColor: MesCouleurs.blanc,
      body: Stack(
        children: [
          const BlurHash(
            hash: "LaQvwRay_3WB~qt7M{ofD%RjRjay",
            imageFit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.97,
            expand: true,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: MesCouleurs.primaire,
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.title,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: MesCouleurs.noir,
                                  fontFamily: 'MontSerrat_2'),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department_outlined,
                                  color: MesCouleurs.secondaire,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Marvel Studio',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: MesCouleurs.noir,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            FadeInUp(
                              delay: const Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        size: 25,
                                        index < 4
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: index < 4
                                            ? MesCouleurs.primaire
                                            : MesCouleurs.noir,
                                      );
                                    }),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "(4.0)",
                                    style: TextStyle(
                                        fontSize: 10, color: MesCouleurs.noir),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
