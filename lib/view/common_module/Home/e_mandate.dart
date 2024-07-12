import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/color_theems.dart';
import '../../utility_widget/utility_widgets.dart';
import 'bottom.dart';

class MutualFund extends StatefulWidget {
  const MutualFund({super.key});

  @override
  State<MutualFund> createState() => _MutualFundState();
}

class _MutualFundState extends State<MutualFund> {
  List<String> dropdownItems1 = [
    '5,00,000', '6,00,000', '7,00,000', '8,00,000'
  ];
  String dropdownValue1 = '5,00,000';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Mutual Fund",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 700),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    boxHeight(20),
                    UtilityWidgets.MainText("Emandate Registration",size: 14.sp,color: AppColors.titleText),
                    boxHeight(20),
                    UtilityWidgets.MainText("Total Amount",size: 12.sp,color: AppColors.textColor),
                    boxHeight(10),

                    // CustomDropdown(
                    //   itemList: dropdownItems1,
                    //   hintText: '1',
                    //   onChanged: (String? value) {
                    //     setState(() {
                    //       dropdownValue1 = value!;
                    //     });
                    //     print('Selected item: $value');
                    //   },
                    // ),

                    boxHeight(50),
                    CustomButton.button("EMANDATE PROCEED",size: 12.sp,callBack: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Emandate process is closed for some time'),
                          ),
                        );
                      },
                    ),













                  ],
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }
}
