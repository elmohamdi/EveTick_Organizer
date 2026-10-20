/// A text stored once per language, e.g. `{en: 'Hello', ar: 'مرحبا'}`.
///
/// Firestore may also hold a plain string, which is treated as English.
class LocalizedText {
  const LocalizedText(this._values);

  factory LocalizedText.fromRaw(Object? raw) {
    if (raw is String) {
      final text = raw.trim();
      return LocalizedText(text.isEmpty ? const {} : {'en': text});
    }
    if (raw is Map) {
      final values = <String, String>{};
      raw.forEach((key, value) {
        if (value is String && value.trim().isNotEmpty) {
          values[key.toString()] = value.trim();
        }
      });
      return LocalizedText(values);
    }
    return const LocalizedText({});
  }

  final Map<String, String> _values;

  bool get isEmpty => _values.isEmpty;

  /// Text for [languageCode], falling back to English, then to any language.
  String resolve(String languageCode) {
    return _values[languageCode] ??
        _values['en'] ??
        (_values.isEmpty ? '' : _values.values.first);
  }

  /// Whether any language contains [lowerCaseQuery].
  bool contains(String lowerCaseQuery) {
    return _values.values.any(
      (value) => value.toLowerCase().contains(lowerCaseQuery),
    );
  }
}
