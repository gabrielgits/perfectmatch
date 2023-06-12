import 'package:easy_localization/easy_localization.dart';

class Slider {
  final String title;
  final String image;
  final String desc;

  Slider({
    required this.title,
    required this.image,
    required this.desc,
  });
}

final List<Slider> contents = [
  Slider(
    title: tr('sliders.title1'),
    image: "assets/images/slider1.png",
    desc: tr('sliders.desc1'),
  ),
  Slider(
    title: tr('sliders.title2'),
    image: "assets/images/slider2.png",
    desc: tr('sliders.desc2'),
  ),
  Slider(
    title: tr('sliders.title3'),
    image: "assets/images/slider3.png",
    desc: tr('sliders.desc3'),
  ),
];

