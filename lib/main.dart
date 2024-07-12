import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/session/session.dart';
import 'package:responsive_deva/responsive_deva.dart';

import 'bloc/BlocProvider.dart';
import 'view/Onboarding screens/splash_screen.dart';
import 'utility/app_constant.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Session().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveDevaStart(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: MyMultiBlocProvider.providerList,
          child: MaterialApp(
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const Splash(),
          ),
        );
      },
    );
  }
}




