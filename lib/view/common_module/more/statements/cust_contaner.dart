import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';

class RectangleContainer extends StatelessWidget {
  final String text;
  final String imagePath;

  const RectangleContainer({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 1.w,
                right: 1.w,
                top: 1.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: Image.asset(
                        imagePath,
                        scale: 1.5,
                      ),
                      title: UtilityWidgets.MainText(text,
                          size: 12.sp, color: AppColors.titleText),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
