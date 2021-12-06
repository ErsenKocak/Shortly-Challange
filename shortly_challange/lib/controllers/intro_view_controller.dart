import 'package:get/get.dart';

class IntroViewController extends GetxController {
  var introViewCurrentPageIndex = 0.obs;
  List<Map<String, String>> introViewData = [
    {
      "titleText": "Brand Recognition",
      "descriptionText":
          "Boos your brand recognition with each click. Generic links don't mean a thing.Branded links help instil confidence in you content.",
      "imagePath": "assets/images/paint-brush.png",
    },
    {
      "titleText": "Detailed Records",
      "descriptionText":
          "Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.",
      "imagePath": "assets/images/paint-brush.png",
    },
    {
      "titleText": "Fully Customizable",
      "descriptionText":
          "Improve brand awareness and content discoverability through customizable links, supercharging audience engagement",
      "imagePath": "assets/images/paint-brush.png",
    },
  ];

  getCurrentPageIndex(int currentPageIndex) {
    introViewCurrentPageIndex.value = currentPageIndex;
  }
}
