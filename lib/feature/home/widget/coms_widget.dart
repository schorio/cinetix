import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class ComsWidget extends StatefulWidget {
  const ComsWidget({
    super.key,
    required this.film,
    required this.couleurDominant,
  });

  final Film film;
  final Color couleurDominant;

  @override
  State<ComsWidget> createState() => _ComsWidgetState();
}

class _ComsWidgetState extends State<ComsWidget> {
  int comsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Commentaires",
          style: TextStyle(
            fontSize: 20,
            color: widget.couleurDominant,
            fontFamily: 'MontSerrat_1',
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: widget.film.commentaires.length,
          options: CarouselOptions(
            height: 130,
            initialPage: comsIndex,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                comsIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, _) {
            return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.couleurDominant.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(15),
                color: MesCouleurs.secondaire.withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35.0,
                        width: 35.0,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                widget.film.commentaires[index].avatar),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(44.0),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.film.commentaires[index].nom,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: widget.couleurDominant,
                              fontFamily: 'MontSerrat_2',
                            ),
                          ),
                          Text(
                            widget.film.commentaires[index].date,
                            style: const TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.film.commentaires[index].commentaire,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
