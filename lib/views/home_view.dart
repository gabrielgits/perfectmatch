import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Text('msg').tr(args: ['Chands', 'Bond']),
          onTap: () => print(context.locale.toString()),
        ),
      ),
    );
  }
}
