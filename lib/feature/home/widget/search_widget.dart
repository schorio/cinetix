import 'package:flutter/material.dart';

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
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
