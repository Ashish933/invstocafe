part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final SignUpRequestModel request;
  SignUpButtonPressed({required this.request});
}