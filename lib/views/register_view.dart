import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:perfectmatch/controllers/controller_app.dart';
import 'package:perfectmatch/models/person_model.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  List<String> listGenres = <String>[tr('ItemMale'), tr('ItemFemale')];

  //late ControllerApp controllerApp;
  PersonModel user = PersonModel.newObject();
  TextEditingController usernameTEC = TextEditingController();
  String genreValue = '';
  bool saveUser = false;

  @override
  Future<void> initState() async {
    super.initState();

    usernameTEC.text = user.name;
    genreValue = listGenres[user.genre - 1];
    saveUser = user.name != '';
  }

  @override
  Widget build(BuildContext context) {
    final controllerApp = context.read<ControllerApp>();
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
                  labelText: 'LabelName'.tr(),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: tr('hintTextName'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: genreValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    genreValue = value!;
                  });
                },
                items: listGenres.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                      setState(() {
                        saveUser = value!;
                      });
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
                  controllerApp.registerUser(
                    newUser: PersonModel(
                      name: usernameTEC.text,
                      genre: genreValue == tr('ItemMale') ? 1 : 2,
                    ),
                    save: saveUser,
                  );
                  Navigator.pushNamed(context, '/match');
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
