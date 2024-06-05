import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/categorieFilter/widget/details_widget.dart';
import 'package:cinetix/feature/categorieFilter/widget/pochette_widget.dart';
import 'package:flutter/material.dart';

class ListeFilmCategorieWidget extends StatefulWidget {
  const ListeFilmCategorieWidget({
    required this.resultat,
    Key? key,
  }) : super(key: key);

  final List<ToutFilm> resultat;

  @override
  State<ListeFilmCategorieWidget> createState() =>
      _ListeFilmCategorieWidgetState();
}

class _ListeFilmCategorieWidgetState extends State<ListeFilmCategorieWidget> {
  @override
  void initState() {
    widget.resultat
        .sort(((a, b) => a.contenue.title.compareTo(b.contenue.title)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: widget.resultat.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ToutFilm film = widget.resultat[index];

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

  Container filmItem(BuildContext context, ToutFilm film) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          PochetteWidget(
            film: film,
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.17,
          ),
          const SizedBox(width: 5),
          DetailsWidget(film: film),
        ],
      ),
    );
  }
}
