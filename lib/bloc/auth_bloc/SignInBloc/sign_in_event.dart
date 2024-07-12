part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  late SignInRequestModel request;
  SignInButtonPressed({required this.request});
}
