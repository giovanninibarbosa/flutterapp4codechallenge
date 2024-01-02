import 'package:app4codechallenge/network/api/api_provider.dart';
import 'package:app4codechallenge/network/model/world_definition_response.dart';
import 'package:app4codechallenge/network/model/world_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  ApiProvider apiProvider;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiProvider = ApiProvider();
    apiProvider.client = mockClient;
  });

  group('getWordList', () {
    test('returns a WordList if the http call completes successfully',
        () async {
      when(mockClient.get(any)).thenAnswer(
          (_) async => http.Response('{"word1": 1, "word2": 2}', 200));
      expect(await apiProvider.getWordList(), isA<WordList>());
    });

    test('throws an exception if the http call completes with an error', () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(apiProvider.getWordList(), throwsException);
    });
  });

  group('getWordDefinition', () {
    test('returns a WordDefinition if the http call completes successfully',
        () async {
      when(mockClient.get(any)).thenAnswer(
          (_) async => http.Response('{"word": "test", "results": []}', 200));
      expect(
          await apiProvider.getWordDefinition('test'), isA<WordDefinition>());
    });

    test('throws an exception if the http call completes with an error', () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(apiProvider.getWordDefinition('test'), throwsException);
    });
  });
}
