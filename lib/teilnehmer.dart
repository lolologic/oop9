import 'dart:math';

enum Geschlecht { w, m, d }

class Teilnehmer {
  final String vorname;
  final String nachname;
  final Geschlecht geschlecht;
  final DateTime geburtsdatum;
  final int? abschlussnote;
  final Zutrittsberechtigung zutrittsberechtigung;

  Teilnehmer({
    required this.vorname,
    required this.nachname,
    required this.geschlecht,
    required this.geburtsdatum,
    this.abschlussnote,
    Zutrittsberechtigung? vorhandeneZutrittsberechtigung,
  }) : zutrittsberechtigung =
           vorhandeneZutrittsberechtigung ?? Zutrittsberechtigung();

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

class Zutrittsberechtigung {
  final int zutrittsberechtigungsId;

  Zutrittsberechtigung()
    : zutrittsberechtigungsId = Random().nextInt(999999999);
}
