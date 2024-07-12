
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/common_module/stepper_details/kyc_details_screen.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/custom_button.dart';
import '../../utility_widget/utility_widgets.dart';
import '../Home/bottom.dart';
import 'address_page.dart';
import 'bank_details_screen.dart';
import 'nominee_details_screen.dart';


const double borderRadius = 25.0;

class DetailsStepper extends StatefulWidget {
  const DetailsStepper({Key? key}) : super(key: key);

  @override
  _DetailsStepperState createState() => _DetailsStepperState();
}

class _DetailsStepperState extends State<DetailsStepper>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
              },
              child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 2,color: notifier.earn,)),
          title: Text("Investor Details",style: TextStyle(fontSize: 14.sp,fontFamily: "Manrope-Bold", color: notifier.earn)),
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: notifier.background,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                boxHeight(16),
                _menuBar(context),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        activePageIndex = i;
                      });
                    },
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const KycDetails(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const BankDetails(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const NomineeDetails(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton.button(
                activePageIndex == 2 ? 'Finish' : 'Next',
                callBack: () {
              if (activePageIndex < 2) { // Assuming you have 3 pages
                setState(() {
                  activePageIndex++;
                });
                _pageController.animateToPage(activePageIndex,
                    duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
              } else {
                // Navigate to the next step automatically
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddressPage()),
                );
              }
            }),
            // boxHeight(10),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _menuBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        width: getWidth(390),
        decoration:  BoxDecoration(
          color: notifier.textFieldHintText,
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onPlaceBidButtonPress,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: (activePageIndex == 0)
                        ? const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius)),
                    )
                        : null,
                    child: Text(
                      "KYC Details",
                      style: (activePageIndex == 0)
                          ? TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Manrope-Bold",

                          fontSize: 9.sp)
                          : TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Manrope-Bold",

                          fontSize: 9.sp),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onBuyNowButtonPress,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 1)
                      ? const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius)),
                  )
                      : null,
                  child: Text(
                    "Bank Details",
                    style: (activePageIndex == 1)
                        ? TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Manrope-Bold",

                        fontSize: 9.sp)
                        : TextStyle(
                        color: Colors.black,
                        fontFamily: "Manrope-Bold",

                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onBuyButtonPress,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: (activePageIndex == 2)
                        ? const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                         AppColors.primaryColor,
                          AppColors.secondaryColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius)),
                    )
                        : null,
                    child: Text(
                      "Nominee Details",
                      style: (activePageIndex == 2)
                          ? TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: "Manrope-Bold",

                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp)
                          : TextStyle(
                          color: Colors.black,
                          fontFamily: "Manrope-Bold",
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    setState(() {
      activePageIndex = 0;
    });
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    setState(() {
      activePageIndex = 1;
    });
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyButtonPress() {
    setState(() {
      activePageIndex = 2;
    });
    _pageController.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
