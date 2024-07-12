import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/custom_button.dart';
import '../../../../utility/date_formate_utility.dart';
import '../../../../utility/date_picker_utils.dart';
import '../../../../utility/date_time_container.dart';
import '../../../utility_widget/utility_widgets.dart';

class InvestMentTypeForm extends StatefulWidget {
  const InvestMentTypeForm({super.key});

  @override
  State<InvestMentTypeForm> createState() => _InvestMentTypeFormState();
}

class _InvestMentTypeFormState extends State<InvestMentTypeForm> {
  TextEditingController investCtr = TextEditingController();
  List<TextEditingController> amountControllers = [];
  List<String Function(String?)> validators = [];
  int _selectedOption = 1;
  TimeOfDay? startTime;
  DateTime? startDate;

  late BuildContext _context; // Store the context


  @override
  void initState() {
    super.initState();
    // Schedule a callback to access BuildContext after initState is completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Now you can safely use _context
      _showAlertDialog();
    });
  }

  void _showAlertDialog() {
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: UtilityWidgets.MainText("Alert", size: 16.sp,
                color: AppColors.titleText),
          ),
          content: Text('Your investment amount will be 00.00'),
          actions: <Widget>[
            CustomButton.button("Ok", callBack: () {
              Navigator.of(context).pop(); // Close the alert dialog

            }),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    _context = context; // Assign the context when build is called

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Investment Type",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 700),
                    childAnimationBuilder: (widget) =>
                        SlideAnimation(
                          horizontalOffset: 60.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: [
                      boxHeight(10),
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: 1,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          UtilityWidgets.MainText("Invest In One Click",
                              size: 10.sp, color: AppColors.titleText),
                          SizedBox(width: 20),
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: 2,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          UtilityWidgets.MainText("Do It yourself",
                              size: 10.sp, color: AppColors.titleText),
                        ],
                      ),
                      if (_selectedOption == 1) ...[
                        boxHeight(10),
                        _investInOneClick(),
                      ],
                      if (_selectedOption == 2) ...[
                        boxHeight(10),
                        _doItYourself(),
                      ]
                    ]),
              ),
            ),
          ),
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

  Widget _investInOneClick({Size? size,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("Invest Rs.",
                    size: 10.sp, color: AppColors.titleText),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("On",
                    size: 10.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
        boxHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: UtilityWidgets.inputField(
                hintTxt: "Amt(Rs.)",
                controller: investCtr,
                inputType: TextInputType.number,
                hrMargin: 0.0,
                size: size,
              ),
            ),
            boxWidth(10),
            Expanded(
              child:
              DateTimeContainerWidget(
                title: startDate != null
                    ? DateTimeUtil.dealDoxDateFormat(startDate.toString())
                    : 'Start date',
                icon: Icons.calendar_month_outlined,
                textColor: startDate != null
                    ? AppColors.titleText
                    : AppColors.textFieldHintText,
                iconColor: AppColors.primaryColor,
                onPressed: () async {
                  DateTime? selectedDate = await DatePickerUtils()
                      .showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2040, 01, 01),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      startDate = selectedDate;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        boxHeight(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("MutualFund Scheme",
                    size: 10.sp,
                    fontW: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ),
            boxWidth(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("Min. Amount",
                    size: 10.sp, color: AppColors.primaryColor),
              ),
            ),
            boxWidth(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("Amount",
                    size: 10.sp, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        boxHeight(10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            if (amountControllers.length <= index) {
              amountControllers.add(TextEditingController());
            }

            // Define validator for each field
            if (validators.length <= index) {
              validators.add((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                int amount = int.tryParse(value) ?? 0;
                if (amount < 5000) {
                  return 'Minimum amount is 5000 Rs';
                }
                return "null";
              });
            }
            return Column(
              children: [
                buildRow(index),
                boxHeight(10),
                Horizontal.customDivider(),
              ],
            );
          },
        ),
        boxHeight(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UtilityWidgets.MainText("Total Amount", size: 12.sp),
            UtilityWidgets.MainText("100000",
                size: 12.sp, color: AppColors.primaryColor),
          ],
        ),
        boxHeight(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CustomButton.button("CANCEL", size: 10.sp, callBack: () {
                  Navigator.pop(context);
                })),
            boxWidth(10),
            Expanded(
              child: CustomButton.button(
                  "SUBMIT", size: 10.sp, callBack: _submitForm),
            ),
          ],
        ),
        boxHeight(100),
      ],
    );
  }

  Widget buildRow(int index) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: UtilityWidgets.MainText(
                "ICICI Prudential Exports and Services Fund-Growth",
                size: 9.sp,
                color: AppColors.textColor),
          ),
        ),
        boxWidth(10),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: UtilityWidgets.MainText("5000",
                size: 9.sp, color: AppColors.titleText),
          ),
        ),
        boxWidth(10),
        Expanded(
            child: Align(
              alignment: Alignment.center,
              child: UtilityWidgets.inputField(
                controller: amountControllers[index], // Connect controller

                hintTxt: "Amt",
                inputType: TextInputType.number,
                validator: (
                    _) => null, // Always return null to remove built-in error message display
              ),
            )),
      ],
    );
  }


  Widget _doItYourself({Size? size}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UtilityWidgets.MainText("On", size: 10.sp, color: AppColors.titleText),
        boxWidth(10),
        DateTimeContainerWidget(
          title: startDate != null
              ? DateTimeUtil.dealDoxDateFormat(startDate.toString())
              : 'Start date',
          icon: Icons.calendar_month_outlined,
          textColor: startDate != null
              ? AppColors.titleText
              : AppColors.textFieldHintText,
          iconColor: AppColors.primaryColor,
          onPressed: () async {
            DateTime? selectedDate = await DatePickerUtils()
                .showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2040, 01, 01),
            );
            if (selectedDate != null) {
              setState(() {
                startDate = selectedDate;
              });
            }
          },
        ),
        boxHeight(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("MutualFund Scheme",
                    size: 10.sp,
                    fontW: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ),
            boxWidth(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("Min. Amount",
                    size: 10.sp, color: AppColors.primaryColor),
              ),
            ),
            boxWidth(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: UtilityWidgets.MainText("Amount",
                    size: 10.sp, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        boxHeight(10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            if (amountControllers.length <= index) {
              amountControllers.add(TextEditingController());
            }

            if (validators.length <= index) {
              validators.add((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                int amount = int.tryParse(value) ?? 0;
                if (amount < 5000) {
                  return 'Minimum amount is 5000 Rs';
                }
                return "null";
              });
            }

            return Column(
              children: [
                buildRow(index),
                boxHeight(10),
                Horizontal.customDivider(),
              ],
            );
          },
        ),
        boxHeight(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UtilityWidgets.MainText("Total Amount", size: 12.sp),
            UtilityWidgets.MainText("0.00",
                size: 12.sp, color: AppColors.primaryColor),
          ],
        ),
        boxHeight(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CustomButton.button("CANCEL", size: 10.sp, callBack: () {
                  Navigator.pop(context);
                })),
            boxWidth(10),
            Expanded(
              child: CustomButton.button(
                  "SUBMIT", size: 10.sp, callBack: _submitForm),
            ),
          ],
        ),
        boxHeight(100),
      ],
    );
  }


  Widget yourSelfRow(int index) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: UtilityWidgets.MainText(
                "ICICI Prudential Exports and Services Fund-Growth",
                size: 9.sp,
                color: AppColors.textColor),
          ),
        ),
        boxWidth(10),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: UtilityWidgets.MainText("5000",
                size: 9.sp, color: AppColors.titleText),
          ),
        ),
        boxWidth(10),
        Expanded(
            child: Align(
              alignment: Alignment.center,
              child: UtilityWidgets.inputField(
                  validator: (_) => null,
                  controller: amountControllers[index],
                  // Always return null to remove built-in error message display
                  hintTxt: "Amt",
                  inputType: TextInputType.number),
            )),
      ],
    );
  }

  void _submitForm() {
    if (_selectedOption == 1) {
      // Validate "Invest Rs." field and date picker for "Invest In One Click"
      if (investCtr.text.isEmpty || startDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill Investment Amount and Date.'),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
       _showDeclarDialog(context);
      }
    } else if (_selectedOption == 2) {
      // Validate date picker for "Do It Yourself"
      if (startDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a Start Date.'),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        // Open dialog box for "Do It Yourself" if validation passes
        _showDeclarDialog(context);

      }
    }
  }

  void _showDeclarDialog(
      BuildContext context,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _removeBox(
          context,
        );
      },
    );
  }

  Widget _removeBox(
      BuildContext context,
      ) {
    return CupertinoAlertDialog(
      title: UtilityWidgets.MainText("Declaration",
          size: 12.sp, color: AppColors.textColor),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: UtilityWidgets.MainText("No",
              size: 10.sp, color: AppColors.titleText),
        ),
        CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context); // Close the dialog

            },
            child: UtilityWidgets.MainText("Yes",
                size: 10.sp, color: AppColors.secondaryColor)),
      ],
      content: UtilityWidgets.MainText("On Confirm,your bank account(Bank- xxxxxxxxxxxxx) will be debited.",
          size: 10.sp, color: AppColors.noteHintColor),
    );
  }
}

