import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person_model.dart';
import '../models/response_model.dart';

class ControllerApp extends Notifier<String> {
  @override
  String build() {
    return reset();
  }

  String reset() {
    state = '';
    return '';
  }

  String calculateNames({
    required PersonModel user,
    required PersonModel partner,
  }) {
    ResponseModel response = ResponseModel(
      posText: _getPos(max: 10, userName: user.name, partnerName: partner.name),
      genre: partner.genre,
      posCategory:
          _getPos(max: 3, userName: user.name, partnerName: partner.name),
    );
    final result = tr(
      'results.category${response.posCategory}.pos${response.posText}',
      namedArgs: {
        'name': partner.name,
        'genre': partner.genre == 'male' ? tr('he') : tr('she'),
      },
    );
    state = result;
    return result;
  }

  int _getPos({
    required int max,
    required String userName,
    required partnerName,
  }) {
    int sumNames = (userName.hashCode + partnerName.hashCode).abs() % max;
    if (sumNames < 1) {
      sumNames = 1;
    }
    return sumNames;
  }
}

final controllerAppProvider = NotifierProvider<ControllerApp, String>(() {
  return ControllerApp();
});
