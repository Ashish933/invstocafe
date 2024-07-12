import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility_widget/custom_button.dart';
import '../../../utility_widget/utility_widgets.dart';

class CancelModifyPage extends StatefulWidget {
  const CancelModifyPage({super.key});

  @override
  State<CancelModifyPage> createState() => _CancelModifyPageState();
}

class _CancelModifyPageState extends State<CancelModifyPage> {
  final List<String> texts = [];

  List<Map<String, dynamic>> setGoalsDataList = [
    {'name': 'Goal 1', 'dropdownValue1': 'Value 1', 'dropdownValue2': 'Value 2'},
    {'name': 'Goal 2', 'dropdownValue1': 'Value 3', 'dropdownValue2': 'Value 4'},
    // Add more data as needed
  ];

  void removeGoal(int index) {
    setState(() {
      setGoalsDataList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Equity Investment Plan",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body:  setGoalsDataList.isNotEmpty
          ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListView.builder(
              shrinkWrap: true,
              itemCount: setGoalsDataList.length,
              itemBuilder: (context, index) {
                final item = setGoalsDataList[index];
                final textIndex = texts.isEmpty
                    ? 0
                    : index %
                    texts
                        .length; // Ensure texts list is not empty
                final text =
                texts.isEmpty ? "" : texts[textIndex];
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textFieldHintText
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                            BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                UtilityWidgets.MainText(
                                    text.toString(),
                                    fontW: FontWeight.w400,
                                    color:
                                    const Color(0xFF444444),
                                    size: 18.sp),
                                SizedBox(width: 8.0),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      print("Dialogbox");
                                      _showRemoveDialog(context,index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            UtilityWidgets.MainText(
                                "Date",
                                fontW: FontWeight.w600,
                                color:
                                AppColors.textColor,
                                size: 10.sp),
                            UtilityWidgets.MainText(
                                "20/02/2024",
                                fontW: FontWeight.w600,
                                color:
                                const Color(0xFF444444),
                                size: 8.sp),
                          ],
                        ),
                        SizedBox(height: 15),
                      Horizontal.customDivider(),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            UtilityWidgets.MainText(
                                "Type",
                                fontW: FontWeight.w600,
                                color:
                                AppColors.textColor,
                                size: 10.sp),
                            UtilityWidgets.MainText(
                              "One Time",
                              fontW: FontWeight.w400,
                              color: const Color(0xFF444444),
                              size: 8.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Horizontal.customDivider(),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            UtilityWidgets.MainText(
                                "Amount",
                                fontW: FontWeight.w600,
                                color:
                                AppColors.textColor,
                                size: 10.sp),
                            UtilityWidgets.MainText(
                                "${item['dropdownValue2'] ?? "${item['email']}"}",
                                fontW: FontWeight.w400,
                                color: const Color(0xFF444444),
                                size: 8.sp),
                          ],
                        ),
                        SizedBox(height: 15),
                        Horizontal.customDivider(),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            UtilityWidgets.MainText(
                                "Status",
                                fontW: FontWeight.w600,
                                color:
                                 AppColors.textColor,
                                size: 10.sp),
                            UtilityWidgets.MainText(
                                "scheduled",
                                fontW: FontWeight.w400,
                                color: const Color(0xFF444444),
                                size: 8.sp),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            boxHeight(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: CustomButton.button("CANCEL", size: 10.sp,
                          callBack: () {
                            Navigator.pop(context);
                          })),
                  boxWidth(10),
                  Expanded(
                      child: CustomButton.button(
                          "MODIFY", size: 10.sp,
                          callBack: () {

                          })),
                ],
              ),
            ),

          ]
      ):
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: UtilityWidgets.MainText(
                "No Pending Investment !!",
                size: 14.sp,
                color: AppColors.emptyTextError,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UtilityWidgets.MainText('Privacy Policy',
                      size: 9.sp, color: AppColors.titleText),
                  boxWidth(10),
                  Container(
                    height: 30,
                    width: 3,
                    color: AppColors.titleText,
                  ),
                  boxWidth(10),
                  UtilityWidgets.MainText('Terms of Use',
                      size: 9.sp, color: AppColors.titleText),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

  void _showRemoveDialog(BuildContext context, int? index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _removeBox(context, index);
      },
    );
  }

  Widget _removeBox(BuildContext context, int? index) {
    return CupertinoAlertDialog(
      title: UtilityWidgets.MainText("Delete Goal",size: 12.sp,color: AppColors.textColor),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: UtilityWidgets.MainText("No",size: 10.sp,color: AppColors.titleText),
        ),
        CupertinoDialogAction(
            onPressed: () {
              setState(() {
                removeGoal(index!);
              });
              Navigator.pop(context); // Close the dialog
            },
            child: UtilityWidgets.MainText("Yes",size: 10.sp,color: AppColors.secondaryColor)
        ),
      ],
      content: UtilityWidgets.MainText("Are you sure you want to remove this goal?",size: 10.sp,color: AppColors.noteHintColor),
    );
  }
}
