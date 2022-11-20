import 'package:easy_localization/easy_localization.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: tr('sliders.title1'),
    image: "assets/images/slider1.png",
    desc: tr('sliders.desc1'),
  ),
  OnboardingContents(
    title: tr('sliders.title2'),
    image: "assets/images/slider2.png",
    desc: tr('sliders.desc2'),
  ),
  OnboardingContents(
    title: tr('sliders.title3'),
    image: "assets/images/slider3.png",
    desc: tr('sliders.desc3'),
  ),
];
