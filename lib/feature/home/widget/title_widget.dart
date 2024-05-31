import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.sufixText = "voir plus",
    this.route = "/",
    this.voirPlus = true,
    required this.color,
  });

  final String title;
  final String sufixText;
  final String route;
  final bool voirPlus;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              TextStyle(color: color, fontSize: 30, fontFamily: 'Montserrat_1'),
        ),
        if (voirPlus)
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(
              sufixText,
              style: const TextStyle(color: MesCouleurs.noir),
            ),
          )
      ],
    );
  }
}
