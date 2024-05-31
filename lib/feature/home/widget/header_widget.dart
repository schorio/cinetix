import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Ciné",
          style: TextStyle(
              color: MesCouleurs.noir,
              fontSize: 40,
              fontFamily: 'Montserrat_1'),
        ),
        Text(
          "Tix",
          style:
              TextStyle(color: color, fontSize: 40, fontFamily: 'Montserrat_1'),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundImage: const AssetImage('assets/profile.jpg'),
          radius: 25,
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}
