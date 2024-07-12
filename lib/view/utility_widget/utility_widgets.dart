import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/colors_widget.dart';


ColorNotifire notifier = ColorNotifire();

class UtilityWidgets{


  static Text MainText(String txt,
      { size,
        textAlign = TextAlign.center,
        fontStyle = FontStyle.normal,
        color,
        bool? iconColor,
        fontW,
        decoration}) {
    return Text(
      txt,

      style: TextStyle(
          fontStyle: fontStyle,
          fontWeight: fontW ?? FontWeight.w600,
          fontSize: size?? 22.sp,
          fontFamily: "Manrope-Bold",
          color: color??AppColors.textColor),
    );
  }








  static Widget inputField({
    dynamic inputType,
    bool readOnly = false,
    dynamic hrMargin,
    dynamic controller,
    int? maxLength,
    dynamic suffix,
    String? hintTxt,
    String? errorTxt,
    dynamic prefixIcon,
     dynamic  size,
    bool obscureText = false,
    int? maxLines,
    bool isFieldValid = true,
    List<TextInputFormatter>? inputFormatters,


    String? Function(String?)? validator,
  }) {
    return TextFormField(
      autovalidateMode: isFieldValid
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      textAlignVertical: TextAlignVertical.center,
      readOnly: readOnly,
      obscureText: obscureText,
      controller: controller ?? TextEditingController(),
      keyboardType: inputType,
      cursorColor: Colors.blue,

      onFieldSubmitted: (_) {},
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontSize: 11.sp,
        fontFamily: "Manrope-Bold",
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
      validator: validator != null
          ? (value) {
        isFieldValid = validator(value) == null;

        return validator(value);
      }
          : null,
      // validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction, // This enables auto-validation
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.textFieldHintText.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor), // Set your desired color
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Match container's borderRadius
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Match container's borderRadius
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        errorText: errorTxt,
        errorStyle: TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        prefixIcon: prefixIcon,
        suffix: suffix,
        filled: true,
        hintText: hintTxt,
        hintStyle: TextStyle(
          color: AppColors.textFieldHintText,
          fontWeight: FontWeight.w400,
          fontFamily: "Manrope-Bold",
          fontSize: 11.sp,
        ),
      ),
    );

  }


  static Widget queryInputField({
    TextInputType inputType = TextInputType.text,
    bool readOnly = false,
    dynamic hrMargin,
    dynamic controller,
    int? maxLength,
    dynamic suffix,
    String? hintTxt,
    String? errorTxt,
    dynamic prefixIcon,
    required Size size,
    bool obscureText = false,
    int? maxLines,
    bool isFieldValid = true,

    String? Function(String?)? validator,
  }) {
    return
      Container(
        height: getHeight(300),
        decoration: BoxDecoration(
          color: AppColors.textFieldHintText.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          autovalidateMode: isFieldValid
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          textInputAction:TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          readOnly: readOnly,
          obscureText: obscureText,
          controller: controller ?? TextEditingController(),
          keyboardType: inputType,
          onFieldSubmitted: (_) {},
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          validator: validator != null
              ? (value) {
            if (validator(value) != null) {
              // If custom validator provided and it returns an error message,
              // directly return it.
              return validator(value);
            }
            // If custom validator returns null, check for mobile number length.
            if (inputType == TextInputType.phone) {
              if (value != null && value.length != 10) {
                return 'Mobile number must be 10 digits long';
              }
            }
            return null;
          }
              : null,

          style: const TextStyle(color: AppColors.textColor),
          cursorColor:  AppColors.primaryColor, // Set your desired cursor color
          decoration: InputDecoration(
            hintText: hintTxt,
            isDense: true,
            errorText: errorTxt,
            prefixIcon: prefixIcon,
            suffix: suffix,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            errorStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            hintStyle: TextStyle(
              color: AppColors.textFieldHintText    ,
              fontWeight: FontWeight.w400,
              fontFamily: "Manrope-Bold",
              fontSize: 11.sp,
            ),
            // Set the focused border color
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor), // Set your desired color
              borderRadius: BorderRadius.circular(15),
            ),
            // Remove the default border
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      );
  }










}