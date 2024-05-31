import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/feature/home/widget/banner_widget.dart';
import 'package:cinetix/feature/home/widget/header_widget.dart';
import 'package:cinetix/feature/home/widget/title_widget.dart';
import 'package:cinetix/feature/home/widget/category_widget.dart';
import 'package:cinetix/feature/home/widget/sliderFilms_widget.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  PaletteGenerator? paletteGenerator;
  final String dominant = "assets/banner/1.jpg";

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    generateColors(dominant);
    super.initState();
  }

  void generateColors(String image) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
      size: const Size(200, 200),
      region: const Rect.fromLTRB(0, 0, 50, 50),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color couleurDominant = paletteGenerator != null
        ? paletteGenerator!.vibrantColor != null
            ? paletteGenerator!.vibrantColor!.color
            : MesCouleurs.primaire
        : MesCouleurs.primaire;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const BlurHash(
              hash: "LaQvwRay_3WB~qt7M{ofD%RjRjay",
              imageFit: BoxFit.cover,
            ),
            SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Header(color: couleurDominant),
                      ),
                      SearchBar(color: couleurDominant),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TitleWidget(
                          title: "Categories",
                          voirPlus: false,
                          color: couleurDominant,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: CategoryWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BannerWidget(
                          generateColors: generateColors,
                          color: couleurDominant,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TitleWidget(
                          title: "Films en salle",
                          route: AppRouteName.enSalle,
                          color: couleurDominant,
                        ),
                      ),
                      TabBar(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        labelPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05),
                        controller: tabController,
                        labelColor: MesCouleurs.noir,
                        labelStyle: const TextStyle(fontFamily: 'Montserrat_2'),
                        unselectedLabelStyle:
                            const TextStyle(fontFamily: 'Montserrat_3'),
                        unselectedLabelColor: MesCouleurs.noir,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: couleurDominant,
                        tabs: const [
                          Tab(text: "Complet"),
                          Tab(text: "Avant-première"),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: tabController,
                            children: [
                              SliderFilmsWidget(
                                  listFilms: enProjection,
                                  sHeight: 300,
                                  sViewPortFraction: 0.56),
                              SliderFilmsWidget(
                                  listFilms: avantPremiere,
                                  sHeight: 300,
                                  sViewPortFraction: 0.56),
                            ]),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TitleWidget(
                          title: "Prochainement",
                          color: couleurDominant,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SliderFilmsWidget(
                            listFilms: prochainement,
                            sHeight: 400,
                            sViewPortFraction: 0.7),
                      ),
                    ]))
          ],
        ));
  }
}
