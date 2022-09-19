extension UIterableExtensions<T> on Iterable<T> {
  Iterable<T> operator *(int times) {
    final list = <T>[];
    for (var value = 0; value < times; value++) {
      list.addAll(this);
    }
    return list;
  }
}
