import 'package:projection/ship.dart';
import 'package:projection/vectorUtils.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

class Destroyer implements Ship {
  final SIDE_1_VECTORS = [
    vm.Vector3(-23.0, -1, -10),
    vm.Vector3(20.0, -1, -10),
    vm.Vector3(25.0, -1, -6.0),
    vm.Vector3(25.0, -2, -4.0),
    vm.Vector3(21.0, -2, -6),
    vm.Vector3(16.0, -2, -6),
    vm.Vector3(15.0, -2, -7),
    vm.Vector3(13.0, -2, -7),
    vm.Vector3(13.0, -2, -5),
    vm.Vector3(10.0, -2, -5),
    vm.Vector3(10.0, -2, -6),
    vm.Vector3(9.0, -2, -6),
    vm.Vector3(9.0, -2, -4),
    vm.Vector3(6.0, -2, -4),
    vm.Vector3(6.0, -2, 0),
    vm.Vector3(3.0, -2, 0),
    vm.Vector3(3.0, -2, 1),
    vm.Vector3(3.0, -2, 2),
    vm.Vector3(2.0, -2, 2),
    vm.Vector3(2.0, -2, 7),
    vm.Vector3(1.0, -2, 7),
    vm.Vector3(1.0, -2, 5),
    vm.Vector3(-1.0, -2, 5),
    vm.Vector3(-1.0, -2, -2),
    vm.Vector3(-3.0, -2, -2),
    vm.Vector3(-3.0, -2, 0),
    vm.Vector3(-5.0, -2, 0),
    vm.Vector3(-5.0, -2, 4),
    vm.Vector3(-6.0, -2, 4),
    vm.Vector3(-6.0, -2, -2),
    vm.Vector3(-10.0, -2, -2),
    vm.Vector3(-10.0, -2, -7),
    vm.Vector3(-11.0, -2, -7),
    vm.Vector3(-11.0, -2, -5),
    vm.Vector3(-13.0, -2, -5),
    vm.Vector3(-13.0, -2, -7),
    vm.Vector3(-24.0, -2, -7),
    vm.Vector3(-24.0, -2, -6),
    vm.Vector3(-25.0, -2, -6),
    vm.Vector3(-25.0, -2, -9),
    vm.Vector3(-23.0, -1, -10),
  ];
  final SIDE_2_VECTORS = [
    vm.Vector3(-23.0, 1, -10),
    vm.Vector3(20.0, 1, -10),
    vm.Vector3(25.0, 1, -6.0),
    vm.Vector3(25.0, 2, -4.0),
    vm.Vector3(21.0, 2, -6),
    vm.Vector3(16.0, 2, -6),
    vm.Vector3(15.0, 2, -7),
    vm.Vector3(13.0, 2, -7),
    vm.Vector3(13.0, 2, -5),
    vm.Vector3(10.0, 2, -5),
    vm.Vector3(10.0, 2, -6),
    vm.Vector3(9.0, 2, -6),
    vm.Vector3(9.0, 2, -4),
    vm.Vector3(6.0, 2, -4),
    vm.Vector3(6.0, 2, 0),
    vm.Vector3(3.0, 2, 0),
    vm.Vector3(3.0, 2, 1),
    vm.Vector3(3.0, 2, 2),
    vm.Vector3(2.0, 2, 2),
    vm.Vector3(2.0, 2, 7),
    vm.Vector3(1.0, 2, 7),
    vm.Vector3(1.0, 2, 5),
    vm.Vector3(-1.0, 2, 5),
    vm.Vector3(-1.0, 2, -2),
    vm.Vector3(-3.0, 2, -2),
    vm.Vector3(-3.0, 2, 0),
    vm.Vector3(-5.0, 2, 0),
    vm.Vector3(-5.0, 2, 4),
    vm.Vector3(-6.0, 2, 4),
    vm.Vector3(-6.0, 2, -2),
    vm.Vector3(-10.0, 2, -2),
    vm.Vector3(-10.0, 2, -7),
    vm.Vector3(-11.0, 2, -7),
    vm.Vector3(-11.0, 2, -5),
    vm.Vector3(-13.0, 2, -5),
    vm.Vector3(-13.0, 2, -7),
    vm.Vector3(-24.0, 2, -7),
    vm.Vector3(-24.0, 2, -6),
    vm.Vector3(-25.0, 2, -6),
    vm.Vector3(-25.0, 2, -9),
    vm.Vector3(-23.0, 1, -10),
  ];

  vm.Vector3 _centroid;

  Destroyer() {
    _centroid = VectorUtils.calculateCentroid(SIDE_1_VECTORS, SIDE_2_VECTORS);
  }

  @override
  List<vm.Vector3> createSide1VectorsForTheta(double thetaRadians) {
    return VectorUtils.createVectorListsAdjustedForAngle(
        SIDE_1_VECTORS, _centroid, thetaRadians);
  }

  @override
  List<vm.Vector3> createSide2VectorsForTheta(double thetaRadians) {
    return VectorUtils.createVectorListsAdjustedForAngle(
        SIDE_2_VECTORS, _centroid, thetaRadians);
  }
}
