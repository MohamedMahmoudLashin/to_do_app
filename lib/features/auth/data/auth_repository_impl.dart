import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<String> createUser(String email, String password) async {
    try{
      final credential  = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: email, password: password);
      credential.user?.sendEmailVerification();
      print(credential.user);

      return "200";
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak password'){
        print('The Password Provided is too weak');
      }else if (e.code == 'email already in use'){
        print('the account already exists  for that email');
      }
      return e.message ?? "FireError";
    }catch(e){
      print(e);
      return e.toString();
    }
  }
}