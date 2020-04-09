import 'package:distance/distance.dart';
import 'package:test/test.dart';

void main() {
  test('display the correct distance', () {
    expect(Distance(miles: 1).inYards, equals(1760));
    expect(Distance(yards: 1).inFeet, equals(3));
    expect(Distance(feet: 1).inInches, equals(12));
    expect(Distance(inches: 1).inCentimeters, equals(2.54));

    expect(Distance(kilometers: 1).inKilometers, equals(1));
    expect(Distance(kilometers: 1).inMeters, equals(1000));
    expect(Distance(meters: 1).inCentimeters, equals(100));
    expect(Distance(centimeters: 1).inMillimeters, equals(10));
    expect(Distance(millimeters: 10).inCentimeters, equals(1));
    expect(Distance(millimeters: 1).inMicrometers, equals(1000));
  });

  test('equality', () {
    expect(Distance(miles: 1), equals(Distance(yards: 1760)));
    expect(Distance(yards: 1), equals(Distance(feet: 3)));
    expect(Distance(feet: 1), equals(Distance(inches: 12)));
    expect(
      Distance(inches: 1),
      equals(Distance(centimeters: 2, micrometers: 5400)),
    );

    expect(Distance(kilometers: 1), Distance(meters: 1000));
    expect(Distance(meters: 1), equals(Distance(centimeters: 100)));
    expect(Distance(centimeters: 1), equals(Distance(millimeters: 10)));
  });

  group('operations', () {
    test('sum', () {
      expect(
        Distance(kilometers: 3) + Distance(kilometers: 5),
        equals(Distance(kilometers: 8)),
      );

      expect(
        Distance(meters: 1900) + Distance(meters: 100),
        equals(Distance(kilometers: 2)),
      );

      expect(
        Distance(meters: 5999) + Distance(centimeters: 99, millimeters: 10),
        equals(Distance(kilometers: 6)),
      );

      expect(
        Distance(kilometers: 3) + Distance(kilometers: 5),
        equals(Distance(kilometers: 8)),
      );

      expect(
        Distance(feet: 3) + Distance(millimeters: 85, micrometers: 600),
        equals(Distance(meters: 1)),
      );
    });

    test('subtraction', () {
      expect(
        Distance(kilometers: 3) - Distance(kilometers: 5),
        equals(Distance(kilometers: -2)),
      );

      expect(
        Distance(meters: 2500) - Distance(centimeters: 100),
        equals(Distance(kilometers: 2, meters: 499)),
      );

      expect(
        Distance(meters: 6000) - Distance(millimeters: 1),
        equals(Distance(
            kilometers: 5, meters: 999, centimeters: 99, millimeters: 9)),
      );

      expect(
        Distance(meters: 1) - Distance(millimeters: 85, micrometers: 600),
        equals(Distance(feet: 3)),
      );
    });

    test('multiplication', () {
      expect(Distance(centimeters: 1) * 100, equals(Distance(meters: 1)));
      expect(Distance(centimeters: 1) * 2.54, equals(Distance(inches: 1)));

      expect(Distance(inches: 1) * 12, equals(Distance(feet: 1)));
    });

    test('division', () {
      expect(Distance(meters: 1) / 100, equals(Distance(centimeters: 1)));
      expect(Distance(inches: 1) / 2.54, equals(Distance(centimeters: 1)));

      expect(Distance(feet: 1) ~/ 12, equals(Distance(inches: 1)));
    });

    test('inequality', () {
      expect(Distance(miles: 1) > Distance(kilometers: 1), isTrue);
      expect(Distance(miles: 1) < Distance(kilometers: 1), isFalse);

      expect(Distance(feet: 3) <= Distance(meters: 1), isTrue);
      expect(Distance(centimeters: 100) <= Distance(meters: 1), isTrue);
      expect(Distance(inches: 13) >= Distance(feet: 1), isTrue);
    });
  });

  test('compareTo', () {
    expect(Distance(miles: 1).compareTo(Distance.zero), equals(1));
    expect(Distance(kilometers: 1).compareTo(Distance(miles: 1)), equals(-1));
    expect(Distance(feet: 1).compareTo(Distance(inches: 12)), equals(0));
  });
}
