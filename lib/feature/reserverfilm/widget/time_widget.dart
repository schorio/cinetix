import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/time_model.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.selectedTime,
    required this.couleurDominant,
  }) : super(key: key);

  final ValueNotifier<TimeOfDay?> selectedTime;
  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TimeOfDay?>(
      valueListenable: selectedTime,
      builder: (context, value, _) {
        return SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: timeReservation.map(
              (index) {
                bool isSelected = (selectedTime.value ==
                    TimeOfDay(
                      hour: index.hour,
                      minute: index.minute,
                    ));
                return InkWell(
                  onTap: () {
                    selectedTime.value =
                        TimeOfDay(hour: index.hour, minute: index.minute);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? couleurDominant.withOpacity(0.8)
                          : couleurDominant.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? couleurDominant.withOpacity(0.01)
                            : couleurDominant.withOpacity(0.01),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: couleurDominant.withOpacity(0.01),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Text(
                        "${index.hour < 10 ? "0${index.hour}" : "${index.hour}"} : ${index.minute < 10 ? "0${index.minute}" : "${index.minute}"}",
                        style: TextStyle(
                          color:
                              isSelected ? MesCouleurs.blanc : couleurDominant,
                          fontSize: 13,
                          fontFamily:
                              isSelected ? 'MontSerrat_2' : 'MontSerrat_3',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
