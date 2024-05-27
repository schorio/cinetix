import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/enSalle/widget/card_slider_widget.dart';
import 'package:cinetix/feature/enSalle/widget/title_slider_widget.dart';
import 'package:cinetix/feature/enSalle/widget/title_tabbar_widget.dart';
import 'package:flutter/material.dart';

class EnSalle extends StatefulWidget {
  const EnSalle({super.key});

  @override
  State<EnSalle> createState() => _EnSalleState();
}

class _EnSalleState extends State<EnSalle> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                const TitlePage(title: "Les films en salle"),
                const SizedBox(height: 25),
                const SearchBar(),
                const SizedBox(height: 20),
                TitleTabBar(tabController: tabController),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      CardSliderWidget(listFilm: enProjection),
                      CardSliderWidget(listFilm: avantPremiere),
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
