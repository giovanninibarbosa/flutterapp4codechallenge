class WordDefinition {
  String word;
  List<Result> results;
  Syllables syllables;
  Pronunciation pronunciation;
  double frequency;

  WordDefinition(
      {required this.word,
      required this.results,
      required this.syllables,
      required this.pronunciation,
      required this.frequency});

  factory WordDefinition.fromJson(Map<String, dynamic> json) {
    return WordDefinition(
      word: json['word'] as String,
      results: (json['results'] as List)
          .map((i) => Result.fromJson(i as Map<String, dynamic>))
          .toList(),
      syllables: Syllables.fromJson(json['syllables'] as Map<String, dynamic>),
      pronunciation:
          Pronunciation.fromJson(json['pronunciation'] as Map<String, dynamic>),
      frequency: (json['frequency'] as num).toDouble(),
    );
  }
}

class Result {
  String definition;
  String partOfSpeech;
  List<String> synonyms;
  List<String> typeOf;
  List<String> hasTypes;
  List<String> derivation;
  List<String> examples;

  Result(
      {required this.definition,
      required this.partOfSpeech,
      required this.synonyms,
      required this.typeOf,
      required this.hasTypes,
      required this.derivation,
      required this.examples});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      definition: json['definition'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      synonyms: List<String>.from(json['synonyms'] as Iterable<dynamic>),
      typeOf: List<String>.from(json['typeOf'] as Iterable<dynamic>),
      hasTypes: List<String>.from(json['hasTypes'] as Iterable<dynamic>),
      derivation: List<String>.from(json['derivation'] as Iterable<dynamic>),
      examples: List<String>.from(json['examples'] as Iterable<dynamic>),
    );
  }
}

class Syllables {
  int count;
  List<String> list;

  Syllables({required this.count, required this.list});

  factory Syllables.fromJson(Map<String, dynamic> json) {
    return Syllables(
      count: json['count'] as int,
      list: List<String>.from(json['list'] as Iterable<dynamic>),
    );
  }
}

class Pronunciation {
  String all;

  Pronunciation({required this.all});

  factory Pronunciation.fromJson(Map<String, dynamic> json) {
    return Pronunciation(
      all: json['all'] as String,
    );
  }
}
