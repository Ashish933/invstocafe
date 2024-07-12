

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/colors_widget.dart';
import '../../utility_widget/utility_widgets.dart';
import 'bottom.dart';
import 'package:intl/intl.dart'; // Importing intl package for date formatting


class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {

  ColorNotifire notifier = ColorNotifire();

  String _currentDateTime = '';



  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('dd-MMMM-yyyy hh:mm a').format(DateTime.now());
    });
    // Update every second
    Future.delayed(Duration(seconds: 1), _updateDateTime);
  }


  @override
  void initState() {
    super.initState();
    _updateDateTime();

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: const Color(0xffFFFFFF),
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Trans_chart(),));
            },
            child: Image.asset(
              "assets/images/Portfolio.png",
              color: AppColors.backGroundColor,
              scale: 3,
            ),
          ),
          boxWidth(15),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Transaction(),));
            },
            child: Image.asset(
              "assets/images/receipt.png",
              scale: 3,
              color: AppColors.backGroundColor,
            ),
          ),
        ],
       backgroundColor:AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: UtilityWidgets.MainText(
                    "Portfolio",
                    size: 14.sp,
                    color: AppColors.backGroundColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                   padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2,color: AppColors.backGroundColor),
                    color: AppColors.backGroundColor,
                    image: DecorationImage(
                      image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'), //image url

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                boxHeight(10),
                UtilityWidgets.MainText(
                  "Welcome!",
                  size: 12.sp,
                  color: AppColors.titleText,
                ),
                UtilityWidgets.MainText(
                  "Sachin Rathore",
                  size: 14.sp,
                  color: AppColors.textColor,
                ),
                boxHeight(20),
                portfolioContainer(),
                boxHeight(20),
                portfolioDetails(),

                boxHeight(200),

              ],
            ),
          ],
        ),
      ),

    );
  }
  Widget portfolioContainer(){
    return Container(
        margin: EdgeInsets.only(
          left: 3.w,
          right: 3.w,
          top: 1.h,
        ),
        padding: EdgeInsets.only(left: 3.w, right: 3.w,top: 3.w,bottom: 3.w),
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.textFieldHintText
                  .withOpacity(0.5), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 5, // blur radius
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(6,)),
        ),
        child: Column(
          children: [
          Card(
            color: AppColors.backGroundColor,
            elevation: 3,
            child: Container(

              decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                border: Border.all(color: AppColors.secondaryColor,width: 0.2),borderRadius: BorderRadius.circular(10)
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
                  children: [
                    UtilityWidgets.MainText(
                      "Last NAV Updated on:",
                      size: 10.sp,
                      color: AppColors.titleText,
                    ),
                    UtilityWidgets.MainText(
                      _currentDateTime,
                      size: 8.sp,
                      color: AppColors.textColor,
                    ),

                  ],
                ),
              ),
            ),
          ),
          boxHeight(3),


          Card(
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.backGroundColor,

                  border: Border.all(color: AppColors.secondaryColor,width: 0.2),borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    UtilityWidgets.MainText(
                      "AMOUNT INVESTED",
                      size: 11.sp,
                      color: AppColors.titleText,
                    ),
                    UtilityWidgets.MainText(
                      "PRESENT VALUE",
                      size: 11.sp,
                      color: AppColors.titleText,
                    ),

                  ],
                ),
              ),
            ),
          ),

          IntrinsicHeight(
              child:Row(
                children: [
                  Expanded(
                    child:Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.backGroundColor,

                            border: Border.all(color: AppColors.secondaryColor,width: 0.2),borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 2.w, right: 2.w,top: 2.w,bottom: 2.w),

                        child: Center(
                          child: UtilityWidgets.MainText(
                            "₹"+"0.00",
                            size: 11.sp,
                            color: AppColors.textColor,
                          ),
                        ),


                      ),
                    ),
                  ),


                  VerticalDivider(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    thickness: 2, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10, //Spacing at the bottom of divider.
                  ),


                  Expanded(
                    child:Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w,top: 2.w,bottom: 2.w),
                        decoration: BoxDecoration(
                            color: AppColors.backGroundColor,

                            border: Border.all(color: AppColors.secondaryColor,width: 0.2),borderRadius: BorderRadius.circular(10)
                        ),
                          child: Center(
                          child: UtilityWidgets.MainText(
                             "₹" "0.00",
                            size: 11.sp,
                            color: AppColors.textColor,
                          ),
                        ),


                      ),
                    ),
                  )
                ],
              )
          )


        ],)
    );

  }

  Widget portfolioDetails() {
    // Define your dynamic data here
    List<Map<String, dynamic>> rowData = [
      {"fundName": "Nippon India Retirement Fund-Wealth Creation Scheme", "investedAmount": 1000.0, "currentValue": 1200.0,"xirr":12.09,},
      {"fundName": "Nippon India Retirement Fund-Wealth Creation Scheme", "investedAmount": 2000.0, "currentValue": 1800.0,"xirr":12.09,},
      {"fundName": "Nippon India Retirement Fund-Wealth Creation Scheme", "investedAmount": 1500.0, "currentValue": 1300.0,"xirr":12.09,},
      {"fundName": "Nippon India Retirement Fund-Wealth Creation Scheme", "investedAmount": 2500.0, "currentValue": 2200.0,"xirr":12.09,},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Static heading row
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(width: 0.6,color: AppColors.titleText),

              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UtilityWidgets.MainText(
                      "Fund Name",
                      textAlign: TextAlign.center,
                      size: 11.sp,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
                Container(
                  height: getHeight(90),
                  width: getWidth(1),
                  color: AppColors.backGroundColor,),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UtilityWidgets.MainText(
                      "Invested Amt(Rs.)",
                      textAlign: TextAlign.center,
                      size: 11.sp,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
                Container(
                  height: getHeight(90),
                  width: getWidth(1),
                  color: AppColors.backGroundColor,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UtilityWidgets.MainText(
                      "Current Value\n(Rs.)",
                      textAlign: TextAlign.center,
                      size: 11.sp,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
                Container(
                  height: getHeight(90),
                  width: getWidth(1),
                  color: AppColors.backGroundColor,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UtilityWidgets.MainText(
                      "Xirr(%)",
                      textAlign: TextAlign.center,
                      size: 11.sp,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Dynamic rows
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rowData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  border: Border.all(width: 1,color: AppColors.secondaryColor.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textFieldHintText
                          .withOpacity(0.5), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 5, // blur radius
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child:
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UtilityWidgets.MainText(
                          rowData[index]["fundName"],
                           textAlign: TextAlign.center,
                          size: 9.sp,
                          color: AppColors.textColor,
                        ),

                      ),
                    ),

                    Container(
                       height: getHeight(160),
                      width: getWidth(1),
                      color: AppColors.primaryColor.withOpacity(0.2),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UtilityWidgets.MainText(
                          "${rowData[index]["investedAmount"]}",
                          textAlign: TextAlign.center,
                          size: 9.sp,
                          color: AppColors.primaryColor,
                        ),

                      ),
                    ),
                    Container(
                      height: getHeight(160),
                      width: getWidth(1),
                      color: AppColors.primaryColor.withOpacity(0.2),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UtilityWidgets.MainText(
                          "${rowData[index]["currentValue"]}",
                          textAlign: TextAlign.center,
                          size: 9.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(160),
                      width: getWidth(1),
                      color: AppColors.primaryColor.withOpacity(0.2),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UtilityWidgets.MainText(
                          "${rowData[index]["xirr"]}",
                          textAlign: TextAlign.center,
                          size: 9.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.secondaryColor;
    Path path = Path()
      ..relativeLineTo(0, 120)
      ..quadraticBezierTo(size.width / 2, 220.0, size.width, 120)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


