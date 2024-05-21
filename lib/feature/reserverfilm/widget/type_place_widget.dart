import 'package:cinetix/core/model/place_model.dart';
import 'package:flutter/material.dart';

class TypePlaceWidget extends StatelessWidget {
  const TypePlaceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listeTypePlaces
          .map(
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                        color: index.couleur,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(index.type),
                  )
                ],
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}
