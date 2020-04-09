/// A length of distance
class Distance {
  /// Number of inches in a foot
  static const int inchesInFoot = 12;

  /// Number of feet in a yard
  static const int feetInYard = 3;

  /// Number of yards in a mile
  static const int yardsInMile = 1760;

  /// Number of micrometers in an inch
  static const int micrometersInInch = 25400;

  /// Number of micrometers in a foot
  static const int micrometersInFoot = inchesInFoot * micrometersInInch;

  /// Number of micrometers in a yard
  static const int micrometersInYard = feetInYard * micrometersInFoot;

  /// Number of micrometers in a mile
  static const int micrometersInMile = yardsInMile * micrometersInYard;

  /// Number of micrometers in a millimeter
  static const int micrometersInMillimeter = 1000;

  /// Number of micrometers in a centimeter
  static const int micrometersInCentimeter = 10 * micrometersInMillimeter;

  /// Number of micrometers in a meter
  static const int micrometersInMeter = 100 * micrometersInCentimeter;

  /// Number of micrometers in a kilometer
  static const int micrometersInKilometer = 1000 * micrometersInMeter;

  /// The value of this distance in micrometers
  ///
  /// Here we use micrometers to keep all computation using integers
  final int _distance;

  /// A distance of zero
  static const Distance zero = Distance._micrometers(0);

  /// Creates a new Distance object whose value
  /// is the sum of all individual parts.
  ///
  /// Individual parts can be larger than the next-bigger unit.
  ///
  /// All individual parts are allowed to be negative.
  /// All arguments are 0 by default.
  const Distance({
    int kilometers = 0,
    int meters = 0,
    int centimeters = 0,
    int millimeters = 0,
    int micrometers = 0,
    int miles = 0,
    int yards = 0,
    int feet = 0,
    int inches = 0,
  }) : _distance = (kilometers * micrometersInKilometer +
            meters * micrometersInMeter +
            centimeters * micrometersInCentimeter +
            millimeters * micrometersInMillimeter +
            micrometers +
            miles * micrometersInMile +
            yards * micrometersInYard +
            feet * micrometersInFoot +
            inches * micrometersInInch);

  // Fast path internal direct constructor to avoids the optional arguments and
  // [_distance] recomputation.
  const Distance._micrometers(this._distance);

  /// Adds this Distance and [other] and
  /// returns the sum as a new Distance object.
  Distance operator +(Distance other) {
    return Distance._micrometers(_distance + other._distance);
  }

  /// Subtracts this Distance and [other] and
  /// returns the difference as a new Distance object.
  Distance operator -(Distance other) {
    return Distance._micrometers(_distance - other._distance);
  }

  /// Returns a new `Distance` representing this `Distance` negated.
  ///
  /// The returned `Distance` has the same length as this one, but will have the
  /// opposite sign of this one.
  Distance operator -() => Distance._micrometers(0 - _distance);

  /// Multiplies this Distance by the given [factor] and returns the result
  /// as a new Distance object.
  Distance operator *(num factor) {
    return Distance._micrometers((_distance * factor).round());
  }

  /// Divides this Distance by the given [quotient] and returns the
  /// result as a new Distance object.
  ///
  /// Throws an [IntegerDivisionByZeroException] if [quotient] is `0`.
  Distance operator /(num quotient) {
    if (quotient == 0) throw IntegerDivisionByZeroException();
    return Distance._micrometers((_distance / quotient).round());
  }

  /// Divides this Distance by the given [quotient] and returns the
  /// result as a new Distance object.
  ///
  /// Throws an [IntegerDivisionByZeroException] if [quotient] is `0`.
  Distance operator ~/(int quotient) {
    if (quotient == 0) throw IntegerDivisionByZeroException();
    return Distance._micrometers(_distance ~/ quotient);
  }

  /// Returns `true` if the value of this Distance
  /// is less than the value of [other].
  bool operator <(Distance other) => _distance < other._distance;

  /// Returns `true` if the value of this Distance
  /// is greater than the value of [other].
  bool operator >(Distance other) => _distance > other._distance;

  /// Returns `true` if the value of this Distance
  /// is less than or equal to the value of [other].
  bool operator <=(Distance other) => _distance <= other._distance;

  /// Returns `true` if the value of this Distance
  /// is greater than or equal to the value of [other].
  bool operator >=(Distance other) => _distance >= other._distance;

  /// Returns `true` if this [Distance] has the same value as [other].
  bool operator ==(dynamic other) =>
      other is Distance && _distance == other._distance;

  int get hashCode => _distance.hashCode;

  /// Return the number of kilometers spanned by this Distance
  double get inKilometers => _distance / micrometersInKilometer;

  /// Return the number of meters spanned by this Distance
  double get inMeters => _distance / micrometersInMeter;

  /// Return the number of centimeters spanned by this Distance
  double get inCentimeters => _distance / micrometersInCentimeter;

  /// Return the number of millimeters spanned by this Distance
  double get inMillimeters => _distance / micrometersInMillimeter;

  /// Return the number of micrometers spanned by this Distance
  double get inMicrometers => _distance.toDouble();

  /// Return the number of miles spanned by this Distance
  double get inMiles => _distance / micrometersInMile;

  /// Return the number of yards spanned by this Distance
  double get inYards => _distance / micrometersInYard;

  /// Return the number of feet spanned by this Distance
  double get inFeet => _distance / micrometersInFoot;

  /// Return the number of inches spanned by this Distance
  double get inInches => _distance / micrometersInInch;

  /// Compares this [Distance] to [other],
  /// returning zero if the values are equal.
  int compareTo(Distance other) => _distance.compareTo(other._distance);

  @override
  String toString() {
    return '${inMeters}m';
  }
}
