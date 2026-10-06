import 'package:oop9/teilnehmer.dart';

void main() {
  final teilnehmer = Teilnehmer(
    vorname: 'Max',
    nachname: 'Mustermann',
    geschlecht: Geschlecht.m,
    geburtsdatum: DateTime(2000, 1, 1),
    abschlussnote: 2,
  );

  final kopie1 = teilnehmer.copyWith(vorname: 'Peter');

  final kopie2 = teilnehmer.copyWith(abschlussnote: () => 1);

  final kopie3 = teilnehmer.copyWith(abschlussnote: () => null);

  final teilnehmerListe = [teilnehmer, kopie1, kopie2, kopie3];

  listeAusgeben(teilnehmerListe);
}

void listeAusgeben(List<Teilnehmer> teilnehmerListe) {
  for (final teilnehmer in teilnehmerListe) {
    print(
      '${teilnehmer.vorname} ${teilnehmer.nachname}, '
      'Abschlussnote: ${teilnehmer.abschlussnote}, '
      'Zutritts-ID: ${teilnehmer.zutrittsberechtigung.zutrittsberechtigungsId}',
    );
  }
}
