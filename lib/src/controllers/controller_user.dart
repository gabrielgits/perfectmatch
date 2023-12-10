import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/person_model.dart';

class ControllerUser extends AutoDisposeAsyncNotifier<PersonModel> {
  @override
  Future<PersonModel> build() async {
    return getUser();
  }

  Future<PersonModel> getUser() async {
    state = const AsyncValue.loading();
    final data = await SharedPreferences.getInstance();
    final userData = data.getString(App.keyUser);
    final user = PersonModel.fromJson(jsonDecode(userData!));
    state = AsyncValue.data(user);
    return user;
  }

  Future<void> registerUser({
    required PersonModel newUser,
    required bool save,
  }) async {
    if (save) {
      state = const AsyncValue.loading();
      final data = await SharedPreferences.getInstance();
      await data.setString(App.keyUser, jsonEncode(newUser.toJson()));
    }
    state = AsyncValue.data(newUser);
  }

  Future<void> userAnonymously() async {
    state = const AsyncValue.loading();
    const newUser = PersonModel(name: 'Anonymous', genre: 'Male');
    final data = await SharedPreferences.getInstance();
    await data.setString(App.keyUser, jsonEncode(newUser.toJson()));
    state = const AsyncValue.data(newUser);
  }
}

final controllerUserProvider =
    AutoDisposeAsyncNotifierProvider<ControllerUser, PersonModel>(() {
  return ControllerUser();
});
