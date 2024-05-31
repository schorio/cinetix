import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class TitleTabBar extends StatelessWidget {
  const TitleTabBar({
    Key? key,
    required this.tabController,
    required this.color,
  }) : super(key: key);

  final TabController tabController;
  final Color color;

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
      indicatorColor: color,
      tabs: const [
        Tab(text: "Complet"),
        Tab(text: "Avant-première"),
      ],
    );
  }
}
