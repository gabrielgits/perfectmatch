import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/controller_app.dart';

class ResponseView extends StatelessWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = context.read<ControllerApp>();
    String response = controllerApp.calculateNames();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(response),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/match');
              },
              child: Text(tr('buttonBackMatch')),
            ),
          ],
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
