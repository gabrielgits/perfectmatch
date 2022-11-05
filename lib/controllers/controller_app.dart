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
    int sum = _user.name.codeUnitAt(pos) + _partner.name.codeUnitAt(pos);
    int i = 1;
    while (sum >= max) {
      sum = (sum / i).round();
      i++;
    }
    return sum;
  }

  String calculateNames() {
    ResponseModel response = ResponseModel(
      posText: _getPos(1, 10),
      genre: _partner.genre,
      posCategory: _getPos(2, 5),
    );
    return tr('results.category${response.posCategory}.pos${response.posText}');
  }
}
