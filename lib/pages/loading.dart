import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/services/world_time.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'location': instance.location, 'time': instance.time, 'isDayTime' : instance.isDayTime});
  }

  @override
  void initState() {
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
