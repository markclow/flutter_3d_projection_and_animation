import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projection/ship.dart';
import 'package:projection/vectorUtils.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

class ShipCustomPainter extends CustomPainter {
  vm.Vector3 _cam = new vm.Vector3(0, -30, 0);
  double fov = 90;
  Ship _ship;
  double _thetaRadians;
  List<vm.Vector3> side1;
  List<vm.Vector3> side2;
  Paint _sideFill = new Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black.withOpacity(0.6)
    ..strokeWidth = 1.0;
  Paint sideStroke = new Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.grey.withOpacity(0.6)
    ..strokeWidth = 2.0;
  Paint _middle = new Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black.withOpacity(0.4)
    ..strokeWidth = 1.0;

  ShipCustomPainter(this._ship, this._thetaRadians) {
    this.side1 = this._ship.createSide1VectorsForTheta(_thetaRadians);
    this.side2 = this._ship.createSide2VectorsForTheta(_thetaRadians);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintSide(
        canvas, size, side1, _sideFill);
    paintSide(
        canvas, size, side1, sideStroke);
    paintSide(
        canvas, size, side2, _sideFill);
    paintSide(
        canvas, size, side2, sideStroke);
    paintMiddle(
        canvas, size, side1, side2);
  }

  void paintSide(Canvas canvas, Size size, List<vm.Vector3> vectorList, Paint paint) {
    double width = size.width;
    double height = size.height;

    var path = Path();
    bool first = true;
    for (vm.Vector3 vector in vectorList) {
      vm.Vector2 xy = VectorUtils.calculateXY(_cam, vector, width, height);
      if (first) {
        path.moveTo(xy.x, xy.y);
      } else {
        path.lineTo(xy.x, xy.y);
      }
      first = false;
    }
    canvas.drawPath(
        path,
        paint);
  }

  void paintMiddle(Canvas canvas, Size size, List<vm.Vector3> side1Vectors, List<vm.Vector3> side2Vectors) {
    double width = size.width;
    double height = size.height;

    for (int i=0,ii=side1.length - 1;i<ii;i++){

      vm.Vector2 side1 = VectorUtils.calculateXY(_cam, side1Vectors[i], width, height);
      vm.Vector2 side2 = VectorUtils.calculateXY(_cam, side2Vectors[i], width, height);
      vm.Vector2 side3 = VectorUtils.calculateXY(_cam, side2Vectors[i+1], width, height);
      vm.Vector2 side4 = VectorUtils.calculateXY(_cam, side1Vectors[i+1], width, height);

      var path = Path();
      path.moveTo(side1.x, side1.y);
      path.lineTo(side2.x, side2.y);
      path.lineTo(side3.x, side3.y);
      path.lineTo(side4.x, side4.y);
      path.lineTo(side1.x, side1.y);
      canvas.drawPath(
          path,
          _middle);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint logic
    return true;
  }

/*
  //    List<Offset> points = [];
//    List<Offset> points2 = [];
//    List<Offset> points3 = [];
//
//    for (vm.Vector3 coord in _list) {
//      addPointForCoOrd(coord, points, width, height);
//    }
//
//    canvas.drawPoints(
//        PointMode.polygon,
//        points,
//        new Paint()
//          ..color = Colors.black
//          ..strokeWidth = 2.0
//          ..style = PaintingStyle.fill);
//    canvas.drawPoints(
//        PointMode.lines,
//        points2,
//        new Paint()
//          ..color = Colors.black
//          ..strokeWidth = 2.0
//          ..style = PaintingStyle.fill);
//    canvas.drawPoints(
//        PointMode.polygon,
//        points3,
//        new Paint()
//          ..color = Colors.black
//          ..strokeWidth = 2.0
//          ..style = PaintingStyle.fill);
//
//    var path = Path();
//    bool first = true;
//    for (vm.Vector3 coord in _list) {
//      XY xy = calculateXYForCoord(coord, width, height);
//      if (first){
//        path.moveTo(xy.x, xy.y);
//      }else{
//        path.lineTo(xy.x, xy.y);
//      }
//      first = false;
//    }
//    canvas.drawPath(
//        path,
//        new Paint()
//          ..style = PaintingStyle.fill
//          ..color = Colors.green
//          ..strokeWidth = 2.0);
//  }
//
//  addPointForCoOrd(
//      vm.Vector3 coord, List<Offset> points, double width, double height) {
//    XY xy = calculateXYForCoord(coord, width, height);
//    points.add(Offset(xy.x, xy.y));
//  }
//
   */
}
