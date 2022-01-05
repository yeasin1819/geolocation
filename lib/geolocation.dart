import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var pos;
  Future<void> getLocation() async {
    pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 5));
    //setState(() {});
  }

  var findLocation = false;

  Widget build(BuildContext context) {
    print("Re_Build " + findLocation.toString());

    return Center(
      child: findLocation == false ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on,
            size: 100,
            color: Colors.red,
          ),
          const Text(
            'Get the Location',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            onPressed: () async {
              await getLocation();
              setState(() {
                findLocation = true;
              });
            },
            child: const Text(
              'get location',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ],
      ) : 
      Text(pos.toString()),
    );
  }
}