import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly_challange/controllers/intro_view_controller.dart';
import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/core/widgets/custom_button_widget/custom_button_widget.dart';
import 'package:shortly_challange/core/widgets/start_description_widget/start_description_widget.dart';
import 'package:shortly_challange/core/widgets/svg_assets_widget/svg_assets_widget.dart';
import 'package:shortly_challange/views/intro/widgets/intro_card_widget/intro_card_widget.dart';

class IntroView extends StatelessWidget {
  var _introViewController =
      Get.put<IntroViewController>(IntroViewController());
  IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: SvgAssetsWidget(
                assetName: 'assets/images/logo.svg',
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                child: PageView.builder(
                  onPageChanged: (index) =>
                      _introViewController.introViewCurrentPageIndex(index),
                  itemCount: _introViewController.introViewData.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(top: 24),
                    child: IntroCardWidget(
                      assetImagePath: 'assets/images/paint-brush.png',
                      cardBody: StartDescriptionWidget(
                        titleText: _introViewController.introViewData[index]
                            ["titleText"]!,
                        descriptionText: _introViewController
                            .introViewData[index]["descriptionText"]!,
                        titleFontSize: 26,
                        descriptionFontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _introViewController.introViewData.length,
                        (index) => buildDot(
                            index: index,
                            currentPageIndex: _introViewController
                                .introViewCurrentPageIndex.value),
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                      childWidget: Text('SKIP'),
                      onPress: () {
                        Get.toNamed('/main');
                      }),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildDot({required int index, required int currentPageIndex}) {
  return Column(
    children: [
      AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPageIndex == index ? 20 : 6,
        decoration: BoxDecoration(
          color: currentPageIndex == index ? primaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    ],
  );
}
