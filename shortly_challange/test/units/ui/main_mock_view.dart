import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly_challange/controllers/link_controller.dart';
import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/core/init/locator.dart';
import 'package:shortly_challange/core/widgets/custom_button_widget/custom_button_widget.dart';
import 'package:shortly_challange/core/widgets/shortener_link_container_widget/shortener_link_container_widget.dart';
import 'package:shortly_challange/core/widgets/start_description_widget/start_description_widget.dart';
import 'package:shortly_challange/core/widgets/svg_assets_widget/svg_assets_widget.dart';
import 'package:shortly_challange/views/main/widgets/shorted_link_card_widget/shorted_link_card_widget.dart';

import '../controller/link_mock_controller.dart';

class MainMockView extends StatelessWidget {
  var _linkController = Get.put(LinkMockController());
  MainMockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 1,
          ),
          // buildShortedLinksView(),
          Obx(() => _linkController.shortedLinks.length > 0
              ? buildShortedLinksView()
              : Expanded(flex: 7, child: buildLetsStartedView())),
          //buildLetsStartedView(),
          buildShortenerLinkContainer(),
        ],
      ),
    );
  }

  buildShortedLinksView() {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Your Link History',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _linkController.shortedLinks.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ShortedLinkCardWidget(
                      originalLink:
                          _linkController.shortedLinks[index].originalLink!,
                      shortedLink:
                          _linkController.shortedLinks[index].fullShortLink!,
                    ));
                // return Text('asdasd');
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildShortenerLinkContainer() {
    return Expanded(
      flex: 4,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ShortenerLinkContainerWidget())
        ],
      ),
    );
  }

  buildLetsStartedView() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SvgAssetsWidget(assetName: 'assets/images/logo.svg'),
        ),
        Expanded(
          flex: 6,
          child: SvgAssetsWidget(assetName: 'assets/images/illustration.svg'),
        ),
        Expanded(
          flex: 2,
          child: StartDescriptionWidget(
            titleText: "Let's get started!",
            descriptionText:
                "Paste your first link into  the field to shorten it",
            descriptionWidth: 200,
            titleFontSize: 20,
            descriptionFontSize: 18,
          ),
        ),
      ],
    );
  }
}
