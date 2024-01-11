import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'film.dart';

Future<List<Film>> fetchFilms(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://swapi.dev/api/films/?format=json'));

  return compute(parseFilms, response.body);
}

List<Film> parseFilms(String responseBody) {
  final parsed = jsonDecode(responseBody);

  var results = parsed['results'];

  return results.map<Film>((json) => Film.fromJson(json)).toList();
}

class people extends StatefulWidget {
  const people({super.key});

  @override
  State<people> createState() => _peopleState();
}

class _peopleState extends State<people> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FilmsList extends StatelessWidget {
  const FilmsList({super.key, required this.films});

  final List<Film> films;
  //final dynamic films;
  @override
  Widget build(BuildContext context) {
    //var results = films['results'];
    return ListView.builder(
      //itemCount: films.length,
      itemBuilder: (context, index) {
        // return Text(results[index]['title']);
        if (index < films.length) {
          var film = films[index];
          var title = film.title;

          var director = film.director;
          var producer = film.producer;
          var release_date = film.release_date;
          var opening_crawl = film.opening_crawl;
          var created = film.created;
          var edited = film.edited;

          
        }
      },
    );
  }
}
