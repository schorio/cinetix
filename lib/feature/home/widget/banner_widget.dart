import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int showedIndex = 0;

  final banners = [
    "assets/banner/1.jpg",
    "assets/banner/2.jpg",
    "assets/banner/3.jpeg",
    "assets/banner/4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: banners.length,
            options: CarouselOptions(
              initialPage: showedIndex,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  showedIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(
                        banners[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 35,
            bottom: 16,
            child: Row(
              children: List.generate(
                banners.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: showedIndex == index ? 24 : 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: showedIndex == index
                          ? MesCouleurs.primaire
                          : MesCouleurs.blanc,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
