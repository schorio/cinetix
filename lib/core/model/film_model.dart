import 'package:cinetix/core/model/coms_model.dart';
import 'package:cinetix/core/model/date_model.dart';

class Film {
  final String title;
  final String studio;
  final String assetImage;
  final List<String> genre;
  final String duration;
  final int rating;
  final int vote;
  final String synopsis;
  final bool isPlaying;
  final String trailer;
  final List<String> actor;
  final List<ComsModel> commentaires;
  final List<Date> date;

  Film({
    required this.title,
    required this.studio,
    required this.assetImage,
    required this.genre,
    required this.duration,
    required this.rating,
    required this.vote,
    required this.synopsis,
    required this.isPlaying,
    required this.trailer,
    required this.actor,
    required this.commentaires,
    required this.date,
  });
}

class ToutFilm {
  final String classe;
  final Film contenue;

  ToutFilm(
    this.classe,
    this.contenue,
  );
}

List<ToutFilm> toutFilm = [
  ...enProjection.map((e) => ToutFilm('En projection', e)),
  ...prochainement.map((e) => ToutFilm('Prochainement', e)),
  ...avantPremiere.map((e) => ToutFilm('Avant premiere', e))
];

List<Film> prochainement = [
  Film(
    title: "Shang-Chi",
    studio: "Marvel Studio",
    assetImage: "assets/film/shang-chi.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 27m",
    rating: 3,
    vote: 6,
    synopsis:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Dune",
    studio: "Marvel Studio",
    assetImage: "assets/film/dune.jpg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 59m",
    rating: 3,
    vote: 6,
    synopsis:
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Aladin 2",
    studio: "Marvel Studio",
    assetImage: "assets/film/aladdin_2.jpg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Greta",
    studio: "Marvel Studio",
    assetImage: "assets/film/greta.jpg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
];

List<Film> enProjection = [
  Film(
    title: "Minions: The Rise of Gru",
    studio: "Marvel Studio",
    assetImage: "assets/film/minion.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 27m",
    rating: 3,
    vote: 6,
    synopsis:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Thor: Love and Thunder",
    studio: "Marvel Studio",
    assetImage: "assets/film/thor.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 59m",
    rating: 3,
    vote: 6,
    synopsis:
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Jurassic World Dominion",
    studio: "Marvel Studio",
    assetImage: "assets/film/jurassic.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Lives",
    studio: "Marvel Studio",
    assetImage: "assets/film/lives.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
];

List<Film> avantPremiere = [
  Film(
    title: "Aladdin",
    studio: "Marvel Studio",
    assetImage: "assets/film/aladdin.jpg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 27m",
    rating: 3,
    vote: 6,
    synopsis:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Detective",
    studio: "Marvel Studio",
    assetImage: "assets/film/detective.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "1h 59m",
    rating: 3,
    vote: 6,
    synopsis:
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "Narcos",
    studio: "Marvel Studio",
    assetImage: "assets/film/narcos.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
  Film(
    title: "SUper Pets",
    studio: "Marvel Studio",
    assetImage: "assets/film/super-pets.jpeg",
    genre: ["Action", "Drame", "Comedie"],
    actor: [
      "Jason Statham",
      "Zendaya",
      "Tom Holland",
      "Jason Momoa",
      "John Cena"
    ],
    duration: "2h 29m",
    rating: 3,
    vote: 6,
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
    trailer: "assets/trailer/trailer.mp4",
    commentaires: coms,
    date: dateReservation,
  ),
];
