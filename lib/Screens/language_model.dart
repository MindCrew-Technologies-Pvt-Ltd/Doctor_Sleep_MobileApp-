

class LanguageModel {
  final String name;

  LanguageModel(
      this.name
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel("English"),
      LanguageModel("Deutsch"),
      LanguageModel("Dansk"),
      LanguageModel("Français"),

    ];
  }
}