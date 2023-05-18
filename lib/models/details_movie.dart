class DetailsMovie {
  final String title;
  final String releaseDate;
  final String overview;
  final String posterUrl;

  DetailsMovie({
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterUrl,
  });

  factory DetailsMovie.fromJson(Map<String, dynamic> json) {
    return DetailsMovie(
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] ?? '',
      posterUrl: json['poster_url'] ?? '',
    );
  }
}
