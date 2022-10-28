import 'package:perfectmatch/models/person_model.dart';
import 'package:perfectmatch/models/response_model.dart';

class ControllerApp {
  int _namesToNumber(String userName, String partnerName) {
    int pos = 1;
    int sum = userName.codeUnitAt(pos) + partnerName.codeUnitAt(pos);
    int i = 1;
    while (sum >= 10) {
      sum = (sum / i).round();
      i++;
    }
    return sum;
  }

  int _namesToCategory(String userName, String partnerName) {
    int pos = 2;
    int sum = userName.codeUnitAt(pos) + partnerName.codeUnitAt(pos);
    int i = 1;
    while (sum >= 5) {
      sum = (sum / i).round();
      i++;
    }
    return sum;
  }

  ResponseModel calculateNames(
      {required PersonModel user, required PersonModel partner}) {
    return ResponseModel(
        lineNumber: _namesToNumber(user.name, partner.name),
        genre: partner.genre,
        category: _namesToCategory(user.name, partner.name));
  }
}
