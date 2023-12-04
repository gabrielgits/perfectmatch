import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controller_app.dart';
import '../models/person_model.dart';
import 'widgets/select_widget.dart';

class MatchView extends ConsumerWidget {
  const MatchView(this.user, {super.key});
  final PersonModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(controllerAppProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: result.isEmpty
              ? _formMatch(ref: ref, user: user)
              : _resultMatch(result: result, ref: ref),
        ),
      ),
    );
  }
}

_formMatch({required WidgetRef ref, required PersonModel user}) {
  List<String> listGenres = <String>[tr('ItemMale'), tr('ItemFemale')];
  TextEditingController partnerNameTEC = TextEditingController();
  String genreValue = '';

  return Column(
    children: [
      const SizedBox(
        height: 50,
      ),
      TextField(
        controller: partnerNameTEC,
        decoration: InputDecoration(
          labelText: tr('LabelName'),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: tr('hintTextNamePartner'),
        ),
      ),
      const SizedBox(height: 10),
      Text(tr('textPartnerGender')),
      SelectWidget(
        value: genreValue,
        list: listGenres,
        onChanged: (value) => genreValue = value,
      ),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () {
          ref.read(controllerAppProvider.notifier).calculateNames(
                user: user,
                partner: PersonModel(
                  name: partnerNameTEC.text,
                  genre: genreValue,
                ),
              );
        },
        child: Text(tr('buttonMatch')),
      ),
    ],
  );
}

_resultMatch({required String result, required WidgetRef ref}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(result),
      ElevatedButton(
        onPressed: () {
          ref.read(controllerAppProvider.notifier).reset();
        },
        child: Text(tr('buttonBackMatch')),
      ),
    ],
  );
}
