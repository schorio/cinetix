import 'package:cinetix/core/model/film_model.dart';

class Ticket {
  final Film film;
  final List<String> places;
  final String type;

  Ticket({
    required this.film,
    required this.places,
    required this.type,
  });
}

List<Ticket> lesTickets = [
  Ticket(
    film: prochainement[0],
    places: ["A5", "B8", "A2"],
    type: "Valider",
  ),
  Ticket(
    film: prochainement[3],
    places: ["A5", "A5"],
    type: "En examination",
  ),
  Ticket(
    film: prochainement[1],
    places: ["A3", "B2"],
    type: "Valider",
  ),
  Ticket(
    film: prochainement[0],
    places: ["B7", "A8"],
    type: "Valider",
  ),
  Ticket(
    film: prochainement[2],
    places: ["A5", "B8", "A2"],
    type: "En examination",
  ),
  Ticket(
    film: prochainement[1],
    places: ["A5", "B6", "A1"],
    type: "En examination",
  ),
  Ticket(
    film: prochainement[3],
    places: ["A5", "A9"],
    type: "Valider",
  ),
];
