import 'package:cinetix/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.sufixText = "voir plus",
    this.route = "/",
    this.voirPlus = true,
  });

  final String title;
  final String sufixText;
  final String route;
  final bool voirPlus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: MesCouleurs.primaire,
              fontSize: 30,
              fontFamily: 'Montserrat_1'),
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
