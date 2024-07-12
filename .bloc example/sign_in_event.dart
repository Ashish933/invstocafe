part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  late SignInRequest request;
  SignInButtonPressed({required this.request});
}
