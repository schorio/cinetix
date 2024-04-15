import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: 'Recherche',
        hintStyle: const TextStyle(
            color: MesCouleurs.noir, fontSize: 15, fontFamily: 'Montserrat_3'),
        prefixIcon: const Icon(
          Icons.search,
          color: MesCouleurs.primaire,
          size: 24,
        ),
      ),
    );
  }
}
