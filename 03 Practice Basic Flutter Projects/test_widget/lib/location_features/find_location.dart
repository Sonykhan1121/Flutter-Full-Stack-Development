 import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class FindLocation extends StatefulWidget {
   const FindLocation({super.key});

   @override
   State<FindLocation> createState() => _FindLocationState();
 }

 class _FindLocationState extends State<FindLocation> {
   String currentLocation = 'Location information is loading...';
   StreamSubscription<Position>? _positionStream;

   Future<Position> _determinePosition() async {
     bool serviceEnabled;
     LocationPermission permission;

     // Test if location services are enabled.
     serviceEnabled = await Geolocator.isLocationServiceEnabled();
     if (!serviceEnabled) {
       LocationPermission permission = await Geolocator.requestPermission();
       // await Geolocator.openAppSettings();
       // await Geolocator.openLocationSettings();

       // Location services are not enabled don't continue
       // accessing the position and request users of the
       // App to enable the location services.
       return Future.error('Location services are disabled.');
     }

     permission = await Geolocator.checkPermission();
     if (permission == LocationPermission.denied) {
       permission = await Geolocator.requestPermission();
       if (permission == LocationPermission.denied) {
         // Permissions are denied, next time you could try
         // requesting permissions again (this is also where
         // Android's shouldShowRequestPermissionRationale
         // returned true. According to Android guidelines
         // your App should show an explanatory UI now.
         return Future.error('Location permissions are denied');
       }
     }
     print('Come here2');
     if (permission == LocationPermission.deniedForever) {

       // Permissions are denied forever, handle appropriately.
       return Future.error(
           'Location permissions are permanently denied, we cannot request permissions.');
     }

     // When we reach here, permissions are granted and we can
     // continue accessing the position of the device.
     print('Come here3');
     return await Geolocator.getCurrentPosition();
   }
   Future<void> _determineLocationName() async {
     final  position = await _determinePosition();
     List<Placemark> placemarks = await placemarkFromCoordinates(
       position.latitude,
       position.longitude,
     );

     Placemark place = placemarks[0];

     setState(() {
       currentLocation =
       '${(place.name!.isEmpty? 'name not available':place.name)}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
       print('loc test: $currentLocation');
     });
   }

   //here add function for real time lati and longi
   void startRealTimeLocation()
   {
     LocationSettings locationSettings = LocationSettings(
       accuracy: LocationAccuracy.bestForNavigation,
       distanceFilter: 0,

     );

     _positionStream = Geolocator.getPositionStream(locationSettings: locationSettings)
     .listen((Position? position){

       if(position!=null)
         {
           setState(() {
             currentLocation = "${position.latitude} ,${position.longitude}";

           });
           print('Real time update : $currentLocation');
         }

     });
   }
   void periodictest()
   {
     Stream<int> limitedStream = Stream.periodic(Duration(seconds: 1),(count)=>count).take(5);

     limitedStream.listen(
         (number){
           print('Periodic update : $number');
           currentLocation = 'Periodic update : $number';
           setState(() {

           });
         }
     );
   }

   void stopRealTimeLocation()
   {
     _positionStream?.cancel();
     _positionStream = null;
     print('Real time location stopped');
   }


   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text('Your Location'),
       ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30),

         child: Center(

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text('Looking for your current location?'),
               SizedBox(height: 20,),
               Text(currentLocation),
               SizedBox(height: 20,),
               ElevatedButton(
                 onPressed:() async {
                   final  now = await _determinePosition();

                   setState(() {

                     currentLocation = "${now.longitude} ${now.latitude}";
                     print('loc test : $currentLocation');
                   });

                 },
                 child: Text('Get lati x long My Location'),
               ),
               Text('Or'),
               ElevatedButton(
                 onPressed: (){
                   _determineLocationName();

                 },
                 child: Text('Name of the location'),
               ),


               ElevatedButton(
                 onPressed: startRealTimeLocation,
                 child: Text('Start Real-Time Location'),
               ),
               SizedBox(height: 10),
               ElevatedButton(
                 onPressed: stopRealTimeLocation,
                 child: Text('Stop Real-Time Location'),
               ),
               SizedBox(height: 10),
               ElevatedButton(
                 onPressed: periodictest,
                 child: Text('Periodic test'),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }
