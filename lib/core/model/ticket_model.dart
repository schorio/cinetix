import 'package:cinetix/core/model/film_model.dart';

class Ticket {
  final Film film;
  final List<String> places;
  final bool valider;

  Ticket({
    required this.film,
    required this.places,
    required this.valider,
  });
}

List<Ticket> lesTickets = [
  Ticket(
    film: prochainement[0],
    places: ["A5", "B8", "A2"],
    valider: true,
  ),
  Ticket(
    film: prochainement[3],
    places: ["A5", "A5"],
    valider: false,
  ),
  Ticket(
    film: prochainement[1],
    places: ["A3", "B2"],
    valider: true,
  ),
  Ticket(
    film: prochainement[0],
    places: ["B7", "A8"],
    valider: true,
  ),
  Ticket(
    film: prochainement[2],
    places: ["A5", "B8", "A2"],
    valider: false,
  ),
  Ticket(
    film: prochainement[1],
    places: ["A5", "B6", "A1"],
    valider: false,
  ),
  Ticket(
    film: prochainement[3],
    places: ["A5", "A9"],
    valider: true,
  ),
];
