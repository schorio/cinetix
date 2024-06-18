import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double height;

  const MyButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.height,
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
            color: Colors.black45,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 18,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
