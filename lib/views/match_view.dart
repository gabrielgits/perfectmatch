import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/controller_app.dart';
import '../models/person_model.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  List<String> listGenres = <String>[tr('ItemMale'), tr('ItemFemale')];

  late ControllerApp controllerApp;
  PersonModel partner = PersonModel.newObject();
  TextEditingController partnerNameTEC = TextEditingController();
  String genreValue = '';

  @override
  void initState() {
    super.initState();
    controllerApp = context.read<ControllerApp>();
    genreValue = listGenres[0];
  }

  @override
  Widget build(BuildContext context) {
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
                controller: partnerNameTEC,
                decoration: InputDecoration(
                  labelText: 'LabelName'.tr(),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: tr('hintTextNamePartner'),
                ),
              ),
              const SizedBox(height: 10),
              Text(tr('textPartnerGender')),
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
              ElevatedButton(
                onPressed: () {
                  controllerApp.registerPartner(
                    newPartner: PersonModel(
                      name: partnerNameTEC.text,
                      genre: genreValue == tr('ItemMale') ? 1 : 2,
                    ),
                  );
                  Navigator.pushNamed(context, '/response');
                },
                child: Text(tr('buttonMatch')),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(tr('buttonBackRegister')),
        ),
      ),
    );
  }
}
