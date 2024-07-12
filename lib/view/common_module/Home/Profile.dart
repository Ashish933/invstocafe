import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:investocafe_flutter/view/auth_module/login_screen.dart';
import 'package:investocafe_flutter/view/common_module/Home/bottom.dart';
import 'package:investocafe_flutter/view/common_module/edit_profile/Bank_detail_edit_page.dart';
import 'package:investocafe_flutter/view/common_module/edit_profile/address_edit-page.dart';
import 'package:investocafe_flutter/view/common_module/edit_profile/password_edit_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/color_theems.dart';
import '../../../utility/colors_widget.dart';
import '../../utility_widget/utility_widgets.dart';
import '../edit_profile/contact_edit_page.dart';
import '../edit_profile/name_email_edit_page.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  ValueNotifier<bool> isDialOpen =
      ValueNotifier<bool>(false); // Use ValueNotifier

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: getHeight(400),
                  width: getWidth(450),
                  color: AppColors.secondaryColor,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomBarScreen(),
                                      ));
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  // color:notifier.textColor,
                                  size: 25,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 20),
                            child: InkWell(
                              onTap: () {
                                goNextScreen(to: EditProfileClass());
                              },
                              child: Image.asset(
                                "assets/images/edit.png",
                                scale: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment
                            .center, //aligns CircleAvatar to Top Center.
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.width / 3.5,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2, color: AppColors.backGroundColor),
                            color: AppColors.backGroundColor,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'), //image url

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      boxHeight(10),
                      UtilityWidgets.MainText(
                        "Welcome",
                        size: 12.sp,
                        color: AppColors.titleText,
                      ),
                      Text('Sachin Rathore',
                          style: TextStyle(
                              color: AppColors.backGroundColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Manrope-Medium")),
                      boxHeight(10),
                      InkWell(
                          onTap: () {
                            _showRemoveDialog(context);
                          },
                          child: Image.asset(
                            "assets/icons/logout.gif",
                            scale: 1.2,
                          )),
                      Text("LogOut",
                          style: TextStyle(
                              color: AppColors.backGroundColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Manrope-Medium")),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )),
              Container(
                color: AppColors.buttonColor,
                alignment: Alignment.centerLeft,
                child: TabBar(
                  unselectedLabelColor:
                      Colors.redAccent, // Unselected tab color
                  labelColor: Colors.white, // Selected tab color
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        "INVESTOR DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "KYC DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "BANK DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "NOMINEE DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "ADDRESS OF CORRESPONDENCE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              boxHeight(10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    investorDetails(),
                    kycDetails(),
                    bankDetails(),
                    nomineeDetails(),
                    addressDetails(),
                  ],
                ),
              ),
              boxHeight(10),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: editSection(),
          )
        ],
      ),
    );
  }

  Widget editSection() {
    return SpeedDial(
      direction: SpeedDialDirection.down, // Yeh vertically arrange karega
      icon: Icons.edit_outlined,
      activeIcon: Icons.close,
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.backGroundColor,
      overlayColor: AppColors.secondaryColor,
      activeBackgroundColor: AppColors.secondaryColor,
      activeForegroundColor: AppColors.backGroundColor,
      overlayOpacity: 0.2,
      elevation: 0.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.email_outlined,
            color: AppColors.secondaryColor,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: "Name & Email",
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            goNextScreen(
                to: const NameEmailEditPage(),
                side: PageTransitionType.bottomToTop);
            // Add your save logic here
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.password,
            color: Colors.redAccent,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: 'Password',
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            goNextScreen(
                to: const PasswordEditPage(),
                side: PageTransitionType.bottomToTop);
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.mobile_friendly_outlined,
            color: Colors.deepPurple,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: 'Contact No',
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            goNextScreen(
                to: const ContactEditPage(),
                side: PageTransitionType.bottomToTop);
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.home,
            color: Colors.green,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: 'Change Address',
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            goNextScreen(
                to: const AddressEditPage(),
                side: PageTransitionType.bottomToTop);
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.account_balance,
            color: Colors.indigo,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: 'Change Bank',
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            goNextScreen(
                to: const BankDetailEditPage(),
                side: PageTransitionType.bottomToTop);

            // Add your add logic here
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.person,
            color: Colors.cyan,
          ),
          backgroundColor: AppColors.backGroundColor,
          label: 'Change Nominee',
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.titleText,
              fontFamily: "Manrope-Bold",
              fontWeight: FontWeight.w400),
          onTap: () {
            // Add your add logic here
          },
        ),
        // Add more SpeedDialChild widgets for additional options
      ],
      openCloseDial: isDialOpen,
      onPress: () {
        setState(() {
          isDialOpen.value = !isDialOpen.value;
        });
      },
    );
  }

  Widget investorDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Card(
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Adjust the value as needed
                color: Colors.white, // Add a background color if desired
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RowWithText("Name", "Sachin Rathore"),
                      boxHeight(10),
                      Horizontal.customDivider(),
                      boxHeight(10),
                      RowWithText("Date of Birth", "11 Feb 1994"),
                      boxHeight(10),
                      Horizontal.customDivider(),
                      boxHeight(10),
                      RowWithText(
                          "Investor Type", "Resident Indian\n(Individual)"),
                      boxHeight(10),
                      Horizontal.customDivider(),
                      boxHeight(10),
                      RowWithText("Nationality", "Indian"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget kycDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15), // Adjust the value as needed
              color: Colors.white, // Add a background color if desired
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowWithText("Investor PAN", "ABED1234E"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Father/Spouse Name", "Sachin"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Occupation", "Agriculturist"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Gender", "Male"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Marital Status", "Single"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText(
                        "Related to Politically\nExposed Person", "Yes"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Politically Exposed\nPerson", "Yes"),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget bankDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15), // Adjust the value as needed
              color: Colors.white, // Add a background color if desired
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowWithText("Account Holder\nName", "Sachin"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("IFSC", "SBIN00012129"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Account Type", "Saving Bank"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Account No", "76764365566"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Bank & Branch", "Indore"),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget nomineeDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15), // Adjust the value as needed
              color: Colors.white, // Add a background color if desired
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowWithText("Nominee Name", "Suraj"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Relationship", "Friend"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Nominee's DOB", "1996-02-01"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Nominee Address",
                        "adarsh nagar,indore\nMadhya Pradesh"),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget addressDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15), // Adjust the value as needed
              color: Colors.white, // Add a background color if desired
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowWithText(
                        "Address", "adarsh nagar,indore\nMadhya Pradesh"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Mobile No", "1234567890"),
                    boxHeight(10),
                    Horizontal.customDivider(),
                    boxHeight(10),
                    RowWithText("Pin Code", "481234"),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _showRemoveDialog(
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
    return
      CupertinoAlertDialog(
      title: UtilityWidgets.MainText("Log Out",
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
              setState(() {
                // removeGoal(index!);
              });
              goNextScreen(to: SignIn(), side: PageTransitionType.bottomToTop);
            },
            child: UtilityWidgets.MainText("Yes",
                size: 10.sp, color: AppColors.secondaryColor)),
      ],
      content: UtilityWidgets.MainText("Are you sure you want to Log Out?",
          size: 10.sp, color: AppColors.noteHintColor),
    );
  }
}

class RowWithText extends StatelessWidget {
  final String leftText;
  final String rightText;

  RowWithText(this.leftText, this.rightText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              leftText,
              style: TextStyle(
                color: AppColors.titleText,
                fontSize: 11.sp,
                fontFamily: "Manrope-Bold",
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              rightText,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: "Manrope-Bold",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
