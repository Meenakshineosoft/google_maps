import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

// current location using map sync fusion
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late MapZoomPanBehavior _zoomPanBehavior;

  Future<LocationData?> _currentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }

  @override
  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior(enableDoubleTapZooming: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationData?>(
      future: _currentLocation(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
        if (snapchat.hasData) {
          final LocationData currentLocation = snapchat.data;
          return SfMaps(
            layers: [
              MapTileLayer(
                initialFocalLatLng: MapLatLng(
                    currentLocation.latitude!, currentLocation.longitude!),
                initialZoomLevel: 5,
                initialMarkersCount: 1,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                zoomPanBehavior: _zoomPanBehavior,
                markerBuilder: (BuildContext context, int index) {
                  return MapMarker(
                    latitude: currentLocation.latitude!,
                    longitude: currentLocation.longitude!,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red[800],
                    ),
                    size: Size(20, 20),
                  );
                },
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

 /* CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.startTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event Start Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.endTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event End Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$endTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'Enter Event name'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Insert Event',
              ),
              color: Colors.grey,
              onPressed: () {
                log('add event pressed');
                calendarClient.insert(
                  _eventName.text,
                  startTime,
                  endTime,
                );
              }),
        ],
      ),
    );
  } */
