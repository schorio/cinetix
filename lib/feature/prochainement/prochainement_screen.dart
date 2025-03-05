import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/core/widget/title_tab_bar.dart';
import 'package:cinetix/feature/prochainement/widget/en_vote_widget.dart';
import 'package:cinetix/feature/prochainement/widget/proch_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ProchainementScreen extends StatefulWidget {
  const ProchainementScreen({super.key});

  @override
  State<ProchainementScreen> createState() => _ProchainementScreenState();
}

class _ProchainementScreenState extends State<ProchainementScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  List<Film> filmTrouverTab_1 = [];
  List<Film> filmTrouverTab_2 = [];

  void searchFilter(String entrer) {
    List<Film> resultat_1 = [];
    List<Film> resultat_2 = [];

    if (entrer.isEmpty) {
      resultat_1 = prochainement;
      resultat_2 = enProjection;
    } else {
      resultat_1 = prochainement
          .where(
            (element) => element.title.toLowerCase().contains(
                  entrer.toLowerCase(),
                ),
          )
          .toList();

      resultat_2 = enProjection
          .where(
            (element) => element.title.toLowerCase().contains(
                  entrer.toLowerCase(),
                ),
          )
          .toList();
    }
    filmTrouverTab_1 = resultat_1;
    filmTrouverTab_2 = resultat_2;
  }

  @override
  void initState() {
    filmTrouverTab_1 = prochainement;
    filmTrouverTab_2 = enProjection;
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurHash(
            hash: "LaQvwRay_3WB~qt7M{ofD%RjRjay",
            imageFit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25,
              bottom: 20,
            ),
            child: Column(
              children: [
                const TitlePage(title: "Prochainement"),
                const SizedBox(height: 20),
                MySearchBar(onChanged: searchFilter),
                const SizedBox(height: 5),
                TitleTabBar(
                  tabController: tabController,
                  color: MesCouleurs.primaire,
                  titles: const [
                    Tab(text: "Prochainement"),
                    Tab(text: "En vote"),
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProchGridWidget(resultat: filmTrouverTab_1),
                      EnVoteWidget(resultat: filmTrouverTab_2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
