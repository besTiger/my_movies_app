class Description {
  final String title;
  final String releaseDate;
  final String overview;
  final String posterUrl;
  final List<Actor> actors;

  Description({
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterUrl,
    required this.actors,
  });
}

class Actor {
  final String name;
  final String character;
  final String profileUrl;

  Actor({
    required this.name,
    required this.character,
    required this.profileUrl,
  });
}
