import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/place_model.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatefulWidget {
  const PlaceWidget({
    required this.couleurDominant,
    super.key,
  });
  final Color couleurDominant;

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < 2; i++) twoSection(i, 25),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              for (int i = 2; i < 4; i++) twoSection(i, 25),
            ],
          ),
        ],
      ),
    );
  }

  Expanded twoSection(int i, int itCount) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (_, index) {
          final seat = seats[i][index];
          final placeColor = seat.isHidden
              ? Colors.white
              : seat.isOccupied
                  ? Colors.black
                  : seat.isSelected
                      ? widget.couleurDominant
                      : Colors.grey.shade200;
          return GestureDetector(
            onTap: () {
              setState(() {
                seat.isSelected = !seat.isSelected;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: placeColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
