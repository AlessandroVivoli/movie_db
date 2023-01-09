extension ListContains<T> on List<T> {
  bool containsAll(List<T> arr) {
    for (T element in arr) {
      if (contains(element) != true) {
        return false;
      }
    }

    return true;
  }

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
  List<T> joinElement(T element) {
    for (int i = 1; i < length; i += 2) {
      insert(i, element);
    }

    return this;
  }
}
