import 'package:flutter/material.dart';

import 'film.dart';

class film_details extends StatefulWidget {
  //film_details({ required this.film});

  const film_details({super.key, required this.film});

  //film_details({required Key Key, required this.films}) : super(key: key);
  final Film film;
  //const film_details({super.key});

  @override
  State<film_details> createState() => _film_detailsState();
}

class _film_detailsState extends State<film_details> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}