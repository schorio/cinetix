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
          "Hi, Schorio",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundImage: AssetImage('assets/profile.jpg'),
          radius: 25,
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Color(0xFF7c44c2),
              radius: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}
