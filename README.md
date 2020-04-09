# distance
[![style: effective dart](https://img.shields.io/badge/style-ffective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)

A simple distance library similar to Dart's duration

## Getting Started

Add the distance library in your pubspec and use it as the example below

```dart
import 'package:distance/distance.dart';

final distance = Distance(kilometers: 5, meters: 4);

print(distance.inMiles); // 3.1093414
print(distance.inMeters); // 5004
```
