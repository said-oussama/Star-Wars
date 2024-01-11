import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'film.dart';
import 'film_details.dart';

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

                      SizedBox(
                          height:
                              30.sp), 
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            

                            child: Text(
                              "Total ${films.length} Movies",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily:
                                    'Archivo', 
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD8D8D8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Film>>(
                future: fetchFilms(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    // Pass the data to onDataLoaded

                    return FilmsList(films: snapshot.data!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
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

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => film_details(film: film)),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  ),
              color: Color(0xFF161615),
              elevation: 4.sp,
              child: Container(
                height: 157.sp,
                width: 414.sp,
                child: Padding(
                 
                  padding: EdgeInsets.fromLTRB(9.sp, 15.sp,12.sp, 0.sp),
                  child: Column(
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 66.sp,
                            height: 20.sp,
                            child: Text(
                              "Release date",
                              style: TextStyle(
                                fontSize: 9.sp,
                                height: 20.sp / 9.sp,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 259.sp,
                            height: 20.sp,
                            child: Text(
                              title,
                              style: TextStyle(
                                height: 20.sp / 23.sp,
                                fontSize: 23.sp,
                                fontFamily:
                                    'Archivo', 
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                          Container(
                            width: 66.sp,
                            height: 20.sp,
                            child: Text(
                              DateFormat('yyyy/MM/dd')
                                  .format(DateTime.parse(release_date)),

                              style: TextStyle(
                                fontSize: 13.sp,
                                height: 20.sp / 13.sp,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 3.sp),
                          Container(width: 127.sp,
                            child: Text(
                              'Director',
                              style: TextStyle(
                                fontSize: 9.sp,
                                height: 20.sp / 9.sp,
                                fontFamily:
                                    'Archivo', 
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                          Text(
                            'Producer',
                            style: TextStyle(
                              fontSize: 9.sp,
                              height: 20.sp / 9.sp,
                              fontFamily:
                                  'Archivo', 
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.sp,
                            height: 20.sp,
                            child: Text(
                              director,
                              style: TextStyle(
                                fontSize: 13.sp,
                                height: 20.sp /13.sp, 
                                    
                                fontFamily:
                                    'Archivo', 
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Container(
                            width: 170.sp,
                            height: 20.sp,
                            child: Text(
                              producer,
                              style: TextStyle(
                                fontSize: 13.sp,
                                height: 20.sp / 13.sp,
                                fontFamily:
                                    'Archivo', 
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.sp),
                      Row(
                        children: [
                          SizedBox(width: 3.sp),
                          Container(
                            width: 300.sp,
                            height: 27.sp,
                            child: Text(
                              opening_crawl.replaceAll('\n', ''),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                               letterSpacing: -1,
                                height: 1.sp,
                                fontSize: 12.sp,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                color: Color(0xF0F9F9F9),
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
