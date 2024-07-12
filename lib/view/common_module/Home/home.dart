// ignore_for_file: camel_case_types


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/bloc/dashboard_bloc/dash_board_state.dart';
import 'package:investocafe_flutter/model/response/GetDashboardLoadViewResponseModel.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/utility/my_dialog_box.dart';
import 'package:investocafe_flutter/view/common_module/funds/debt/debt_page.dart';
import 'package:investocafe_flutter/view/common_module/funds/liquid/liquid_page.dart';
import 'package:investocafe_flutter/view/common_module/funds/other_funds/other_funds_page.dart';
import 'package:investocafe_flutter/view/common_module/funds/sip_insure/sip_insure_page.dart';
import 'package:investocafe_flutter/view/common_module/funds/tax_saving/tax_saving_page.dart';
import 'package:investocafe_flutter/view/common_module/goals/goals_all_pages/my_sip.dart';
import 'package:investocafe_flutter/view/common_module/inevtor_details/investor_details_screen.dart';
import 'package:investocafe_flutter/view/common_module/more/statements/Account_statements.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../bloc/dashboard_bloc/dash_board_bloc.dart';
import '../../../bloc/dashboard_bloc/dash_board_event.dart';
import '../../../session/session.dart';
import '../../../utility/app_constant.dart';
import '../../../utility/colors_widget.dart';
import '../../utility_widget/ratings.dart';
import '../category_pages/risk_profile/risk_profile_piechart_page.dart';
import '../funds/equity/equity_page.dart';
import '../funds/funds_page.dart';
import '../funds/mip/mip_page.dart';
import '../goals/my_goals.dart';
import '../models/my_data.dart';
import '../stp/stp_page.dart';
import 'Search.dart';

class home extends StatefulWidget {

   const home({super.key,});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  int currentindex = 0;
  int selectIndex = 0;
  bool _password = true;
  String? token;

  final List<Widget> pages = [
    const EquityPage(),
    const TaxSavingPage(),
    const MIPPage(),
    const LiquidPage(),
    const DebtPage(),
    const SIPInsurePage(),
    const RiskProfilePieChart(),
    const MySIPGoal(),
    const OtherFundsPage(),
    const MyGoalSetPage(),
    const AccountStatements(),
    const STPPage()
  ];

  List text = [
    "Crypto Assets",
    "US Stock",
    "Gold",
    "NFTs",
  ];

  late final TabController _tabController;

  final List<MyData> myDataList = [
    MyData(imageUrl: 'assets/icons/equity.png', text: 'Equity'),
    MyData(imageUrl: 'assets/icons/tax.png', text: 'Tax Saving'),
    MyData(imageUrl: 'assets/icons/mip.png', text: 'MIP'),
    MyData(imageUrl: 'assets/icons/liquid.png', text: 'Liquid'),
    MyData(imageUrl: 'assets/icons/debt.png', text: 'Debt Fund'),
    MyData(imageUrl: 'assets/icons/sip_insurance.png', text: 'SIP Insure'),
    MyData(imageUrl: 'assets/icons/risk_profile.png', text: 'Risk Profile'),
    MyData(imageUrl: 'assets/icons/sip.png', text: 'My SIP'),
    MyData(imageUrl: 'assets/icons/other_funds.png', text: 'Other Funds'),
    MyData(imageUrl: 'assets/logo/goal.png', text: 'My Goal'),
    MyData(imageUrl: 'assets/icons/statement.png', text: 'Statements'),
    MyData(imageUrl: 'assets/logo/stp.png', text: 'STP'),
  ];

  GetDashboardLoadViewResponseModel? dashboardLoadViewResponseModel;

  DashBoardBloc dashBoardBloc = DashBoardBloc();

  @override
  void initState() {
    print("token===${Session.idToken()}");
    _callInitialApis();
    _myDashBordLoadViewState();
    token = Session.idToken();

    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }


  Future<void> _callInitialApis() async {
    await Session.saveIsInvestorFormCompleted(true);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Image.asset(
                  "assets/logo/splash.png",
                  scale: 1.7,
                  color: AppColors.backGroundColor,
                ),
                SizedBox(width: width / 45),
                // Text('Crowwn',
                //     style: TextStyle(fontSize: 18, color: notifier.textColor)),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const search(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.asset("assets/images/Search.png",
                      color: AppColors.backGroundColor,
                      height: 20,
                      width: 19),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const Message(),
                  //     ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    "assets/images/message.png",
                    color: AppColors.backGroundColor,
                    height: 23,
                    width: 26,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/notification.png",
                      color: AppColors.backGroundColor,
                      height: 23,
                      width: 23),
                ),
              ),
            ],
            backgroundColor: AppColors.secondaryColor,
          ),
          body: BlocBuilder<DashBoardBloc, DashBoardState>(
            builder: ( context,  state) {
              if (state is DashBoardLoadViewGetState) {
                dashboardLoadViewResponseModel = state.response;
                return SingleChildScrollView(
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                height: 190,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                      AssetImage(
                                          "assets/images/Background (1).png"),
                                      fit: BoxFit.cover,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20,
                                      left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        convertNA(dashboardLoadViewResponseModel
                                            ?.username?.toUpperCase() ?? ""),
                                        style: TextStyle(
                                            color: AppColors.backGroundColor,
                                            fontSize: 14.sp,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Text(
                                        "Total asset value",
                                        style: TextStyle(
                                            color: Color(0xff94A3B8),
                                            fontSize: 15,
                                            fontFamily: "Manrope-Regular"),
                                      ),
                                      AppConstants.Height(10),
                                      Row(
                                        children: [
                                          _password
                                              ? const Text(
                                            "\$56,890.00",
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Color(0xffFFFFFF)),
                                          )
                                              : const Text(
                                            ' **********',
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          AppConstants.Width(10),
                                          GestureDetector(
                                              onTap: () {
                                                setState(
                                                      () {
                                                    _password = !_password;
                                                  },
                                                );
                                              },
                                              child: _password
                                                  ? const Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 24,
                                                  color: Color(0xff94A3B8))
                                                  : const Icon(
                                                  Icons.visibility_off_outlined,
                                                  size: 24,
                                                  color: Color(0xff94A3B8))),
                                          // Expand
                                          const Spacer(),
                                          // Expanded(child: AppConstants.Width(90)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: Container(
                                              height: 33,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                                color: const Color(0xff1DCE5C),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/up-arrow.png",
                                                    height: 15,
                                                    width: 15,
                                                    color: Colors.white,
                                                  ),
                                                  AppConstants.Width(5),
                                                  const Text(
                                                    "23.00%",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontFamily: "Manrope-Medium"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.backGroundColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (Session.isInvestorFormCompleted()) {
                                              showAlertForProfile(
                                                  dashboardLoadViewResponseModel);
                                            } else {
                                              goNextScreen(
                                                  to: const FundsPage(),
                                                  side: PageTransitionType
                                                      .bottomToTop);
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: height / 12,
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: const Offset(
                                                          0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  notifier.isDark
                                                      ? "assets/logo/funds1.png"
                                                      : "assets/logo/funds1.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Funds",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff64748B),
                                                  fontFamily: "Manrope-Bold",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (Session.isInvestorFormCompleted()) {
                                              showAlertForProfile(
                                                  dashboardLoadViewResponseModel);
                                            } else {
                                              goNextScreen(
                                                  to: const MyGoalSetPage(),
                                                  side: PageTransitionType
                                                      .bottomToTop);
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: height / 12,
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: const Offset(
                                                          0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  notifier.isDark
                                                      ? "assets/logo/goal.png"
                                                      : "assets/logo/goal.png",
                                                  scale: 1.5,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Goals",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff64748B),
                                                  fontFamily: "Manrope-Bold",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (Session.isInvestorFormCompleted()) {
                                              showAlertForProfile(
                                                  dashboardLoadViewResponseModel);
                                            } else {
                                              goNextScreen(
                                                  to: const STPPage(),
                                                  side: PageTransitionType
                                                      .bottomToTop);
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: height / 12,
                                                width: width / 7,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: const Offset(
                                                          0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    notifier.isDark
                                                        ? "assets/logo/stp.png"
                                                        : "assets/logo/stp.png",
                                                    scale: 1.5,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "STP",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff64748B),
                                                  fontFamily: "Manrope-Bold",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        AppConstants.Height(80),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor),
                          ),
                        ),
                        AppConstants.Height(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: myDataList.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (Session.isInvestorFormCompleted()) {
                                    showAlertForProfile(
                                        dashboardLoadViewResponseModel);
                                  } else {
                                    // Navigate to desired screen
                                    goNextScreen(
                                        to: pages[index],
                                        side: PageTransitionType.topToBottom);
                                  }
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
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        myDataList[index].imageUrl,
                                        scale: 1.2,
                                      ),
                                      Divider(
                                        color: Colors.cyan.withOpacity(0.1),
                                        thickness: 2,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Text(
                                        myDataList[index].text,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.subTitleColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        AppConstants.Height(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Funds With Best Returns",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor),
                          ),
                        ),
                        AppConstants.Height(8),
                        // Widgetpastekarna hai
                        fundsWithBestreturn(),

                        SizedBox(height: 20,)
                      ],
                    ),
                  );
              } else {
                return bodyHeader();
              }
            }

          ),
        );



  }
  Widget fundsWithBestreturn(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
              elevation: 3,
              margin: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      15), // Adjust the value as needed
                  color: Colors
                      .white, // Add a background color if desired
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                              BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child: Text("A",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 20)))),
                        boxWidth(10),
                        Text(
                          "Axis Top Securities",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor),
                        ),
                        boxWidth(30),
                        RatingWidget()
                      ],
                    ),
                    boxHeight(10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Min Investment",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Normal",
                              color: notifier.textColor),
                        ),
                        Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Normal",
                              color: notifier.textColor),
                        ),
                        Text(
                          "Returns",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Normal",
                              color: notifier.textColor),
                        ),
                      ],
                    ),
                    boxHeight(10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Rs.1000",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: Colors.blueAccent),
                        ),
                        boxWidth(20),
                        const Text(
                          "Equity",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: Colors.cyan),
                        ),
                        const Text(
                          "+20.13%",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
Widget bodyHeader(){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  height: 190,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                        AssetImage(
                            "assets/images/Background (1).png"),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,
                        left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                        const Text(
                          "Total asset value",
                          style: TextStyle(
                              color: Color(0xff94A3B8),
                              fontSize: 15,
                              fontFamily: "Manrope-Regular"),
                        ),
                        AppConstants.Height(10),
                        Row(
                          children: [
                            _password
                                ? const Text(
                              "\$56,890.00",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xffFFFFFF)),
                            )
                                : const Text(
                              ' **********',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xffFFFFFF)),
                            ),
                            AppConstants.Width(10),
                            GestureDetector(
                                onTap: () {
                                  setState(
                                        () {
                                      _password = !_password;
                                    },
                                  );
                                },
                                child: _password
                                    ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 24,
                                    color: Color(0xff94A3B8))
                                    : const Icon(
                                    Icons.visibility_off_outlined,
                                    size: 24,
                                    color: Color(0xff94A3B8))),
                            // Expand
                            const Spacer(),
                            // Expanded(child: AppConstants.Width(90)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15),
                              child: Container(
                                height: 33,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  color: const Color(0xff1DCE5C),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/up-arrow.png",
                                      height: 15,
                                      width: 15,
                                      color: Colors.white,
                                    ),
                                    AppConstants.Width(5),
                                    const Text(
                                      "23.00%",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontFamily: "Manrope-Medium"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.backGroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {

                      if (Session.isInvestorFormCompleted()) {
                      showAlertForProfile(
                      dashboardLoadViewResponseModel);
                      } else {
                      // Navigate to desired screen
                      goNextScreen(
                      to: const FundsPage(),
                      side: PageTransitionType.topToBottom);

                      }
                      },
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: height / 12,
                                  width: width / 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    notifier.isDark
                                        ? "assets/logo/funds1.png"
                                        : "assets/logo/funds1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Funds",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (Session.isInvestorFormCompleted()) {
                                showAlertForProfile(
                                    dashboardLoadViewResponseModel);
                              } else {
                                // Navigate to desired screen
                                goNextScreen(
                                    to: const MyGoalSetPage(),
                                    side: PageTransitionType.topToBottom);

                              }
                            },
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: height / 12,
                                  width: width / 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    notifier.isDark
                                        ? "assets/logo/goal.png"
                                        : "assets/logo/goal.png",
                                    scale: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Goals",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (Session.isInvestorFormCompleted()) {
                                showAlertForProfile(
                                    dashboardLoadViewResponseModel);
                              } else {
                                // Navigate to desired screen
                                goNextScreen(
                                    to: const STPPage(),
                                    side: PageTransitionType.topToBottom);

                              }
                            },
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: height / 12,
                                  width: width / 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      notifier.isDark
                                          ? "assets/logo/stp.png"
                                          : "assets/logo/stp.png",
                                      scale: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "STP",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
          AppConstants.Height(80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Category",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Manrope-Bold",
                  color: notifier.textColor),
            ),
          ),
          AppConstants.Height(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myDataList.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (Session.isInvestorFormCompleted()) {
                      showAlertForProfile(
                          dashboardLoadViewResponseModel);
                    } else {
                      // Navigate to desired screen
                      goNextScreen(
                          to: pages[index],
                          side: PageTransitionType.topToBottom);
                    }
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
                      borderRadius:
                      const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          myDataList[index].imageUrl,
                          scale: 1.2,
                        ),
                        Divider(
                          color: Colors.cyan.withOpacity(0.1),
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Text(
                          myDataList[index].text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.subTitleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          AppConstants.Height(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Funds With Best Returns",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Manrope-Bold",
                  color: notifier.textColor),
            ),
          ),
          AppConstants.Height(8),
          // Widgetpastekarna hai
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            15), // Adjust the value as needed
                        color: Colors
                            .white, // Add a background color if desired
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius:
                                    BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                      child: Text("A",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 20)))),
                              boxWidth(10),
                              Text(
                                "Axis Top Securities",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Bold",
                                    color: notifier.textColor),
                              ),
                              boxWidth(30),
                              RatingWidget()
                            ],
                          ),
                          boxHeight(10),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Min Investment",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Normal",
                                    color: notifier.textColor),
                              ),
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Normal",
                                    color: notifier.textColor),
                              ),
                              Text(
                                "Returns",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Normal",
                                    color: notifier.textColor),
                              ),
                            ],
                          ),
                          boxHeight(10),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Rs.1000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Bold",
                                    color: Colors.blueAccent),
                              ),
                              boxWidth(20),
                              const Text(
                                "Equity",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Bold",
                                    color: Colors.cyan),
                              ),
                              const Text(
                                "+20.13%",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Bold",
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),


          SizedBox(height: 20,)
        ],
      ),
    );

}

  _myDashBordLoadViewState() {
    print("Agaya token${Session.idToken()}");
    BlocProvider.of<DashBoardBloc>(context)
        .add(DashBoardLoadViewGetEvent(
         idToken: Session.idToken() ?? ""
    ));
  }



  showAlertForProfile(GetDashboardLoadViewResponseModel? dashboardLoadViewResponseModel) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return  MyDialogBox.customAlertDialog(
          userName: ("Dear," +" ${dashboardLoadViewResponseModel?.username?.toUpperCase()??""}") ,
          title: ' Please provide information to start your lumpsum/monthly investment in Mutual Funds',
          onSuccess: () {
            Navigator.pop(context);
            Navigator.pushReplacement( // Use pushReplacement instead of push
                context,
                PageTransition(
                type: PageTransitionType.rightToLeft,
                child: InvestorDetailPage(), // Navigate to the Profile screen
            ));
          },
        );
      },
    );
  }
}
