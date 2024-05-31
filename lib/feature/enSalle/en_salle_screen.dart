import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/enSalle/widget/card_slider_widget.dart';
import 'package:cinetix/feature/enSalle/widget/title_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class EnSalle extends StatefulWidget {
  const EnSalle({super.key});

  @override
  State<EnSalle> createState() => _EnSalleState();
}

class _EnSalleState extends State<EnSalle> with TickerProviderStateMixin {
  late final TabController tabController;
  PaletteGenerator? paletteGenerator;
  int selected = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    generateColors(selected);
    super.initState();
  }

  void generateColors(int index) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(enProjection[index].assetImage),
      size: const Size(100, 100),
      region: const Rect.fromLTRB(0, 0, 50, 50),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color couleurDominant = paletteGenerator != null
        ? paletteGenerator!.darkVibrantColor != null
            ? paletteGenerator!.darkVibrantColor!.color
            : MesCouleurs.noir
        : MesCouleurs.noir;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MesCouleurs.blanc,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25,
              bottom: 20,
            ),
            child: Column(
              children: [
                TitlePage(
                  title: "Les films en salle",
                  color: couleurDominant,
                ),
                const SizedBox(height: 20),
                TitleTabBar(
                  tabController: tabController,
                  color: couleurDominant,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      CardSliderWidget(
                        listFilm: enProjection,
                        color: couleurDominant,
                        generateColors: generateColors,
                      ),
                      CardSliderWidget(
                        listFilm: avantPremiere,
                        color: couleurDominant,
                        generateColors: generateColors,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
