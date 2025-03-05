import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/plus_film/widget/list_film_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class PlusFilmScreen extends StatefulWidget {
  const PlusFilmScreen({super.key});

  @override
  State<PlusFilmScreen> createState() => _PlusFilmScreenState();
}

class _PlusFilmScreenState extends State<PlusFilmScreen> {
  List<Film> filmTrouver = [];

  @override
  void initState() {
    filmTrouver = enProjection;
    super.initState();
  }

  void searchFilter(String entrer) {
    List<Film> resultat = [];
    if (entrer.isEmpty) {
      resultat = enProjection;
    } else {
      resultat = enProjection
          .where(
            (element) => element.title.toLowerCase().contains(
                  entrer.toLowerCase(),
                ),
          )
          .toList();
    }
    filmTrouver = resultat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MesCouleurs.blanc,
      body: Stack(
        children: [
          const BlurHash(
            hash: "LaQvwRay_3WB~qt7M{ofD%RjRjay",
            imageFit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25,
            ),
            child: Column(
              children: [
                const TitlePage(title: "Plus de film"),
                const SizedBox(height: 20),
                MySearchBar(onChanged: searchFilter),
                ListFilmWidget(resultat: filmTrouver),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
