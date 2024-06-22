import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MesCouleurs.primaire.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: MesCouleurs.primaire,
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
