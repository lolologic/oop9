import 'dart:math';

/// Represents the gender of a participant.
enum Geschlecht {
  /// Female.
  w,

  /// Male.
  m,

  /// Diverse.
  d,
}

/// Represents an immutable participant and their personal data.
class Teilnehmer {
  /// The participant's first name.
  final String vorname;

  /// The participant's last name.
  final String nachname;

  /// The participant's gender.
  final Geschlecht geschlecht;

  /// The participant's date of birth.
  final DateTime geburtsdatum;

  /// The participant's final grade, or `null` if no grade is available.
  final int? abschlussnote;

  /// The participant's access authorization.
  final Zutrittsberechtigung zutrittsberechtigung;

  /// Creates an immutable participant with the provided data.
  ///
  /// Creates a new [Zutrittsberechtigung] if none is provided.
  Teilnehmer({
    required this.vorname,
    required this.nachname,
    required this.geschlecht,
    required this.geburtsdatum,
    this.abschlussnote,
    Zutrittsberechtigung? vorhandeneZutrittsberechtigung,
  }) : zutrittsberechtigung =
           vorhandeneZutrittsberechtigung ?? Zutrittsberechtigung();

  /// Returns a copy of this participant with optionally replaced values.
  Teilnehmer copyWith({
    String? vorname,
    String? nachname,
    Geschlecht? geschlecht,
    DateTime? geburtsdatum,
    int? Function()? abschlussnote,
    Zutrittsberechtigung? zutrittsberechtigung,
  }) {
    return Teilnehmer(
      vorname: vorname ?? this.vorname,
      nachname: nachname ?? this.nachname,
      geschlecht: geschlecht ?? this.geschlecht,
      geburtsdatum: geburtsdatum ?? this.geburtsdatum,
      abschlussnote: abschlussnote != null
          ? abschlussnote()
          : this.abschlussnote,
      vorhandeneZutrittsberechtigung:
          zutrittsberechtigung ?? this.zutrittsberechtigung,
    );
  }
}

/// Represents an access authorization assigned to a participant.
class Zutrittsberechtigung {
  /// The unique identifier of the access authorization.
  final int zutrittsberechtigungsId;

  /// Creates an access authorization with a randomly generated identifier.
  Zutrittsberechtigung()
    : zutrittsberechtigungsId = Random().nextInt(999999999);
}
