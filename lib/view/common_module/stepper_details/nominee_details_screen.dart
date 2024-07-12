import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/custom_button.dart';
import '../../utility_widget/utility_widgets.dart';

class NomineeDetails extends StatefulWidget {
  const NomineeDetails({Key? key});

  @override
  State<NomineeDetails> createState() => _NomineeDetailsState();
}

class _NomineeDetailsState extends State<NomineeDetails> {
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> relationControllers = [];
  List<TextEditingController> percentageControllers = [];
  List<TextEditingController> dobControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize the first set of controllers
    nameControllers.add(TextEditingController());
    relationControllers.add(TextEditingController());
    percentageControllers.add(TextEditingController());
    dobControllers.add(TextEditingController());
  }

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        // Format the picked date
        String formattedDate = "${picked.day}/${picked.month}/${picked.year}";
        dobControllers[index].text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(
          left: 1.w,
          right: 1.w,
          top: 1.h,
        ),
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    boxHeight(20),
                    // Show the first set of fields
                    _buildFields(0, size),
                    // Show additional sets of fields
                    for (int index = 1; index < nameControllers.length; index++)
                      _buildFields(index, size),
                    boxHeight(10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton.button(
                            "Clear",
                            callBack: () {
                              if (nameControllers.length > 1) {
                                setState(() {
                                  // Remove the last set of controllers
                                  nameControllers.removeLast();
                                  relationControllers.removeLast();
                                  percentageControllers.removeLast();
                                  dobControllers.removeLast();
                                });
                              }
                            },
                          ),
                        ),
                        boxWidth(50),
                        Expanded(
                          child: CustomButton.button(
                            "Add+",
                            callBack: () {
                              setState(() {
                                // Add new set of controllers
                                nameControllers.add(TextEditingController());
                                relationControllers.add(TextEditingController());
                                percentageControllers.add(TextEditingController());
                                dobControllers.add(TextEditingController());
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    boxHeight(200),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFields(int index, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UtilityWidgets.MainText("Nominee Name ${index + 1}",
            size: 12.sp, color: notifier.textColor),
        boxHeight(5),
        UtilityWidgets.inputField(
          controller: nameControllers[index],
          hintTxt: "Name",
          inputType: TextInputType.name,
          hrMargin: 0.0,
          size: size.height / 0.1,
        ),
        boxHeight(12),
        UtilityWidgets.MainText("Relationship With Nominee",
            size: 12.sp, color: notifier.textColor),
        boxHeight(5),
        UtilityWidgets.inputField(
          controller: relationControllers[index],
          hintTxt: "Relation",
          inputType: TextInputType.name,
          hrMargin: 0.0,
          size: size,
        ),
        boxHeight(12),
        UtilityWidgets.MainText("Percentage",
            size: 12.sp, color: notifier.textColor),
        boxHeight(5),
        UtilityWidgets.inputField(
          controller: percentageControllers[index],
          hintTxt: "Give authority Percentage",
          inputType: TextInputType.number,
          hrMargin: 0.0,
          size: size,
        ),
        boxHeight(12),
        UtilityWidgets.MainText("Date of Birth",
            size: 12.sp, color: notifier.textColor),
        boxHeight(5),
        GestureDetector(
          onTap: () {
            _selectDate(context, index);
          },
          child: AbsorbPointer(
            child: UtilityWidgets.inputField(
              controller: dobControllers[index],
              hintTxt: "Date Of Birth",
              inputType: TextInputType.number,
              hrMargin: 0.0,
              size: size,
            ),
          ),
        ),

        boxHeight(10),
        Horizontal.customDivider(),

        boxHeight(12),
      ],
    );
  }
}
