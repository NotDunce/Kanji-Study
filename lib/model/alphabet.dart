class Consonant {
  final String character;
  final String name;
  final String soundStart;
  final String soundSyllable;
  final String soundEnd;
  final String wordStart;
  final String wordSyllable;
  final String wordEnd;

  Consonant({
    required this.character,
    required this.name,
    required this.soundStart,
    required this.soundSyllable,
    required this.soundEnd,
    required this.wordStart,
    required this.wordSyllable,
    required this.wordEnd,
  });

  factory Consonant.fromJson(Map<String, dynamic> json) {
    return Consonant(
      character: json['character'],
      name: json['name'],
      soundStart: json['soundStart'],
      soundSyllable: json['soundSyllable'],
      soundEnd: json['soundEnd'],
      wordStart: json['wordStart'],
      wordSyllable: json['wordSyllable'],
      wordEnd: json['wordEnd'],
    );
  }
}