
// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/color_theems.dart';

class CommonDropDown extends StatefulWidget {
  final List<String> itemList;
  final bool isEnabled;
  final Color? containerColor,
      dropdownColor,
      dropdownTextColor,
      selectedValueTextColor;
  final dynamic icon;
  final ValueChanged<String> onChanged;
  String? selectedValue;
  final BorderRadius borderRadius;
  final String? hint;
  final Color? bgColor, iconColor;
  final Color? hintColor;
  final double? height;

  CommonDropDown({
    Key? key,
    required this.isEnabled,
    this.containerColor,
    this.iconColor,
    this.height = 50,
    this.dropdownColor,
    this.dropdownTextColor,
    this.selectedValueTextColor,
    this.icon,
    this.hintColor,
    required this.onChanged,
    this.selectedValue,
    this.bgColor,
    required this.itemList,
    this.hint,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(5.0),
    ),
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommonDropDownState createState() {
    return _CommonDropDownState();
  }
}

class _CommonDropDownState extends State<CommonDropDown> {
  String? dropDownValue;

  @override
  void initState() {
    dropDownValue = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(
          width: 0.2.w,
          color: widget.containerColor ?? AppColors.backGroundColor,
        ),
        borderRadius: widget.borderRadius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              widget.hint ?? "",
              style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: widget.hintColor,
                fontSize: 12.sp,
              ),
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                widget.icon ?? Icons.keyboard_arrow_down_rounded,
                color: widget.iconColor ?? Colors.grey,
              ),
            ),
          ),
          isExpanded: true,
          itemHeight: 50,
          value: widget.selectedValue,
          onChanged: (String? newValue) {
            setState(() => widget.selectedValue = newValue);
            widget.onChanged(newValue ?? '');
          },
          selectedItemBuilder: (BuildContext context) {
            return widget.itemList.map((String value) {
              return Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.selectedValue ?? '',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "Manrope-Bold",
                        color: widget.dropdownTextColor ?? AppColors.backGroundColor
                      // color: changeColor(dropDownValue),
                    ),
                  ),
                ),
              );
            }).toList();
          },
          items:
          widget.itemList.map(
                (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.titleText,
                          fontFamily:"Manrope-Bold",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
