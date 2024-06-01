import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:flutter/material.dart';

class BlocDetailsWidget extends StatelessWidget {
  const BlocDetailsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    String title = prochainement[index].title;
    if (title.length > 10) {
      title =
          '${title.substring(0, 12)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'MontSerrat_2',
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: const [
              Icon(
                Icons.local_fire_department_outlined,
                color: MesCouleurs.primaire,
                size: 12,
              ),
              SizedBox(width: 5),
              Text(
                'Marvel Studio',
                style: TextStyle(
                  fontSize: 10,
                  color: MesCouleurs.noir,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
