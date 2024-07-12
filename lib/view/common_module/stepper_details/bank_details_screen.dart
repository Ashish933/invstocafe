import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/custom_dropdown.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController accountHolderNameCtr = TextEditingController();
  TextEditingController accountNoCtr = TextEditingController();
  TextEditingController ifscCtr = TextEditingController();
  TextEditingController branchCtr = TextEditingController();


  List<String> accountTypesList = [
   "Saving Account",
    "Current Account",
    "NRI-Repatriable(NRE)",
    "NRI-Repatriable(NRO)",
  ];

List<String> bankNameList = [
  "Kotak Mahindra Bank",
  "IDBI Bank",
  "Canara Bank",
  "Union Bank of India",
  "State Bank of India",
  "ICICI Bank",
  "HDFC Bank",
  "Axis Bank",
  "Punjab National Bank",
  "Bank of Baroda",
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
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
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
                      horizontalOffset: 60.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      boxHeight(20),
                      UtilityWidgets.MainText("Investor Name",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: nameCtr,
                          hintTxt: "Name",
                          inputType: TextInputType.name,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Account Holder Name",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: accountHolderNameCtr,
                          hintTxt: "Name",
                          inputType: TextInputType.name,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Account No.",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: accountNoCtr,
                          hintTxt: "Account No.",
                          inputType: TextInputType.number,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("IFSC Code",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: ifscCtr,
                          hintTxt: "Ifsc Code",
                          inputType: TextInputType.text,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Bank & Branch",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      UtilityWidgets.inputField(
                          controller: branchCtr,
                          hintTxt: "Branch",
                          inputType: TextInputType.text,
                          hrMargin: 0.0,
                          size: size),
                      boxHeight(12),
                      UtilityWidgets.MainText("Account Type",
                          size: 12.sp, color: AppColors.textColor),
                      boxHeight(5),
                      CustomDropdown(
                        itemList: accountTypesList,
                        hintText: 'Account Type',
                        onChanged: (String? value) {
                          print('Selected item: $value');
                        },
                      ),
                      boxHeight(12),

                      UtilityWidgets.MainText("Bank Name",
                          size: 12.sp, color: notifier.textColor),
                      boxHeight(5),
                      CustomDropdown(
                        itemList: bankNameList,
                        hintText: 'Bank Name',
                        onChanged: (String? value) {
                          print('Selected item: $value');
                        },
                      ),
                      boxHeight(200),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
