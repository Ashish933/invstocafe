
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/bloc/Investor_bloc/investor_bloc.dart';
import 'package:investocafe_flutter/bloc/dashboard_bloc/dash_board_bloc.dart';

import 'auth_bloc/OtpBloc/otp_bloc.dart';
import 'auth_bloc/SignInBloc/sign_in_bloc.dart';
import 'auth_bloc/SignUpBloc/sign_up_bloc.dart';

class MyMultiBlocProvider {
  static List<BlocProvider> providerList = [
    // Add this bloc for SignUp
    BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
    ),
    // Add this bloc for SignIn
    BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(),
    ),

    BlocProvider<OtpBloc>(
      create: (context) => OtpBloc(),
    ),

    BlocProvider<DashBoardBloc>(
      create: (context) => DashBoardBloc(),
    ),

    BlocProvider<InvestorBloc>(
      create: (context) => InvestorBloc(),
    ),


  ];
}
