import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/core/widget/title_tab_bar.dart';
import 'package:cinetix/feature/prochainement/widget/en_vote_widget.dart';
import 'package:cinetix/feature/prochainement/widget/proch_grid_widget.dart';
import 'package:flutter/material.dart';

class ProchainementScreen extends StatefulWidget {
  const ProchainementScreen({super.key});

  @override
  State<ProchainementScreen> createState() => _ProchainementScreenState();
}

class _ProchainementScreenState extends State<ProchainementScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
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
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25,
          bottom: 20,
        ),
        child: Column(
          children: [
            const TitlePage(title: "Prochainement"),
            const SizedBox(height: 20),
            const SearchBar(),
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
                children: const [
                  ProchGridWidget(),
                  EnVoteWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
