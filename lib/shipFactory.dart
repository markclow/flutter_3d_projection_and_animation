import 'package:projection/destroyer.dart';
import 'package:projection/ship.dart';
import 'package:projection/shipTypeEnum.dart';

class ShipFactory{

  static Ship createShip(ShipTypeEnum shipTypeEnum){
    return Destroyer();
  }
}