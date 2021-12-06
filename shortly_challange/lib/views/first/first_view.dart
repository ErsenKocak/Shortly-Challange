import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly_challange/core/widgets/custom_button_widget/custom_button_widget.dart';
import 'package:shortly_challange/core/widgets/start_description_widget/start_description_widget.dart';
import 'package:shortly_challange/core/widgets/svg_assets_widget/svg_assets_widget.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            Expanded(
              flex: 1,
              child: SvgAssetsWidget(
                assetName: 'assets/images/logo.svg',
              ),
            ),
            Spacer(),
            Expanded(
              flex: 7,
              child: SvgAssetsWidget(
                assetName: 'assets/images/illustration.svg',
              ),
            ),
            Expanded(
                flex: 4,
                child: StartDescriptionWidget(
                  titleText: 'More than just shorter links',
                  descriptionText:
                      "Build your brand's recognition and get detailed insights on how your links are performing ",
                  titleFontSize: 40,
                  descriptionFontSize: 18,
                )),
            Spacer(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButtonWidget(
                  onPress: () {
                    Get.toNamed('/intro');
                  },
                  childWidget: const Text(
                    'START',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
