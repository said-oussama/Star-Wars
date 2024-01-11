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
  late Future<List<Film>> filmsFuture;
  List<Film> films = []; 

  @override
  void initState() {
    super.initState();
    filmsFuture = fetchFilms(http.Client());
    filmsFuture.then((value) {
      setState(() {
        films = value;
      });
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFFFFFFF)),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.sp),
          child: AppBar(
            backgroundColor: Color(0xFFEBEBEB),

            title: Padding(
              padding: EdgeInsets.all(39.sp),
              child: Container(
                width: 188.sp,
                height: 20.sp,
                child: Text(
                  "Think-it Star Wars",
                  style: TextStyle(
                    fontSize: 24.sp,
                    height: 20.sp /24.sp, 
                        

                    fontFamily:
                        'Archivo', 
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            Card(
              elevation: 4.sp, 
              color: Color(0xFF161615),
              shape: RoundedRectangleBorder(
                  
                  ),
              child: Container(
                height: 236.sp,
                width: 414.sp,
                child: Padding(
                  
                  padding: EdgeInsets.fromLTRB(9.sp, 0, 0, 0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      

                      Container(
                        width: 146.sp,
                        height: 146.sp,
                        child: Expanded(
                          child: Image(
                            image: AssetImage(
                              "assets/star_wars_logo_2.png",
                              
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                      ),

                      
                      
                      
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
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
