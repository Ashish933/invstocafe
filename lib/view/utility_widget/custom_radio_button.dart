import 'package:flutter/material.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

class CustomHorizontalRadioButton extends StatefulWidget {
  final List<String> itemList;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  CustomHorizontalRadioButton({
    required this.itemList,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  _CustomHorizontalRadioButtonState createState() => _CustomHorizontalRadioButtonState();
}

class _CustomHorizontalRadioButtonState extends State<CustomHorizontalRadioButton> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(70),
      width: double.infinity,
      decoration: BoxDecoration(
        color: notifier.textField,
        borderRadius: BorderRadius.circular(15),
      ),
      child:
      ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: widget.itemList.map((item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio<String>(
                value: item,
                groupValue: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onChanged(value);
                },
              ),
              Text(item,
                style: TextStyle(
              color: notifier.textFieldHintText    ,
          fontWeight: FontWeight.w400,
          fontFamily: "Manrope-Bold",
          fontSize: 11.sp,),),
              SizedBox(width: 16), // Adjust the spacing as needed
            ],
          );
        }).toList(),
      ),
    );
  }
}
