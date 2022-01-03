import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Location Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        appBar:
       AppBar(title: const Text('Geo Location Tracker'),
       centerTitle: true,
       ),
      body: const MyHomePage(),
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Position position;
  
 Future getLocation()async{
   try{
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
     setState(() {
      position =position;
     });
   }catch(err){}
  }
  @override
  void initState() {
   
    super.initState();
    getLocation();
  }
  


  @override
  Widget build(BuildContext context) {

   
   return Container(child:
    Center(child: 
      Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
     
     const Icon(Icons.location_on,size: 100,color: Colors.red,),
     const Text('Get the Location',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
     
     
     RaisedButton(onPressed: getLocation,
     child:
      const Text('get location',
      style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,),
      Text(position.longitude.toString(),)
    ],
   ),
   ),
   );
  }
}
