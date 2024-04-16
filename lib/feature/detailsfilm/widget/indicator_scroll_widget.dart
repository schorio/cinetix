import 'package:flutter/material.dart';

class IndicatorScroll extends StatelessWidget {
  const IndicatorScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: <Widget>[
          Container(
            width: 100,
            margin: const EdgeInsets.only(bottom: 15, top: 10),
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.black45,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
