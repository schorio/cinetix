import 'package:flutter/material.dart';
import 'package:cinetix/feature/home/widget/banner_widget.dart';
import 'package:cinetix/feature/home/widget/header_widget.dart';
import 'package:cinetix/feature/home/widget/search_widget.dart';
import 'package:cinetix/feature/home/widget/title_widget.dart';
import 'package:cinetix/feature/home/widget/category_widget.dart';
import 'package:cinetix/feature/home/widget/sliderFilms_widget.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
                        child: Column(
                          children: const [
                            Header(),
                            SizedBox(height: 20),
                            Search(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TitleWidget(
                          title: "Category",
                          voirPlus: false,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 5),
                        child: CategoryWidget(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: BannerWidget(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TitleWidget(title: "Films en salle"),
                      ),
                      TabBar(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        labelPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05),
                        controller: tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
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
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TitleWidget(title: "Prochainement"),
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
