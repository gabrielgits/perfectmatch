import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/person_model.dart';
import 'register_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final PersonModel user;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text(App.name)),
        body: TabBarView(
          children: [
            RegisterView(user: user),
            const Icon(Icons.settings),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.gamepad)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
