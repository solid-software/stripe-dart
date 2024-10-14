extension MapExtension<T, U> on Map<T, U?> {
  Map<T, U> whereValueNotNull() {
    final Map<T, U> result = {};

    for (final key in keys) {
      final value = this[key];

      if (value != null) result[key] = value;
    }

    return result;
  }
}
