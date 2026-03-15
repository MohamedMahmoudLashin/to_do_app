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

final class AuthGetUserDataLoading extends AuthState {}

final class AuthGetUserDataSuccess extends AuthState {
  final String? name;
  final String? email;
  final String? password; // لو موجود
  AuthGetUserDataSuccess({this.name, this.email, this.password});
}

final class AuthGetUserDataError extends AuthState {
  final String message;
  AuthGetUserDataError(this.message);
}

