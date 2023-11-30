import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/person_model.dart';

class ControllerUser extends AutoDisposeAsyncNotifier<PersonModel> {
  @override
  Future<PersonModel> build() async {
    return PersonModel.newObject();
  }

  Future<PersonModel> getUser() async {
    final data = await SharedPreferences.getInstance();
    final userName = data.getString(App.keyPerson);
    final userGenre = data.getString(App.keyGenre);
    return PersonModel(name: userName ?? '', genre: userGenre ?? '');
  }

  Future<PersonModel> registerUser({
    required PersonModel newUser,
    required bool save,
  }) async {
    if (save) {
      final data = await SharedPreferences.getInstance();
      await data.setString(App.keyPerson, newUser.name);
      await data.setString(App.keyGenre, newUser.genre);
    }
    return newUser;
  }
}

final controllerUserProvider =
    AutoDisposeAsyncNotifierProvider<ControllerUser, PersonModel>(() {
  return ControllerUser();
});
