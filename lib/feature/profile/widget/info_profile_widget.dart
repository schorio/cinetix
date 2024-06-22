import 'package:flutter/material.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
