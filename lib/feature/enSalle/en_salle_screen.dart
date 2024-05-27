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
  late final PageController _movieCardPageController;
  late final PageController _movieTitlePageController;

  double _movieCardPage = 0.0;
  int _movieCardIndex = 0;
  // ignore: unused_field
  double _movieTitlePage = 0.0;

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieTitlePagePercentListener() {
    setState(() {
      _movieTitlePage = _movieTitlePageController.page!;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);

    _movieTitlePageController = PageController()
      ..addListener(_movieTitlePagePercentListener);
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieTitlePageController
      ..removeListener(_movieTitlePagePercentListener)
      ..dispose();
    super.dispose();
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
                      Column(
                        children: [
                          CardSliderWidget(
                            movieCardPageController: _movieCardPageController,
                            movieCardPage: _movieCardPage,
                            movieCardIndex: _movieCardIndex,
                            movieTitlePageController: _movieTitlePageController,
                          ),
                          TitleSliderWidget(
                            movieTitlePageController: _movieTitlePageController,
                          ),
                        ],
                      ),
                      Container()
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
