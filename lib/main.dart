import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps/src/calendar_events.dart';
import 'package:google_maps/src/current_location.dart';
import 'package:google_maps/src/home.dart';
import 'package:google_maps/src/home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearby Events',
     home: Home(),
     // home: MapSample(),
      //home: CalendarEvents(),
      //home: CurrentLocation(),
     // home: HomePage(),
    );
  }
}




