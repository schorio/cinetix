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
    film: enProjection[0],
    places: ["A33", "A33"],
    valider: false,
  ),
];

List<Ticket> lesTicketss = [];
