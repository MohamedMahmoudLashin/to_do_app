part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  final String res;
  AuthRegisterSuccess(this.res);
}

final class AuthRegisterError extends AuthState {
  final String message;
  AuthRegisterError(this.message);
}
