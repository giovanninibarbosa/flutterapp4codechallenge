class WordList {
  Map<String, int> words;

  WordList({required this.words});

  factory WordList.fromJson(Map<String, dynamic> json) {
    return WordList(
      words: json.map((key, value) => MapEntry(key, value as int)),
    );
  }
}
