import 'dart:async';
import 'dart:convert';

import 'package:app4codechallenge/network/model/world_definition_response.dart';
import 'package:app4codechallenge/network/model/world_list.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();

  static const String wordList =
      'https://raw.githubusercontent.com/dwyl/english-words/master/words_dictionary.json';

  static const String dictonaryApi = 'https://wordsapiv1.p.mashape.com/words';

  Future<WordList> getWordList() async {
    final url = Uri.parse(wordList);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as WordList;
    } else {
      throw Exception('Request Failed');
    }
  }

  Future<WordDefinition> getWordDefinition(String word) async {
    final url = Uri.parse("$dictonaryApi/$word");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as WordDefinition;
    } else {
      throw Exception('Request Failed');
    }
  }
}
