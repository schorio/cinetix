import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/categorieFilter/widget/sous_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CategorieFilterScreen extends StatelessWidget {
  const CategorieFilterScreen({super.key});

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
            children: const [
              TitlePage(title: "Liste des films"),
              SizedBox(height: 25),
              SousTitleWidget(),
            ],
          ),
        )
      ]),
    );
  }
}
