
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/bloc/dashboard_bloc/dash_board_bloc.dart';
import 'package:investocafe_flutter/bloc/dashboard_bloc/dash_board_event.dart';
import 'package:investocafe_flutter/model/response/GetDashboardLoadViewResponseModel.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../session/session.dart';
import '../../../utility/colors_widget.dart';
import '../../../utility/my_dialog_box.dart';
import '../inevtor_details/investor_details_screen.dart';
import '../stepper_details/details_stepper.dart';
import 'More.dart';
import 'Portfolio.dart';
import 'Profile.dart';
import 'e_mandate.dart';
import 'home.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> myChildren = [
    const home(),
    const MutualFund(),
     const Portfolio(),
    const Profile(),
    const MorePage(),

  ];
  ColorNotifire notifier = ColorNotifire();
  late String? selectedDocument;
  bool isDocumentSelected = false;
  bool showDocumentDialog = true;
  String? token;
  GetDashboardLoadViewResponseModel? dashboardLoadViewResponseModel;

  DashBoardBloc dashBoardBloc = DashBoardBloc();

  @override
  void initState() {
    _callInitialApis();
    _myDashBordLoadViewState();
    token = Session.idToken();
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (showDocumentDialog) {
    //     showDocumentSelectionPopup(context);
    //   }
    // });
  }
  Future<void> _callInitialApis() async {
    await Session.saveIsInvestorFormCompleted(true);
  }



  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return  MyDialogBox.customAlertDialog(
                userName: "Alert",
                title:  'Do you want to exit the application?',
                onSuccess: () {
                  Navigator.pop(context, true);

                },
              );
            },
          );
          return shouldPop!;
        },
        child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Align(
          alignment: const Alignment(0, 0.99),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (Session.isInvestorFormCompleted()) {
                  showAlertForProfile(
                      dashboardLoadViewResponseModel);
                } else {
                  // Navigate to desired screen
                  currentIndex = 2;

                }
              });
            },
            backgroundColor: AppColors.secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Portfolio.png",scale: 3,color: AppColors.backGroundColor,),
                boxHeight(5),
                Text("Portfolio",style: TextStyle(fontFamily: "Manrope-Bold",fontSize: 6.sp,
                    color: AppColors.backGroundColor,fontWeight: FontWeight.w400),)
              ],
            )
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: notifier.background,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          elevation: 0,
          onTap: (int index) {
            setState(() {
              if (Session.isInvestorFormCompleted()) {
                showAlertForProfile(
                    dashboardLoadViewResponseModel);
              } else {
                // Navigate to desired screen
                currentIndex = index;

              }
            });
          },
          unselectedItemColor: notifier.textColor,
          selectedItemColor: notifier.textColor,
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Manrope_bold",
            fontSize: 10,
            letterSpacing: 0.2,
          ),
          selectedLabelStyle: TextStyle(
            fontFamily: "Manrope_bold",
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: notifier.textColor,
            letterSpacing: 0.2,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  "assets/images/home.png",
                  scale: 3.5,
                  color: AppColors.titleText,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/home_fill.png",
                  scale: 3.5,
                  color: AppColors.primaryColor,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  "assets/images/e-mandate.png",
                   scale: 2,
                  color: AppColors.titleText,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/e-mandate.png",
                   scale: 2,
                  color: AppColors.primaryColor,
                ),
              ),
              label: "E-mandate",
            ),
            const BottomNavigationBarItem(
              label: "",
              icon: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/Person.png",
                  scale: 3.5,
                  color: AppColors.titleText,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/Person_fill.png",
                  // color: Colors.black,
                  scale: 3.5,
                  color: AppColors.primaryColor,
                ),
              ),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 5),
                child: Image.asset(
                  "assets/icons/more.png",
                  scale: 3.4,
                  color: AppColors.titleText,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/icons/more.png",
                  scale: 3,
                  color: AppColors.secondaryColor,
                ),
              ),
              label: "More",
            ),
          ],
        ),
        body:
        myChildren.elementAt(currentIndex),
            ),
      );
  }




  void showDocumentSelectionPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Disables dismissing dialog on outside tap
      builder: (BuildContext context) {
        return DocumentSelectionDialog(
          onChanged: (value) {
            setState(() {
              selectedDocument = value;
              isDocumentSelected = true;

            });
          },
          onContinue: () {
            setState(() {
              showDocumentDialog = false; // Update the flag
            });
            Navigator.pop(context); // Close the dialog
            Navigator.pushReplacement( // Use pushReplacement instead of push
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const DetailsStepper(), // Navigate to the Profile screen
              ),
            );
          },
          documentList: [],
        );
      },
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

class DocumentSelectionDialog extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  final VoidCallback onContinue;
  final List<String> documentList;

  const DocumentSelectionDialog({Key? key, required this.onChanged,
    required this.onContinue, required this.documentList}) : super(key: key);

  @override
  _DocumentSelectionDialogState createState() => _DocumentSelectionDialogState();
}

class _DocumentSelectionDialogState extends State<DocumentSelectionDialog> {
  String? selectedDocument;
  List<String> documentsList = [
    'Passport',
    'Driving License',
    'Aadhaar Card',
    'Voter Id Card',
    'Ration Card',
    'Electricity Bill',
    'Pan Card',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Your Document"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<String>(
            onChanged: (String? value) {
              setState(() {
                selectedDocument = value;
              });
              widget.onChanged(value);
            },
            items: documentsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                          color: const Color(0xFF7C7C7C),
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp),
                    ), //name of the item
                  ],
                ),
              );
            }).toList(),

            hint: const Text("Select Document"),
            isExpanded: true,
            value: selectedDocument,
          ),
          const SizedBox(height: 16),
          if (selectedDocument != null)
            ElevatedButton(
              onPressed: widget.onContinue,
              child: const Text('Continue to Bank Details and KYC'),
            ),
        ],
      ),
    );
  }


}
