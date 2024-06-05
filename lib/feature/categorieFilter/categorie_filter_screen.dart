import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/categorieFilter/widget/list_film_categorie_widget.dart';
import 'package:cinetix/feature/categorieFilter/widget/sous_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CategorieFilterScreen extends StatefulWidget {
  const CategorieFilterScreen({super.key});

  @override
  State<CategorieFilterScreen> createState() => _CategorieFilterScreenState();
}

class _CategorieFilterScreenState extends State<CategorieFilterScreen> {
  late String categorie;

  @override
  void didChangeDependencies() {
    categorie = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
              const TitlePage(title: "Liste des films"),
              const SizedBox(height: 25),
              SousTitleWidget(titleCategorie: categorie),
              const SizedBox(height: 20),
              ListeFilmCategorieWidget(resultat: enProjection)
            ],
          ),
        )
      ]),
    );
  }
}
