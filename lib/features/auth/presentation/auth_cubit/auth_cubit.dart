import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/auth/data/auth_repository_impl.dart';
import 'package:to_do_app/features/auth/domain/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepo = AuthRepositoryImpl();

  Future<void> createUser(String email,String password)async{
    emit(AuthRegisterLoading());
    try{
      var res = await authRepo.createUser(email, password);
      emit(AuthRegisterSuccess(res));
    }catch(e){
      emit(AuthRegisterError(e.toString()));
    }
  }
}
