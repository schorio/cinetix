import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

class ListeFilmCategorieWidget extends StatefulWidget {
  const ListeFilmCategorieWidget({
    required this.resultat,
    Key? key,
  }) : super(key: key);

  final List<Film> resultat;

  @override
  State<ListeFilmCategorieWidget> createState() =>
      _ListeFilmCategorieWidgetState();
}

class _ListeFilmCategorieWidgetState extends State<ListeFilmCategorieWidget> {
  bool condition = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: widget.resultat.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Film film = widget.resultat[index];

              Navigator.pushNamed(
                context,
                AppRouteName.detailsFilm,
                arguments: film,
              );
            },
            child: filmItem(context, widget.resultat[index]),
          );
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

  Container filmItem(BuildContext context, Film film) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Hero(
            tag: film.assetImage,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.28,
              height: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    film.assetImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
