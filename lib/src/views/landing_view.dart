import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key, required this.started});

  final VoidCallback started;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              autoPlay: true,
            ),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return _slideItem(
                    title: tr('landing.title$i'),
                    text: tr('landing.text$i'),
                    imagePath: "assets/images/landing/slider$i.png",
                  );
                },
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: started,
            child: Text(
              tr('landing.btnStart'),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

_slideItem(
    {required String title, required String text, required String imagePath}) {
  return Container(
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.grey[200],
    ),
    child: Column(
      children: [
        Image.asset(imagePath, height: 350.0, width: 300.0),
        const SizedBox(height: 8.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}
