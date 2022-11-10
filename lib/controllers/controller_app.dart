import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:perfectmatch/models/person_model.dart';
import 'package:perfectmatch/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerApp extends ChangeNotifier {
  PersonModel _user = PersonModel.newObject();
  PersonModel _partner = PersonModel.newObject();

  Future<PersonModel> getUser() async {
    final data = await SharedPreferences.getInstance();
    final String userName = data.getString('userName') ?? '';
    final int userGenre = data.getInt('userGenre') ?? 1;
    if (userName != '') {
      _user.name = userName;
      _user.genre = userGenre;
    }
    return _user;
  }

  Future<void> registerUser(
      {required PersonModel newUser, required bool save}) async {
    if (save) {
      final data = await SharedPreferences.getInstance();
      await data.setString('userName', newUser.name);
      await data.setInt('userGenre', newUser.genre);
    }
    _user = newUser;
  }

  void registerPartner({required PersonModel newPartner}) {
    _partner = newPartner;
  }

  int _getPos(int max) {
    int sumNames = (_user.name.hashCode + _partner.name.hashCode).abs() % max;
    if (sumNames < 1) {
      sumNames = 1;
    }
    return sumNames;
  }

  String calculateNames() {
    ResponseModel response = ResponseModel(
      posText: _getPos(10),
      genre: _partner.genre,
      posCategory: _getPos(3),
    );
    return tr(
      'results.category${response.posCategory}.pos${response.posText}',
      namedArgs: {
        'name': _partner.name,
        'genre': _partner.genre == 1 ? 'o' : 'a',
      },
    );
  }
}
