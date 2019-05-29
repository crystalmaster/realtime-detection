import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'real-time Object detection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCam = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Detection'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Text('Current Camera'),
              RaisedButton(
                child: Text('${currentCam == 0 ? 'Main camera' : 'Font Camera' }'),
                onPressed: () {
                  currentCam = currentCam == 0 ? 1 : 0;
                  setState(() {
                  });
                },
              ),
              Text('Tap to switch camera'),
              RaisedButton(
                child: Text('Start'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetectionPage(cameras, currentCam)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
