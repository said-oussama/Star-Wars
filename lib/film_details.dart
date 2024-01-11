import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEBEBEB),
          toolbarHeight: 56.sp,
          //title: Text("film details"),
          title: Container(
            width: 414.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //left: 1.sp,
                // right: 141.sp,
                Container(
                  //width:132.sp ,height:20.sp ,

                  child: Text(
                    widget.film.title,
                    style: TextStyle(
                      fontSize: 21.sp,
                      height: 20.sp / 21.sp,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),

                SizedBox(
                  width: 30.sp,
                )
              ],
            ),
          ),
          leading: IconButton(
            padding: EdgeInsets.all(1.sp),
            icon: Container(
              width: 30.sp,
              height: 30.sp,
              child: Image(
                image: AssetImage('assets/fleche.png'),
                fit: BoxFit.none,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Card(
              elevation: 4.sp,
              shadowColor: Color(0x40000000),
              color: Color(0xFF161615),
              child: Container(
                width: 414.sp,
                height: 219.sp,
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.sp),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 25.sp,
                        child: Text(
                          widget.film.title,
                          style: TextStyle(
                            fontSize: 27.sp,
                            height: 20.sp / 27.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xF0F9F9F9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.sp),
                    Row(
                      children: [
                        Container(
                          width: 80.sp,
                          child: Text(
                            "Release date",
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ),

                        Container(
                          width: 100.sp,
                          child: Text(
                            "Director",
                            style: TextStyle(
                              fontSize: 9,
                              // height:
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ),

                        //SizedBox(width: 73.sp),

                        Text(
                          "Producer",
                          style: TextStyle(
                            fontSize: 9,
                            // height:
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xF0F9F9F9),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80.sp,
                          child: Text(
                            DateFormat('yyyy/MM/dd').format(
                                DateTime.parse(widget.film.release_date)),
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 20.sp / 11.sp,
                              // Spécifiez l'espacement entre les lignes
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ),

                        //SizedBox(width: 15.sp),

                        Container(
                          width: 100.sp,
                          height: 20.sp,
                          child: Text(
                            widget.film.director,
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 20.sp / 11.sp,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ),

                        //SizedBox(width: 15.sp),

                        Container(
                          width: 140.sp,
                          height: 20.sp,
                          child: Text(
                            widget.film.producer,
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 20.sp / 11.sp,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              color: Color(0xF0F9F9F9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4.sp,
              shadowColor: Color(0xFFFFFFFF),
              color: Color(0xFFFFFFFF),
              child: Container(
                width: 414.sp,
                height: 236.sp,
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Opening craw',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF161615),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 448.sp,
                      height: 140.sp,
                      //child: Expanded(
                      child: Text(
                        textAlign: TextAlign.justify,
                        maxLines: 9,
                        widget.film.opening_crawl.replaceAll('\n', ''),
                        style: TextStyle(
                          letterSpacing: -1,
                          fontSize: 14.sp,
                          //  height: 0.9,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF161615),
                        ),
                      ),
                      //),
                    ),
                    //SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Created',
                          style: TextStyle(
                            fontSize: 13.sp,
                            height: 20.sp / 13.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF161615),
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          'Edited',
                          style: TextStyle(
                            fontSize: 13.sp,
                            height: 20.sp / 13.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF161615),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('yyyy/MM/dd')
                              .format(DateTime.parse(widget.film.created)),
                          style: TextStyle(
                            fontSize: 14.sp,
                            height: 17.sp / 14.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF161615),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          DateFormat('yyyy/MM/dd')
                              .format(DateTime.parse(widget.film.edited)),
                          style: TextStyle(
                            fontSize: 14.sp,
                            height: 17.sp / 14.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF161615),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView(
        //     children: <Widget>[
        //       Text("title:${widget.film.director}"),
        //       Text("title:${widget.film.edited}"),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
