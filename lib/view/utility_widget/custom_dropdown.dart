import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> itemList;
  final String? selectedItem;
  final String hintText;
  ValueChanged<String?>? onChanged;

   CustomDropdown({super.key,
    required this.itemList,
     this.onChanged,
    required this.hintText,
    this.selectedItem,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
   String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(70),

      decoration: BoxDecoration(
        color: AppColors.textFieldHintText.withOpacity(0.2),
        border: Border.all(color: const Color(0XFFD8DEEB), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, right: 10,top: 10),
        child: Container(

          width: MediaQuery.of(context).size.width,
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: TextStyle(
                color: notifier.textFieldHintText    ,
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope-Bold",
                fontSize: 11.sp,
              ),
            ),
            value: selectedValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style:  TextStyle(
              fontSize: 11.sp,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400,
              color: notifier.textFieldHintText    ,
            ),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
              // widget.onChanged!(newValue);
            },
            items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: "Manrope-Bold",
                        fontWeight: FontWeight.w400,
                        color: widget.onChanged != null?AppColors.textColor : AppColors.textFieldHintText   ,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
