// ignore_for_file: prefer_collection_literals

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapsHome extends StatelessWidget {
  const MapsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  List<double> latitude = [];
  List<double> longitude = [];
  List<double> iri = [];
  List<LatLng> latlang = [];
  Map<String, dynamic> data = Map();

  String googleAPiKey = "AIzaSyAGPX5iyJODBtKuCqe4PxPWFu5YJ5x7vD0";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = const LatLng(34.003040, 71.485524);
  LatLng endLocation = const LatLng(33.996438, 71.461848);
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    getdata();
//todo un comment in final
    // markers
    //     .addLabelMarker(LabelMarker(
    //   label: "Starting Point",
    //   markerId: MarkerId(startLocation.toString()),
    //   position: startLocation,
    //   backgroundColor: Colors.green,
    // ))
    //     .then(
    //   (value) {
    //     setState(() {});
    //   },
    // );
    // markers
    //     .addLabelMarker(LabelMarker(
    //   label: "End Point",
    //   markerId: MarkerId(endLocation.toString()),
    //   position: endLocation,
    //   backgroundColor: Colors.green,
    // ))
    //     .then(
    //   (value) {
    //     setState(() {});
    //   },
    // );
    //todo this uncomment in final
    // getDirections(); //fetch direction polylines from Google API
    super.initState();
  }

  getdata() async {
    // var collection = FirebaseFirestore.instance
    //     .collection("IRIGPS")
    //     .where("IRI", isGreaterThan: 8);
    var collection = FirebaseFirestore.instance
        .collection("IRIGPS")
        .doc(_auth.currentUser!.uid)
        .collection('${_auth.currentUser!.email}')
        .where("IRI", isGreaterThan: 7);
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      data = queryDocumentSnapshot.data();
      // ignore: avoid_print
      print('$data data print');
      // iri.add(double.parse(data['IRI']));
      // print('$iri iri');
      // Latitude.add(double.parse(data['Latitude']));
      // print('$Latitude Latitude');
      // Longitude.add(double.parse(data['Longitude']));
      markers
          .addLabelMarker(LabelMarker(
              label: "IRI:${data['IRI'].toStringAsFixed(2)}}",
              markerId: MarkerId("Marker ${queryDocumentSnapshot.reference}"),
              position: LatLng(double.parse('${data['Latitude']}'),
                  double.parse('${data['Longitude']}')),
              backgroundColor: Colors.red))
          .then(
        (value) {
          if (mounted) {
            setState(() {});
          }
        },
      );
      // latlang.add(LatLng(data['Latitude'], data['Longitude']));
    }
  }
//todo this is uncomment in final
  // getDirections() async {
  //   List<LatLng> polylineCoordinates = [];

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     googleAPiKey,
  //     PointLatLng(startLocation.latitude, startLocation.longitude),
  //     PointLatLng(endLocation.latitude, endLocation.longitude),
  //     travelMode: TravelMode.driving,
  //   );

  //   if (result.points.isNotEmpty) {
  //     // ignore: avoid_function_literals_in_foreach_calls
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     // ignore: avoid_print
  //     print(result.errorMessage);
  //   }
  //   addPolyLine(polylineCoordinates);
  // }

  // addPolyLine(List<LatLng> polylineCoordinates) {
  //   PolylineId id = const PolylineId("poly");
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.deepPurpleAccent,
  //     points: polylineCoordinates,
  //     width: 8,
  //   );
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getdata();
    });
    return Scaffold(
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: startLocation, //initial position
          zoom: 16.0, //initial zoom level
        ),
        markers: markers, //markers to show on map
        polylines: Set<Polyline>.of(polylines.values), //polylines
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
