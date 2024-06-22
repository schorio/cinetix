import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double height;
  final String route;
  final Color iconColor;

  const MyButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.height,
    required this.route,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: iconColor,
            size: 27,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 17,
            ),
          ),
        ],
      ),
      onPressed: () {
        Color themeColor = iconColor;
        Navigator.pushNamed(
          context,
          route,
          arguments: themeColor,
        );
      },
    );
  }
}
