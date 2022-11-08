import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:perfectmatch/models/person_model.dart';
import 'package:perfectmatch/models/response_model.dart';

class ControllerApp extends ChangeNotifier {
  PersonModel _user = PersonModel.newObject();
  PersonModel _partner = PersonModel.newObject();

  PersonModel getUser() {
    return _user;
  }

  void registerUser({required PersonModel newUser, required bool save}) {
    if (save) {}
    _user = newUser;
  }

  void registerPartner({required PersonModel newPartner}) {
    _partner = newPartner;
  }

  int _getPos(int pos, int max) {
    int sumNames = (_user.name.hashCode + _partner.name.hashCode).abs() % max;

    //while (sumNames > max) {
    // sumNames = (sumNames / 2).round();
    // }
    if (sumNames < 1) {
      sumNames = 1;
    }
    return sumNames;
  }

  String calculateNames() {
    ResponseModel response = ResponseModel(
      posText: _getPos(1, 10),
      genre: _partner.genre,
      posCategory: _getPos(2, 3),
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
