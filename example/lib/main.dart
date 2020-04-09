import 'package:distance/distance.dart';

void main() {
  final distance = Distance(kilometers: 5, meters: 4);

  print(distance.inMiles); // 3.1093414
  print(distance.inMeters); // 5004
}
