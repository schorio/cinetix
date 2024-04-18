import 'package:flutter/material.dart';

class IndicatorScroll extends StatelessWidget {
  const IndicatorScroll({
    required this.couleur,
    Key? key,
  }) : super(key: key);

  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: <Widget>[
          Container(
            width: 100,
            margin: const EdgeInsets.only(bottom: 15, top: 10),
            height: 5,
            decoration: BoxDecoration(
              color: couleur,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
