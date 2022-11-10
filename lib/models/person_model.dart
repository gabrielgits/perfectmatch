class PersonModel {
  String name;
  int genre;

  PersonModel({required this.name, required this.genre});

  factory PersonModel.newObject() {
    return PersonModel(genre: 1, name: '');
  }
}
