import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_deva/responsive_deva.dart';

import 'color_theems.dart';


class DateTimeContainerWidget extends StatelessWidget {
  final String title;
  final dynamic icon;
  final Color? iconColor, textColor, borderColor;
  final VoidCallback onPressed;
  const DateTimeContainerWidget({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
    this.textColor,
    this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // width: double.infinity,
         height: getHeight(70),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        // margin: EdgeInsets.only(right: 2.w,left: 2.w),
        decoration: BoxDecoration(
          color: AppColors.textFieldHintText.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor ?? AppColors.textFieldHintText,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.start,
            ),
            Icon(
              icon,
              size: 6.w,
              color: iconColor ?? AppColors.textFieldHintText,
            )
          ],
        ),
      ),
    );
  }
}
