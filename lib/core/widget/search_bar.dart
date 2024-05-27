import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.color = MesCouleurs.primaire,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: 'Recherche',
          hintStyle: const TextStyle(
              color: MesCouleurs.noir,
              fontSize: 15,
              fontFamily: 'Montserrat_3'),
          prefixIcon: Icon(
            Icons.search,
            color: color,
            size: 24,
          ),
        ),
      ),
    );
  }
}
