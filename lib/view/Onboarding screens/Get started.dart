import 'package:flutter/material.dart';

import '../../utility/app_constant.dart';
import '../../utility/colors_widget.dart';
import '../auth_module/login_screen.dart';



class Get1 extends StatefulWidget {
  const Get1({super.key});

  @override
  State<Get1> createState() => _Get1State();
}

class _Get1State extends State<Get1> {
  ColorNotifire notifier = ColorNotifire();
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/Get1.png'),
                )),
              ),
            ),
            // Switch(
            //   value: notifier.isDark,
            //   onChanged: (bool value) {
            //     notifier.isavalable(value);
            //   },
            // ),

             Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Manrope-SemiBold",
                  color: notifier.textColor),
            ),
            const Text(
              "All in One Investment Platform",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff64748B),
                  fontFamily: "Manrope-SemiBold"),
            ),
            AppConstants.Height(15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ));
              },
              child: Container(
                height: height/12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff0a85cb)),
                // width: 327,
                child: const Center(
                    child: Text(
                  "Continue with Email",
                  style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold", color: Colors.white),
                )),
              ),
            ),
            AppConstants.Height(10),
            GestureDetector(
              onTap: (){
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: Container(
                height: height/12,
                // width: 327,
                decoration: BoxDecoration(
                  color: isPressed?const Color(0xff0a85cb): Colors.transparent,
                    border: Border.all(
                        color: isPressed?const Color(0xff0a85cb): notifier.getContainerBorder),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage("assets/images/apple-logo.png"),
                      height: 25,
                      width: 25,
                        color: isPressed ? Colors.white : Colors.black

                    ),
                    Text(
                      " Continue With Apple",
                      style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",
                          color: isPressed? Colors.white:notifier.textColor),
                    )
                  ],
                ),
              ),
            ),
            AppConstants.Height(10),
            Container(
              height: height/12,
              // width: 327,
              decoration: BoxDecoration(
                  border: Border.all(color: notifier.getContainerBorder),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/google.png"),
                    height: 25,
                    width: 25,
                  ),
                  Text(
                    " Continue With Google",
                    style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",
                        color: notifier.textColor),
                  )
                ],
              ),
            ),
            AppConstants.Height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontFamily: "Manrope-Medium", color: Color(0xff64748B)),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn(),));
                  },
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 14,
                      color:notifier.outlinedButtonColor,

                      fontFamily: "Manrope-Bold"),
                ))
              ],
            ),
            AppConstants.Height(20),
          ],
        ),
      ),
    );
  }
}
