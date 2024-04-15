import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Ciné",
          style: TextStyle(
              color: MesCouleurs.noir,
              fontSize: 40,
              fontFamily: 'Montserrat_1'),
        ),
        Text(
          "Tix",
          style: TextStyle(
              color: MesCouleurs.primaire,
              fontSize: 40,
              fontFamily: 'Montserrat_1'),
        ),
        Spacer(),
        CircleAvatar(
          backgroundImage: AssetImage('assets/profile.jpg'),
          radius: 25,
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: MesCouleurs.primaire,
              radius: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}
