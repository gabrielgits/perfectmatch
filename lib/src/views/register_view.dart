import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controller_user.dart';
import '../controllers/lists.dart';
import '../models/person_model.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({required this.user, super.key});
  final PersonModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController usernameTEC = TextEditingController(text: user.name);
    Genre genreValue = listGenres.first;
    bool saveUser = false;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              tr('registerInfo'),
              style: const TextStyle(fontSize: 16),
            ),
            Column(
              children: [
                BformTextInput(
                  controller: usernameTEC,
                  label: tr('labelName'),
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 20,
                ),
                BformGroupRadio(
                  label: tr('labelGenre'),
                  item: genreValue,
                  listItems: listGenres,
                  onChange: (value) => genreValue = listGenres[value.id],
                ),
              ],
            ),
            Column(
              children: [
                BformCheckbox(
                  label: tr('textCheckBoxGender'),
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  inicialState: saveUser,
                  onChange: (value) {
                    saveUser = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BformButton(
                  onPressed: () {
                    ref.read(controllerUserProvider.notifier).registerUser(
                          newUser: PersonModel(
                            name: usernameTEC.text,
                            genre: genreValue.title,
                          ),
                          save: saveUser,
                        );
                  },
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  style: BformButtonStyle.highlighted,
                  textColor: Colors.white,
                  colors: const [Colors.blue, Colors.purple],
                  label: tr('buttonRegister'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
