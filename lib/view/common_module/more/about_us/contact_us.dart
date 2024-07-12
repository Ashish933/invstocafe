import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utility/app_constant.dart';
import '../../../utility_widget/utility_widgets.dart';
import 'ask_query.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  void openGoogleMaps() async {
    // Specify the latitude and longitude of the location
    const latitude = 37.7749;
    const longitude = -122.4194;

    // Construct the Google Maps URL with the specified location
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    // Check if the URL can be launched
    if (await canLaunch(url)) {
      // Launch the URL
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("Contact Us",
            size: 14.sp, color: AppColors.backGroundColor),
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
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              // height: double.infinity,
              margin: EdgeInsets.only(
                left: 1.w,
                right: 1.w,
                top: 2.h,
              ),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    AppConstants.Height(10),
                    Image.asset("assets/logo/splash.png", height: height / 6),
                    AppConstants.Height(10),
                    InkWell(
                      onTap: () {
                        print("object");
                        openGoogleMaps();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          boxWidth(10),
                          Text(
                            "B-302,Cross Roads,IDA MAll,Behind G.\nSachanand, Vijay Nagar,\nIndore-452010,MP",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: "Manrope-Bold",
                                color: AppColors.titleText),
                          ),
                        ],
                      ),
                    ),
                    boxHeight(15),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_outlined,
                          size: 30,
                        ),
                        boxWidth(10),
                        Text(
                          "0731-4043703",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Manrope-Bold",
                              color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    boxHeight(15),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 30,
                        ),
                        boxWidth(10),
                        Text(
                          "info@investocafe.com",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Manrope-Bold",
                              color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    boxHeight(15),
                    Row(
                      children: [
                        Text(
                          "Monday to Saturday:-",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Manrope-Bold",
                              color: AppColors.titleText),
                        ),
                        boxWidth(10),
                        Text(
                          "10:00 AM to 07:00 PM",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Manrope-Bold",
                              color: AppColors.noteHintColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton.button("ASK A QUERY", callBack: () {
              goNextScreen(
                  to: const AskQuery(), side: PageTransitionType.rightToLeft);
            }),
            // boxHeight(10),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
