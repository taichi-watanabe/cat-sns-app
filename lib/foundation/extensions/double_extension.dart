extension DoubleExt on double {
  num roundDouble() {
    if (this - floor() != 0) {
      return double.parse(toStringAsFixed(2));
    }
    return floor();
  }
}
