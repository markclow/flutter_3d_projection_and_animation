import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projection/shipCustomPainter.dart';
import 'package:projection/ship.dart';
import 'package:projection/shipFactory.dart';
import 'package:projection/shipTypeEnum.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  Ship ship = ShipFactory.createShip(ShipTypeEnum.Destroyer);
  double thetaRadians = 1.5;
  AnimationController _controller;

  _MyHomePageState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this)
      ..addListener(() {
        setState(() {
          // Force build.
        });
      });
  }

  static double degreesToRadians(double degrees) {
    double radians = (pi / 180) * degrees;
    return radians;
  }

  void _performAnimation() {
    setState(() {
      if (_controller.status != AnimationStatus.forward) {
        _controller.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(border: Border.all()),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: CustomPaint(
            painter: ShipCustomPainter(ship, degreesToRadians(_controller.value * 360)),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _performAnimation,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
