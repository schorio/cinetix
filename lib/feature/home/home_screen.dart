import 'package:flutter/material.dart';
import 'package:cinetix/feature/home/widget/banner_widget.dart';
import 'package:cinetix/feature/home/widget/header_widget.dart';
import 'package:cinetix/feature/home/widget/search_widget.dart';
import 'package:cinetix/feature/home/widget/title_widget.dart';
import 'package:cinetix/feature/home/widget/category_widget.dart';
import 'package:cinetix/feature/home/widget/ensalle_widget.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset("assets/background/7.mp4");

  late ChewieController chewieController;
  late double aspectRatio;
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    aspectRatio = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    aspectRatio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: aspectRatio,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Expanded(
                child: Chewie(
              controller: chewieController,
            )),
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
                        child: TitleWidget(title: "Category"),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TitleWidget(title: "Prochainement"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SliderFilmsWidget(listFilms: prochainement),
                      ),
                    ]))
          ],
        ));
  }
}
