import 'package:app4codechallenge/network/model/world_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WordList', () {
    test('fromJson should return a WordList object', () {
      final json = {
        'apple': 1,
        'banana': 2,
        'cherry': 3,
      };

      final wordList = WordList.fromJson(json);

      expect(wordList, isA<WordList>());
      expect(wordList.words, isA<Map<String, int>>());
      expect(wordList.words, equals(json));
    });
  });
}
