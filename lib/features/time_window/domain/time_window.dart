class TimeWindow {
  final String _value;

  static const week = TimeWindow._('week');
  static const day = TimeWindow._('day');

  const TimeWindow._(String value) : _value = value;

  @override
  String toString() {
    return _value;
  }
}
