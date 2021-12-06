import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shortly_challange/controllers/link_controller.dart';

import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/core/widgets/custom_button_widget/custom_button_widget.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ShortedLinkCardWidget extends StatelessWidget {
  var _linkController = Get.put(LinkController());
  String originalLink;
  String shortedLink;
  ShortedLinkCardWidget({
    Key? key,
    required this.originalLink,
    required this.shortedLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title: Text(
                originalLink,
                style: TextStyle(fontSize: 20),
                maxLines: 1,
              ),
              trailing: IconButton(
                color: Colors.black,
                onPressed: () {
                  _linkController.shortedLinks
                      .removeWhere((link) => link.originalLink == originalLink);
                },
                icon: Icon(Icons.delete),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        await launch(shortedLink);
                      },
                      child: Text(
                        shortedLink,
                        style: TextStyle(fontSize: 20, color: primaryColor),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => CustomButtonWidget(
                            onPress: () {
                              _linkController.copiedLink.value = shortedLink;
                              Clipboard.setData(ClipboardData(
                                  text: _linkController.copiedLink.value));
                            },
                            childWidget: Text(
                              _linkController.copiedLink.value == shortedLink
                                  ? 'COPIED!'
                                  : 'COPY',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              maxLines: 1,
                            ),
                            backgroundColor:
                                _linkController.copiedLink.value == shortedLink
                                    ? purpleColor
                                    : null,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
