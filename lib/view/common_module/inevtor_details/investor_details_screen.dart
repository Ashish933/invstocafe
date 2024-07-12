// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/bloc/Investor_bloc/investor_bloc.dart';
import 'package:investocafe_flutter/bloc/Investor_bloc/investor_event.dart';
import 'package:investocafe_flutter/bloc/Investor_bloc/investor_state.dart';
import 'package:investocafe_flutter/model/request/InvestorDetailUpdateRequestModel.dart';
import 'package:investocafe_flutter/model/response/InvestorDetailUpdateResponseModel.dart';
import 'package:investocafe_flutter/utility/my_dialog_box.dart';
import 'package:investocafe_flutter/view/common_module/stepper_details/details_stepper.dart';
import 'package:investocafe_flutter/view/utility_widget/UtilityDropDown.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_dropdown.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../model/response/GetInvestorDetailResponse.dart';
import '../../../session/session.dart';
import '../../../utility/app_constant.dart';
import '../../../utility/app_message.dart';
import '../../../utility/color_theems.dart';
import '../../../utility/date_formate_utility.dart';
import '../../../utility/date_picker_utils.dart';
import '../../../utility/date_time_container.dart';
import '../../../utility/utility_helper.dart';
import '../../../validation/form_validation.dart';
import '../../auth_module/terms_conditions-view.dart';
import '../../utility_widget/custom_button.dart';
import '../../utility_widget/utility_widgets.dart';
import '../Home/bottom.dart';

class InvestorDetailPage extends StatefulWidget {
  InvestorDetails? investorDetails;

  InvestorDetailPage({super.key, this.investorDetails});

  @override
  State<InvestorDetailPage> createState() => _InvestorDetailPageState();
}

class _InvestorDetailPageState extends State<InvestorDetailPage> {
  String? token;

  InvestorBloc? investorBloc;
  InvestorDetails? investorDetails;
  GetIvestorDetailResponseModel? detailResponse;
  InvestorDetailResponseModel? updateResponse;

  GlobalKey<FormState> investorDetailFormKey = GlobalKey<FormState>();



  @override
  void initState() {
    super.initState();

    // _setInItData(investorDetails);
    getProfile();
  }

  getProfile() async {
    token = Session.idToken();
    _callApiGetDetail();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocListener<InvestorBloc, InvestorState>(
      bloc: investorBloc,
      listener: (context, state) {
        if (state is InvestorDetailUpdateState) {
          UtilityHelper.toastMessage(updateResponse?.response);
          Session.idToken();
          Session.isInvestorFormCompleted();
          Navigator.pop(context, true);
        } else if (state is GetInvestorDetailState) {
          widget.investorDetails = state.response?.investorDetails;
          _setInItData(investorDetails);
        }
      },
      child: BlocBuilder<InvestorBloc, InvestorState>(
        bloc: investorBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: UtilityWidgets.MainText(
                "Investor Details",
                size: 14.sp,
                color: AppColors.backGroundColor,
              ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomBarScreen(),
                      ));
                },
                child: Image.asset(
                  "assets/images/arrow-narrow-left (1).png",
                  scale: 2.9,
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.secondaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 3.w,
                    right: 3.w,
                    top: 2.h,
                  ),
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textFieldHintText
                            .withOpacity(0.5), //color of shadow
                        spreadRadius: 2, //spread radius
                        blurRadius: 7, // blur radius
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: AnimationLimiter(
                    child: Form(
                      key: investorDetailFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              boxHeight(10),
                              UtilityWidgets.MainText("Name",
                                  size: 12.sp, color: AppColors.textColor),
                              UtilityWidgets.inputField(
                                controller: nameCtr,
                                inputType: TextInputType.text,
                                hintTxt: "Enter Full Name",
                                validator: FormValidation.validateName,
                                hrMargin: 0.0,
                                size: size,
                              ),
                              boxHeight(10),
                              UtilityWidgets.MainText("Mobile Number",
                                  size: 12.sp, color: AppColors.textColor),
                              UtilityWidgets.inputField(
                                controller: mobileCtr,
                                inputType: TextInputType.number,
                                hintTxt: "Enter Mobile Number",
                                validator: FormValidation.mobileNoValidation,
                                hrMargin: 0.0,
                                size: size,
                              ),
                              boxHeight(10),
                              UtilityWidgets.MainText("Date Of Birth",
                                  size: 12.sp, color: AppColors.textColor),
                              DateTimeContainerWidget(
                                title: dob != null
                                    ? DateTimeUtil.dealDoxDateFormat(
                                        dob.toString())
                                    : 'Enter DOB',
                                icon: Icons.calendar_month_outlined,
                                textColor: dob != null
                                    ? AppColors.titleText
                                    : AppColors.textFieldHintText,
                                iconColor: AppColors.primaryColor,
                                onPressed: () async {
                                  dob = await DatePickerUtils().showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2040, 01, 01),
                                  );
                                },
                              ),
                              boxHeight(10),
                              UtilityWidgets.MainText("Place Of Birth",
                                  size: 12.sp, color: AppColors.textColor),
                              UtilityWidgets.inputField(
                                controller: placeBirthCtr,
                                inputType: TextInputType.text,
                                hintTxt: "Select City",
                                validator: FormValidation.validateName,
                                hrMargin: 0.0,
                                size: size,
                              ),
                              boxHeight(10),
                              UtilityWidgets.MainText("Gender",
                                  size: 12.sp, color: AppColors.textColor),
                              CustomDropdown(
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectGender = value;
                                    });
                                  },
                                  selectedItem: selectGender,
                                  itemList: genderList,
                                  hintText: "Select Gender"),
                              boxHeight(10),
                              UtilityWidgets.MainText("Country",
                                  size: 12.sp, color: AppColors.textColor),
                              CustomDropdown(
                                  onChanged: (String? v) {
                                    setState(() {
                                      selectCountry = v;
                                    });
                                  },
                                  selectedItem: selectCountry,
                                  itemList: countryList,
                                  hintText: "Select Country"),

                              boxHeight(10),
                              Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(
                                        color: AppColors.checkBoxBorder),
                                    activeColor: AppColors.primaryColor,
                                    checkColor: AppColors.backGroundColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: armed == 1,
                                    onChanged: (value) {
                                      armed = value!
                                          ? 1
                                          : 0; // value ko bool se int mein convert karein
                                    },
                                  ),
                                  Flexible(
                                      child: Text(
                                    "Armed Forces",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: "Manrope-Medium",
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.contentColor),
                                  )),
                                ],
                              ),
                              boxHeight(5),
                              Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(
                                        color: AppColors.checkBoxBorder),
                                    activeColor: AppColors.primaryColor,
                                    checkColor: AppColors.backGroundColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: termCondition,
                                    onChanged: (value) {
                                      termCondition = value!;
                                    },
                                  ),
                                  Flexible(
                                    child: Text.rich(TextSpan(
                                        text: 'I agree to the',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: "Manrope-Medium",
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.contentColor),
                                        children: <InlineSpan>[
                                          const WidgetSpan(
                                            child: SizedBox(
                                                width:
                                                    3), // Adjust the width as needed
                                          ),
                                          TextSpan(
                                            text: 'Terms & Conditions',
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: AppColors
                                                    .primaryColor // Adding underline
                                                ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                goNextScreen(
                                                    to: const TermsCondition(),
                                                    side: PageTransitionType
                                                        .bottomToTop);
                                              },
                                          )
                                        ])),
                                  ),
                                ],
                              ),
                              boxHeight(100),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton.button(
                    "Update & Add Kyc And Bank Details",
                    size: 12.sp,
                    callBack: () {
                      if (investorDetailFormKey.currentState!.validate()) {
                        InvestorDetailUpdateRequestModel request = InvestorDetailUpdateRequestModel(
                            name: nameCtr.text,
                            phone: mobileCtr.text,
                            placeOfBirth: placeBirthCtr.text,
                            dob: dob,
                            country: selectCountry ?? "",
                            gender: selectGender ?? "",
                            armedForces: armed
                        );
                        BlocProvider.of<InvestorBloc>(context).add(
                            InvestorDetailUpdateEvent(
                                request: request ));
                      } else {
                        UtilityHelper.toastMessage(AppMessage.fillAllFields);
                      }

                    },
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }

  void _setInItData(InvestorDetails? investorDetails) {
    InvestorBloc().clearState();
    if (widget.investorDetails != null) {
      nameCtr.text = widget.investorDetails?.name ?? "";
      mobileCtr.text = widget.investorDetails?.phone ?? "";
      dob = widget.investorDetails!.dateOfBirth != null
          ? DateTime.parse(widget.investorDetails!.dateOfBirth!)
          : null;
      placeBirthCtr.text = widget.investorDetails?.placeOfBirth ?? "";
      selectGender = widget.investorDetails?.gender ?? "";
      selectCountry = widget.investorDetails?.countryName ?? "";
      armed = widget.investorDetails?.armedForces ?? 0;
    }
    print("Gender==${selectGender}");
    print("Country==${selectCountry}");
  }
  _callApiGetDetail() {
    BlocProvider.of<InvestorBloc>(context)
        .add(GetInvestorDetailsEvent(idToken: Session.idToken() ?? ""));
  }
}
