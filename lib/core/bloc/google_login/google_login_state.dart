part of 'google_login_cubit.dart';

sealed class GoogleLoginState {}

final class GoogleLoginInitial extends GoogleLoginState {}

final class GoogleLoginLoading extends GoogleLoginState {}

final class GoogleLoginSuccess extends GoogleLoginState {}

final class GoogleLoginFailure extends GoogleLoginState {
  final String message;
  GoogleLoginFailure({required this.message});
}
