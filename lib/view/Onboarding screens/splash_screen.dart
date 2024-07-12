import 'package:flutter/material.dart';
import 'package:investocafe_flutter/session/session.dart';
import 'package:investocafe_flutter/view/common_module/Home/bottom.dart';


import '../../utility/app_constant.dart';
import '../../utility/colors_widget.dart';
import 'onboarding_1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Session.isLogin() ? BottomBarScreen():
              Onboard1(),
            ));
      },
    );
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(
                  "assets/logo/splash.png",
                ),
                color: notifier.isDark ? Colors.white : null,
                 height: height / 8,
              ),

            ],
          )
        ],
          ),
      bottomNavigationBar: BottomAppBar(
         color: notifier.background,
        elevation: 0,
        height: 80,
        child:  Center(
          child: Column(
            children: [
              Text("Welcome...",
                style: TextStyle(fontSize: 15,fontFamily: "Manrope-Bold",
                    color: notifier.textColor,wordSpacing: 5),),
              AppConstants.Height(5),
              const Text(
                "Version 0.0.1",
                style: TextStyle(
                    color: Color(0xffD1D1D1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Manrope_semibold",
                    letterSpacing: 0.3),
              ),
            ],
          )
        ),
      ),
    );
  }
}
