import 'package:flutter/material.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_dropdown.dart';

import 'package:investocafe_flutter/view/common_module/more/statements/cust_contaner.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';

class AccountStatements extends StatefulWidget {
  const AccountStatements({Key? key});

  @override
  State<AccountStatements> createState() => _AccountStatementsState();
}

class _AccountStatementsState extends State<AccountStatements> {
  TextEditingController startCtr = TextEditingController();
  TextEditingController endCtr = TextEditingController();

  final List<String> texts = [
    "Investment History",
    "Funds Invested",
    "Capital Gains",
    "Tax Saving Statements"
  ];

  final List<String> imagePath = [
    "assets/icons/history.png",
    "assets/icons/investment.png",
    "assets/images/gain.jpg",
    "assets/icons/tax.png",

  ];

  final List<Widget> pages = [

    // const TaxSavingGoal(),
    // const CarGoal(),
    // const MySIPGoal(),
    // const MonthlyInvestmentGoal(),

  ];

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
        startCtr.text = formattedDate;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Account Statements",
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
      body: ListView.builder(
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // goNextScreen(to: pages[index],side: PageTransitionType.topToBottom);
              _showDialog(context,index);
            },
            child: RectangleContainer(
              text: texts[index],
              imagePath:
              imagePath[index], // Replace this with your image path
            ),
          );
        },
      ),
    );
  }
  void _showDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: UtilityWidgets.MainText(texts[index],
                size: 14.sp, color: notifier.textColor),
          ),
          content: _buildDialogContent(index),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomButton.button("Go",callBack: (){

              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogContent(int index) {
    switch (index) {
      case 0:
        return historyInvest();
      case 1:
        return fundsInvested();
      case 2:
        return Text('Capital Gains Dialog Content');
      case 3:
        return taxSavingInvest();
      default:
        return Text('Default Dialog Content');
    }
  }

  Widget historyInvest(){
    var size = MediaQuery.of(context).size;
    List<String> allStatement = [
      'all',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: UtilityWidgets.inputField(
                  controller: startCtr,
                  hintTxt: "From Date",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,

                ),
              ),
              boxWidth(10),
              Expanded(
                child: UtilityWidgets.inputField(
                  controller: endCtr,
                  hintTxt: "To Date",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),
          boxHeight(10),
          CustomDropdown(
            itemList: allStatement,
            hintText: 'all',
            onChanged: (String? value) {
              print('Selected item: $value');
            },
          ),
        ],
      ),
    );
  }
  Widget taxSavingInvest(){
    var size = MediaQuery.of(context).size;
    List<String> allStatement = [
      'all',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: UtilityWidgets.inputField(
                  controller: startCtr,
                  hintTxt: "From Date",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,

                ),
              ),
              boxWidth(10),
              Expanded(
                child: UtilityWidgets.inputField(
                  controller: endCtr,
                  hintTxt: "To Date",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),
          boxHeight(10),
          CustomDropdown(
            itemList: allStatement,
            hintText: 'all',
            onChanged: (String? value) {
              print('Selected item: $value');
            },
          ),
        ],
      ),
    );
  }

  Widget fundsInvested(){
    return Expanded(

      child: UtilityWidgets.MainText("This is a statement of your investments by mutual fund Scheme."
          "You can verify this against the statement you receive directly from the mutual fund company."
          "Please call us in case of any discrepancy.",size: 10.sp,color: AppColors.noteHintColor),
    );
  }


}

