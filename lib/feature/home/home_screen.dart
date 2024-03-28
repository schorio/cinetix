import 'package:flutter/material.dart';
import 'package:cinetix/feature/home/widget/banner_widget.dart';
import 'package:cinetix/feature/home/widget/header_widget.dart';
import 'package:cinetix/feature/home/widget/search_widget.dart';
import 'package:cinetix/feature/home/widget/title_widget.dart';
import 'package:cinetix/feature/home/widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                    padding: EdgeInsets.all(20),
                    child: BannerWidget(),
                  )
                ])));
  }
}
