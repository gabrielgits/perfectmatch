import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controller_user.dart';
import '../models/person_model.dart';
import 'widgets/select_widget.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({required this.user, super.key});
  final PersonModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> listGenres = <String>[tr('itemMale'), tr('itemFemale')];

    TextEditingController usernameTEC = TextEditingController(text: user.name);
    String genreValue = user.genre;
    bool saveUser = false;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: usernameTEC,
                decoration: InputDecoration(
                  labelText: tr('labelName'),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: tr('hintTextName'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SelectWidget(
                value: genreValue,
                list: listGenres,
                onChanged: (value) => genreValue = value,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: saveUser,
                    onChanged: (bool? value) {
                      saveUser = value!;
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('textCheckBoxGender').tr(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(controllerUserProvider.notifier).registerUser(
                        newUser: PersonModel(
                          name: usernameTEC.text,
                          genre: genreValue,
                        ),
                        save: saveUser,
                      );
                },
                child: Text(tr('buttonRegister')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
