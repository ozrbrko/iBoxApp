import 'dart:async';

import 'package:case_infobox/constants/api_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapPage extends StatefulWidget {


  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  final Completer<GoogleMapController> _controller = Completer();


  // var baslangicKonum = CameraPosition(target: LatLng(38.7412482,26.1844276),zoom: 7);
  // static const LatLng sourceLocation = LatLng(37.9333635, 32.8597419);
  static const LatLng destination = LatLng(40.0026,32.6457);

  // Future<void> konumaGit() async {
  //   GoogleMapController controller = await _controller.future;
  //   var gidilecekKonum = CameraPosition(target: LatLng(41.0394, 28.9945),zoom: 20);
  //
  //   controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  //
  // }


  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ApiConfig.google_api_key,
      PointLatLng(destination.latitude, destination.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );

      setState(() {});
    }
  }

  @override
  void initState() {
    
    
    
    getPolyPoints();
    super.initState();
    // konumaGit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Harita"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: destination, zoom: 20),
          polylines: {
            Polyline(
                polylineId: PolylineId("route"),
                points: polylineCoordinates,
                color: Colors.black),
          },
          markers: {
            const Marker(
              markerId: MarkerId("destination"),
              position: destination,
              infoWindow: InfoWindow(
              title: "Göksu Eczanesi",
                // snippet: "dsfsdf"
              )
            ),
            // const Marker(
            //   markerId: MarkerId("destination"),
            //   position: destination,
            // ),
          },
        ),
      ),


    );
  }
}
