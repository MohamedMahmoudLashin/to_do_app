import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/auth/domain/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  AuthRepository authRepo;

  Future<void> createUser(String email, String password, String name) async {
    emit(AuthRegisterLoading());
    try {
      var res = await authRepo.createUser(email, password, name);
      emit(AuthRegisterSuccess(res));
    } catch (e) {
      emit(AuthRegisterError(e.toString()));
    }
  }

  Future<void> login(String email, String password, String name) async {
    emit(AuthSignInLoading());

    try {
      var res = await authRepo.login(email, password, name);

      res.fold(
        ifLeft: (e) {
          print("Login Error: $e"); // <--- اطبع الخطأ
          emit(AuthSignInError(e.toString()));
        },
        ifRight: (user) {
          emit(AuthSignInSuccess(user));
        },
      );
    } catch (e) {
      print("Unexpected Error: $e"); // <--- لو فيه خطأ غير متوقع
      emit(AuthSignInError(e.toString()));
    }
  }
}
