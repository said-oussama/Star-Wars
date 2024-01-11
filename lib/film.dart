class Film {
  final String director;
  final String title;

  final String producer;
  final String release_date;
  final String opening_crawl;
  final String created;
  final String edited;

  const Film({
    required this.director,
    required this.title,
    required this.producer,
    required this.release_date,
    required this.opening_crawl,
    required this.created,
    required this.edited,
  });

  factory Film.fromJson(Map<String, dynamic> json) {

    return Film(
      director: json['director'] as String,
      title: json['title'] as String,
      producer: json['producer'] as String,
      release_date: json['release_date'] as String,
      opening_crawl: json['opening_crawl'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
    );
  }
}
