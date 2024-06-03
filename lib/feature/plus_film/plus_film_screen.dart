import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/plus_film/widget/list_film_widget.dart';
import 'package:flutter/material.dart';

class PlusFilmScreen extends StatelessWidget {
  const PlusFilmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MesCouleurs.blanc,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25,
        ),
        child: Column(
          children: const [
            TitlePage(title: "Plus de film"),
            SizedBox(height: 20),
            SearchBar(),
            ListFilmWidget(),
          ],
        ),
      ),
    );
  }
}
