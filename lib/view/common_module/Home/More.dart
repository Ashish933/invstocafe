import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:investocafe_flutter/view/common_module/Home/bottom.dart';
import 'package:investocafe_flutter/view/common_module/category_pages/risk_profile/risk_profile_piechart_page.dart';
import 'package:investocafe_flutter/view/common_module/more/about_us/about_us.dart';
import 'package:investocafe_flutter/view/common_module/more/about_us/collaborators.dart';
import 'package:investocafe_flutter/view/common_module/more/about_us/contact_us.dart';
import 'package:investocafe_flutter/view/common_module/more/other_section/web_view.dart';
import 'package:investocafe_flutter/view/common_module/more/statements/Account_statements.dart';
import 'package:investocafe_flutter/view/common_module/more/upload_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/color_theems.dart';
import 'package:share_plus/share_plus.dart';

import '../more/about_us/how_it_work.dart';
import '../more/about_us/know_risk_profile.dart';
import '../more/investo_blog.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  String text = '';
  String link = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("More Details",
            size: 14.sp, color: AppColors.backGroundColor),
        leading: GestureDetector(
          onTap: () {
            goNextScreen(
                to: const BottomBarScreen(),
                side: PageTransitionType.leftToRight);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              statement(),
              boxHeight(10),
              download(),
              boxHeight(10),
              upload(),
              boxHeight(10),
              aboutUs(),
              boxHeight(10),
              investoBlog(),
              boxHeight(10),
              share(),
              boxHeight(10),
              eMandat(),
              boxHeight(10),
              otherSection(),
              boxHeight(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget statement() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/statement.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('Statements',
                    size: 12.sp, color: AppColors.titleText),
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const AccountStatements(),side: PageTransitionType.topToBottom);
                      },
                      child: UtilityWidgets.MainText('Account statements',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const RiskProfilePieChart(),side: PageTransitionType.rightToLeft);
                      },
                      child: UtilityWidgets.MainText('My Risk Profile',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget download() {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/download.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('Download',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget upload() {
    return GestureDetector(
      onTap: () {
        goNextScreen(
            to:  const UpLoadPage(), side: PageTransitionType.topToBottom);
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/upload.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('Upload',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutUs() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded2 = !_isExpanded2;
        });
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/about-us.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('About Us',
                    size: 12.sp, color: AppColors.titleText),
                trailing: Icon(
                  _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                ),
              ),
            ),
            if (_isExpanded2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        goNextScreen(
                            to: const KnowRiskPagePage(),
                            side: PageTransitionType.topToBottom);
                      },
                      child: UtilityWidgets.MainText('Know Your Risk Profile',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const HowItWork(),side: PageTransitionType.topToBottom);
                      },
                      child: UtilityWidgets.MainText('How it works',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const Collaborators(),side: PageTransitionType.topToBottom);

                      },
                      child: UtilityWidgets.MainText('Collaborators',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        // goNextScreen(to: const AboutUsWebview(),side: PageTransitionType.topToBottom);

                      },
                      child: UtilityWidgets.MainText('Testimonials',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const AboutUsWebview(),side: PageTransitionType.topToBottom);

                      },
                      child: UtilityWidgets.MainText('About Us',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    InkWell(
                      onTap: () {
                        goNextScreen(to: const ContactUs(),side: PageTransitionType.topToBottom);

                      },
                      child: UtilityWidgets.MainText('Contact Us',
                          size: 10.sp, color: AppColors.noteHintColor),
                    ),
                    boxHeight(10),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget investoBlog() {
    return GestureDetector(
      onTap: () {
        goNextScreen(
            to: const InvestoBlog(), side: PageTransitionType.rightToLeft);
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/blog.gif",
                  scale: 1.2,
                ),
                title: UtilityWidgets.MainText('Investo-Blog',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget share() {
    return GestureDetector(
      onTap: () {
        _onShare();
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/share.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('Share',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onShare() async {
    await Share.share(
      'Your sharing text',
    );
  }

  Widget eMandat() {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/help.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('E-mandate',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otherSection() {
    return GestureDetector(
      onTap: () {
        goNextScreen(
            to: const WebViewApp(), side: PageTransitionType.rightToLeft);
      },
      child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(6.0),
                leading: Image.asset(
                  "assets/icons/section.gif",
                  scale: 1.7,
                ),
                title: UtilityWidgets.MainText('Other Section',
                    size: 12.sp, color: AppColors.titleText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
