import 'package:flutter/material.dart';
import 'package:cinetix/core/design/app_color.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.onChanged,
    this.color = MesCouleurs.primaire,
  }) : super(key: key);

  final Color color;
  final Function(String) onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: (value) => widget.onChanged(value),
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
            color: widget.color,
            size: 24,
          ),
        ),
      ),
    );
  }
}
