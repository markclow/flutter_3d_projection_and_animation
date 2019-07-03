import 'package:vector_math/vector_math_64.dart' as vm;

abstract class Ship {
  /**
   * Ship Vector Info
   *  x : right positive : left negative,
   *  y : futher away positive : nearer negative,
   *  z : up positive : down negative;
   */
  List<vm.Vector3> createSide1VectorsForTheta(double thetaRadians);

  List<vm.Vector3> createSide2VectorsForTheta(double thetaRadians);

}
