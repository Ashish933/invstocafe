import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/custom_dropdown.dart';
import '../../utility_widget/custom_radio_button.dart';

class KycDetails extends StatefulWidget {
  const KycDetails({super.key});

  @override
  State<KycDetails> createState() => _KycDetailsState();
}

class _KycDetailsState extends State<KycDetails> {
  TextEditingController panCtr = TextEditingController();
  TextEditingController fatherNameCtr = TextEditingController();
  TextEditingController incomeCtr = TextEditingController();

  String? selectGender;

  List<String> occupationList = [
    "Accountant",
    "Actor/Actress",
    "Architect",
    "Artist",
    "Athlete",
    "Author/Writer",
    "Baker",
    "Banker",
    "Barber/Hairdresser",
    "Chef",
    "Civil Engineer",
    "Clergy",
    "Consultant",
    "Dentist",
    "Doctor/Physician",
    "Engineer (various disciplines)",
    "Farmer",
    "Firefighter",
    "Graphic Designer",
    "Homemaker",
    "Information Technology Professional (IT)",
    "Journalist",
    "Lawyer",
    "Librarian",
    "Marketing Professional",
    "Musician",
    "Nurse",
    "Police Officer",
    "Professor/Teacher/Educator",
    "Retail Worker",
    "Sales Representative",
    "Scientist (various fields)",
    "Social Worker",
    "Software Developer/Engineer",
    "Student",
    "Surgeon",
    "Taxi/Uber/Lyft Driver",
    "Veterinarian",
    "Waiter/Waitress",
    "Other (for occupations not listed)"
  ];

  List<String> maritalStatusList = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'Separated',
    'Domestic Partnership/Civil Union',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(
          left: 1.w,
          right: 1.w,
          top: 1.h,
        ),
        padding: EdgeInsets.only(left: 2.w,right: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 2, //spread radius
              blurRadius: 7, // blur radius
              offset: const Offset(0, 2), // changes position of shadow
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
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: [
                      boxHeight(20),
                      UtilityWidgets.MainText("PAN No.",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: panCtr,
                          hintTxt: "Investor PAN",
                          inputType: TextInputType.text,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Father's Name",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: fatherNameCtr,
                          hintTxt: "Father/Spouse Name",
                          inputType: TextInputType.name,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Occupation",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      CustomDropdown(
                        itemList: occupationList,
                        hintText: 'Occupation',
                        onChanged: (String? value) {
                          print('Selected item: $value');
                        },
                      ),
                      boxHeight(12),
                      UtilityWidgets.MainText("Marital Status",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      CustomDropdown(
                        itemList: maritalStatusList,
                        hintText: 'Marital Status',
                        onChanged: (String? value) {
                          print('Selected item: $value');
                        },
                      ),
                      boxHeight(12),
                      UtilityWidgets.MainText("Income",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: incomeCtr,
                          hintTxt: "Yearly Income",
                          inputType: TextInputType.name,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Related to politically Exposed",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      CustomHorizontalRadioButton(
                        itemList: ['YES', 'NO'],
                        selectedItem:
                            'YES', // You can change this based on your requirement
                        onChanged: (String? value) {
                          print('Selected : $value');
                        },
                      ),
                      boxHeight(12),
                      UtilityWidgets.MainText("Politically Exposed",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      CustomHorizontalRadioButton(
                        itemList: ['YES', 'NO'],
                        selectedItem:
                            'YES', // You can change this based on your requirement
                        onChanged: (String? value) {
                          print('Selected : $value');
                        },
                      ),
                      boxHeight(120),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
