import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/auth_module/login_screen.dart';
import 'package:investocafe_flutter/view/common_module/stp/stp_first_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/color_theems.dart';
import '../../utility_widget/utility_widgets.dart';
import '../category_pages/debt/debt_page.dart';
import '../category_pages/liquid/liquid_page.dart';
import '../category_pages/mip/mip_page.dart';
import '../category_pages/other_funds/other_funds_page.dart';
import '../category_pages/sip_insure/sip_insure_page.dart';
import '../category_pages/tax_saving/tax_saving_page.dart';
import '../goals/goals_all_pages/my_sip.dart';
import '../models/my_data.dart';
import '../more/about_us/know_risk_profile.dart';


class STPAutoTransferPage extends StatefulWidget {
  const STPAutoTransferPage({Key? key}) : super(key: key);

  @override
  State<STPAutoTransferPage> createState() => _STPAutoTransferPageState();
}

class _STPAutoTransferPageState extends State<STPAutoTransferPage> {
  final List<MyData> myDataList = [
    MyData(imageUrl: 'assets/icons/equity.png', text: 'Nippon India Low Duration Fund-Growth Plan-Growth Option'),
    MyData(imageUrl: 'assets/icons/tax.png', text: 'UTI Ultra Short Duration Fund - Regular Plan - Growth Option'),
    MyData(imageUrl: 'assets/icons/mip.png', text: 'Kotak Low Duration Fund-Regular Plan-Growth Option'),
    MyData(imageUrl: 'assets/icons/liquid.png', text: 'SBi Magnum Low Duration Fund'),
    MyData(imageUrl: 'assets/icons/debt.png', text: 'Aditya Birla Sun Life Low Duration Fund-Growth-Regular Plan'),
    MyData(imageUrl: 'assets/icons/sip_insurance.png', text: 'LIC MF Low Duration Fund-Regular Plan-Growth'),
    MyData(imageUrl: 'assets/icons/risk_profile.png', text: 'Axis Ultra Short Term Fund Growth'),
    MyData(imageUrl: 'assets/icons/sip.png', text: 'Parag Parikh Liquid Fund Regular Plan Growth'),
  ];
  final List<Widget> pages = [
    const STPFirstPlanPage(),
    const TaxSavingPage(),
    const MIPPage(),
    const LiquidPage(),
    const DebtPage(),
    const SIPInsurePage(),
    const KnowRiskPagePage(),
    const MySIPGoal(),
    const OtherFundsPage(),




  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "STP",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: myDataList.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 900),
                child: SlideAnimation(
                  verticalOffset: 60.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 2, left: 10, right: 10,bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: 1.w,
                                right: 1.w,
                                top: 1.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: InkWell(
                                      onTap: () {
                                        goNextScreen(to: const STPFirstPlanPage(),side: PageTransitionType.topToBottom);
                                      },
                                      child: ListTile(
                                        contentPadding:
                                        const EdgeInsets.all(10.0),
                                        title: UtilityWidgets.MainText(
                                            myDataList[index].text,
                                            size: 12.sp,
                                            color: AppColors.primaryColor),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 20,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        goNextScreen(to: SignIn(), side: PageTransitionType.rightToLeft);
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      default:
      // Handle the case when the index is out of bounds
        break;
    }
  }
}
