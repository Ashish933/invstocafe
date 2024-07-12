import 'package:flutter/material.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/color_theems.dart';

class CustomButton{
  static InkWell button(text,
  {Function? callBack, double? size // Providing a default value for size
  }) {
    return InkWell(
      onTap: () => callBack!(),
      child:Container(
        height: getHeight(70),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(15),
          color:AppColors.buttonColor,),
        child:  Center(
            child: Text(text,

              style:  TextStyle(color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w600,
                  fontSize: size ?? 14.sp,fontFamily: "Manrope-Bold"),)),
      ),


    );
  }



  static InkWell buttonWithoutBg(text, {Function? callBack}) {
    return InkWell(
      onTap: () => callBack!(),
      child: Container(
        height: getHeight(70),
        decoration: BoxDecoration(color: notifier.tabBar2,borderRadius: BorderRadius.circular(15)),
        child: Center(
            child:
        Text(text,
            style: const TextStyle(fontSize: 16,
                color: Color(0xff6B39F4),
                fontFamily: "Manrope-Bold"))) ,
      ),

    );
  }

}