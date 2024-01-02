import 'package:app4codechallenge/network/model/world_definition_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WordDefinition', () {
    test('fromJson should return a valid WordDefinition object', () {
      final json = <String, dynamic>{
        'word': 'apple',
        'results': <Map<String, dynamic>>[
          {
            'definition': 'A fruit',
            'partOfSpeech': 'noun',
            'synonyms': <String>['fruit'],
            'typeOf': <String>['edible fruit'],
            'hasTypes': <String>[],
            'derivation': <String>[],
            'examples': <String>['I ate an apple.'],
          },
        ],
        'syllables': <String, dynamic>{
          'count': 2,
          'list': <String>['ap', 'ple'],
        },
        'pronunciation': <String, dynamic>{'all': 'ˈæpəl'},
        'frequency': 0.5,
      };

      final wordDefinition = WordDefinition.fromJson(json);

      expect(wordDefinition.word, equals('apple'));
      expect(wordDefinition.results, isList);
      expect(wordDefinition.results, hasLength(1));
      expect(wordDefinition.results[0].definition, equals('A fruit'));
      expect(wordDefinition.results[0].partOfSpeech, equals('noun'));
      expect(wordDefinition.results[0].synonyms, contains('fruit'));
      expect(wordDefinition.results[0].typeOf, contains('edible fruit'));
      expect(wordDefinition.results[0].hasTypes, isEmpty);
      expect(wordDefinition.results[0].derivation, isEmpty);
      expect(wordDefinition.results[0].examples, contains('I ate an apple.'));
      expect(wordDefinition.syllables.count, equals(2));
      expect(wordDefinition.syllables.list, containsAll(['ap', 'ple']));
      expect(wordDefinition.pronunciation.all, equals('ˈæpəl'));
      expect(wordDefinition.frequency, equals(0.5));
    });
  });

  group('Result', () {
    test('fromJson should return a valid Result object', () {
      final json = <String, dynamic>{
        'definition': 'A fruit',
        'partOfSpeech': 'noun',
        'synonyms': <String>['fruit'],
        'typeOf': <String>['edible fruit'],
        'hasTypes': <String>[],
        'derivation': <String>[],
        'examples': <String>['I ate an apple.'],
      };

      final result = Result.fromJson(json);

      expect(result.definition, equals('A fruit'));
      expect(result.partOfSpeech, equals('noun'));
      expect(result.synonyms, contains('fruit'));
      expect(result.typeOf, contains('edible fruit'));
      expect(result.hasTypes, isEmpty);
      expect(result.derivation, isEmpty);
      expect(result.examples, contains('I ate an apple.'));
    });
  });

  group('Syllables', () {
    test('fromJson should return a valid Syllables object', () {
      final json = <String, dynamic>{
        'count': 2,
        'list': <String>['ap', 'ple'],
      };

      final syllables = Syllables.fromJson(json);

      expect(syllables.count, equals(2));
      expect(syllables.list, containsAll(['ap', 'ple']));
    });
  });

  group('Pronunciation', () {
    test('fromJson should return a valid Pronunciation object', () {
      final json = <String, dynamic>{'all': 'ˈæpəl'};

      final pronunciation = Pronunciation.fromJson(json);

      expect(pronunciation.all, equals('ˈæpəl'));
    });
  });
}
