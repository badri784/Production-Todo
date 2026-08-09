part of 'login_cubit_cubit.dart';

sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitLoaded extends LoginCubitState {}

final class LoginCubitError extends LoginCubitState {
  final String error;
  LoginCubitError({required this.error});
}
