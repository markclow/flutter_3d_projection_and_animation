import 'dart:math';

import 'package:vector_math/vector_math_64.dart' as vm;

class VectorUtils {
  static vm.Vector2 calculateXY(vm.Vector3 cameraPosition, vm.Vector3 vector,
      double canvasWidth, double canvasHeight) {
    double yaw =
        atan2(vector.x - cameraPosition.x, vector.y - cameraPosition.y) *
            (180 / pi);
    double pitch =
        atan2(vector.z - cameraPosition.z, vector.y - cameraPosition.y) *
            (180 / pi);
    double x =
        canvasWidth / 2 + (yaw * (canvasWidth / 90)); // 90 is field of vision
    double y = canvasHeight / 2 -
        (pitch * (canvasWidth / 90)); // 90 is field of vision
    return vm.Vector2(x, y);
  }

  static vm.Vector3 calculateCentroid(
      List<vm.Vector3> side1VectorList, List<vm.Vector3> side2VectorList) {
    // Add both sides together into one list of vectors.
    List<vm.Vector3> model = List.from(side1VectorList);
    model.addAll(side2VectorList);

    // Calculate min & max for each axis.
    double minX = 9999999999,
        maxX = 0,
        minY = 9999999999,
        maxY = 0,
        minZ = 9999999999,
        maxZ = 0;
    int count = model.length;
    for (int i = 0; i < count; i++) {
      vm.Vector3 item = model[i];
      minX = min(item.x, minX);
      maxX = max(item.x, maxX);
      minY = min(item.y, minY);
      maxY = max(item.y, maxY);
      minZ = min(item.z, minZ);
      maxZ = max(item.z, maxZ);
    }

    // Return a vector for the geographically central point, the centroid.
    return vm.Vector3((minX + maxX) / 2, (minY + maxY) / 2, (minZ + maxZ) / 2);
  }

  static List<vm.Vector3> createVectorListsAdjustedForAngle(
      List<vm.Vector3> vectorList, vm.Vector3 centroid, double thetaRadians) {
    List<vm.Vector3> list = [];
    vm.Vector3 axis = new vm.Vector3(0.0, 0.0, 1.0);
    vm.Quaternion q = new vm.Quaternion.axisAngle(axis, thetaRadians);
    for (vm.Vector3 vector in vectorList) {
      vm.Vector3 newVector = vm.Vector3.copy(vector);
      newVector.sub(centroid);
      newVector = q.rotate(newVector);
      newVector.add(centroid);
      list.add(newVector);
    }
    return list;
  }
}
