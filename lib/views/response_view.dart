import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResponseView extends StatelessWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            
            const Text('Response'),
          
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
