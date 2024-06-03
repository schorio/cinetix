import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/feature/plus_film/widget/film_details_widget.dart';
import 'package:flutter/material.dart';

class ListFilmWidget extends StatefulWidget {
  const ListFilmWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListFilmWidget> createState() => _ListFilmWidgetState();
}

class _ListFilmWidgetState extends State<ListFilmWidget> {
  bool condition = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        itemCount: prochainement.length,
        itemBuilder: (context, index) {
          Film film = enProjection[index];
          return filmItem(context, film);
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: MesCouleurs.secondaire,
            thickness: 1,
          );
        },
      ),
    );
  }

  SizedBox filmItem(BuildContext context, Film film) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilmDetailsWidget(film: film),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    condition = !condition;
                  });
                },
                child: Icon(
                  condition == true
                      ? Icons.how_to_vote_rounded
                      : Icons.check_circle_rounded,
                  size: 30,
                  color: MesCouleurs.noir,
                ),
              ),
            )
          ],
        ));
  }
}
