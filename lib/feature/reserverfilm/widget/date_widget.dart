import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/date_model.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.couleurDominant,
    required this.selectedDate,
  }) : super(key: key);

  final Color couleurDominant;
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Selectionner la date",
          style: TextStyle(
            color: couleurDominant,
            fontFamily: "MontSerrat_1",
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        ValueListenableBuilder<DateTime>(
          valueListenable: selectedDate,
          builder: (context, value, _) {
            return SizedBox(
              height: 95,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dateReservation.map((index) {
                  final bool isSelected = (selectedDate.value ==
                      DateTime(index.j, index.m, index.A));
                  return InkWell(
                    onTap: () {
                      selectedDate.value = DateTime(index.j, index.m, index.A);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? couleurDominant.withOpacity(0.8)
                            : couleurDominant.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                index.J,
                                style: TextStyle(
                                  fontFamily: 'MontSerrat_2',
                                  color: isSelected
                                      ? MesCouleurs.blanc
                                      : MesCouleurs.noir,
                                ),
                              ),
                              Text(
                                index.M,
                                style: TextStyle(
                                  fontSize: 7,
                                  color: isSelected
                                      ? MesCouleurs.blanc
                                      : couleurDominant,
                                ),
                              ),
                            ],
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.white60
                                  : couleurDominant.withOpacity(0.1),
                              border: Border.all(
                                color: isSelected
                                    ? couleurDominant.withOpacity(0.01)
                                    : couleurDominant.withOpacity(0.01),
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              index.j.toString(),
                              style: TextStyle(
                                color: couleurDominant,
                                fontFamily: 'MontSerrat_1',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        )
      ],
    );
  }
}
