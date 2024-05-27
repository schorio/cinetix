import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class TitleTabBar extends StatelessWidget {
  const TitleTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      controller: tabController,
      labelColor: MesCouleurs.noir,
      labelStyle: const TextStyle(fontFamily: 'Montserrat_2'),
      unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat_3'),
      unselectedLabelColor: MesCouleurs.noir,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: MesCouleurs.primaire,
      tabs: const [
        Tab(text: "Complet"),
        Tab(text: "Avant-première"),
      ],
    );
  }
}
