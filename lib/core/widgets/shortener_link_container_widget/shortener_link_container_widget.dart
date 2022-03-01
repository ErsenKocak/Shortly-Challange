import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shortly_challange/controllers/link_controller.dart';
import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/core/init/locator.dart';
import 'package:shortly_challange/core/widgets/custom_button_widget/custom_button_widget.dart';
import 'package:shortly_challange/core/widgets/custom_painter/custom_container_shape_border.dart';

class ShortenerLinkContainerWidget extends StatelessWidget {
  final _linkController = Get.put(LinkController());
  final _formKey = GlobalKey<FormState>();
  late String _userLink;
  ShortenerLinkContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: purpleColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 110.0,
            top: 100.0,
            child: CustomPaint(
              painter: CustomContainerShapeBorder(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                radius: 100.0,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16, top: 16, left: 48, right: 48),
            child: Column(
              children: [
                Expanded(
                    child: Obx(
                  () => Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _linkController.linkIsValid.value = false;
                          return '';
                        }
                        _linkController.linkIsValid.value = true;
                        _userLink = value;
                        return null;
                      },
                      textAlign: TextAlign.center,
                      autofocus: false,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _linkController.linkIsValid.value
                                ? Colors.grey.withOpacity(0.9)
                                : Colors.red.withOpacity(0.9)),
                        hintText: _linkController.linkIsValid.value
                            ? 'Shorten a link here...'
                            : 'Please add a link here',
                        contentPadding:
                            EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.red,
                              style: BorderStyle.solid),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.red,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButtonWidget(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _linkController.shortenLink(link: _userLink);
                      }
                    },
                    childWidget: Text(
                      'SHORTEN IT!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
