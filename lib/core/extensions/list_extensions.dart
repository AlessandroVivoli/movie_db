extension ListContains<T> on List<T> {
  /// Checks if this list contains all of the elements in another list
  ///
  /// Returns `true` if every element of [arr] exists in this list.\
  /// Returns `false` if even one of the elements is not in this list.
  ///
  /// Example:
  /// ```dart
  /// final exampleList = List<int>.filled(5, 0); // [0, 0, 0, 0, 0]
  /// print(exampleList.containsAll([0, 0, 0])); // true
  /// print(exampleList.containsAll([0, 1, 0])); // false
  /// ```
  bool containsAll(List<T> arr) {
    for (T element in arr) {
      if (contains(element) != true) {
        return false;
      }
    }

    return true;
  }

  /// Checks if this list contains any of the elements in another list
  ///
  /// Returns `true` if any of the elements of [arr] exist in this list.\
  /// Returns `false` if none of the elements are in this list.
  ///
  /// Example:
  /// ```dart
  /// final exampleList = List<int>.filled(5, 0); // [0, 0, 0, 0, 0];
  /// print(exampleList.containsAny([0, 0, 0])); // true
  /// print(exampleList.containsAny([0, 1, 0])); // true
  /// print(exampleList.containsAny([1, 1, 0])); // true
  /// print(exampleList.containsAny([1, 1, 1])); // false
  /// ```
  bool containsAny(List<T> arr) {
    for (T element in arr) {
      if (contains(element) == true) {
        return true;
      }
    }

    return false;
  }
}

extension ListJoin<T> on List<T> {
  /// Joins `element` in between all existing elements in this list.
  ///
  /// Returns [List] with joined [element]
  ///
  /// Example:
  /// ```dart
  /// final exampleList = List<int>.filled(3, 0); // [0, 0, 0]
  /// print(exampleList.joinElement(1)); // [0, 1, 0, 1, 0]
  /// ```
  List<T> joinElement(T element) {
    for (int i = 1; i < length; i += 2) {
      insert(i, element);
    }

    return this;
  }
}
