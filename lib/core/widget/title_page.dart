import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.title,
    this.color = MesCouleurs.primaire,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: color,
              size: 30,
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'MontSerrat_1',
                fontSize: 22,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
