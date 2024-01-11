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
          title: Container(width: 414.sp,
            
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                    //left: 1.sp, 
                   // right: 141.sp,
                     Container(//width:132.sp ,height:20.sp ,
                     
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

                     SizedBox(width:30.sp ,)
                
                ],
              ),
            
          ),
          leading: IconButton(
            padding: EdgeInsets.all(1.sp),
            icon: Container(
              width: 30.sp,
              height: 30.sp,
              child: Image(
                image: AssetImage(
                    'assets/fleche.png'),
                     fit: BoxFit.none,
              ), 
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          
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


