import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  final category = const [
    "Horror",
    "Action",
    "Comedy",
    "Romance",
    "test test",
    "test test",
    "test test",
    "test test",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          category.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: MesCouleurs.secondaire, width: 4),
                  borderRadius: BorderRadius.circular(15),
                  color: MesCouleurs.secondaire),
              child: Text(
                category[index],
                style: const TextStyle(
                  color: MesCouleurs.noir,
                  fontFamily: 'MontSerrat_3',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
