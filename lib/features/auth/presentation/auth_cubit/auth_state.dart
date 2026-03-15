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
////////////////////Login////////////////////////////

final class AuthSignInLoading extends AuthState {}

final class AuthSignInSuccess extends AuthState {
  final User? res;
  AuthSignInSuccess(this.res);
}

final class AuthSignInError extends AuthState {
  final String message;
  AuthSignInError(this.message);
}
////////////////////getusername////////////////////////////

final class AuthGetUserNameLoading extends AuthState {}

final class AuthGetUserNameSuccess extends AuthState {
  final String name;
  AuthGetUserNameSuccess(this.name);
}

final class AuthGetUserNameError extends AuthState {
  final String message;
  AuthGetUserNameError(this.message);
}

