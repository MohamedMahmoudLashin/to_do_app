import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/data/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<String> createUser(String email, String password,String name) async{
   try{
     final credential = await FirebaseAuth.instance.
     createUserWithEmailAndPassword(email: email, password: password).
     then((value) {
       FirebaseFirestore.instance.collection('Users').doc(value.user!.uid).set(
         {
           "email":email,
           "password":password,
           "name":name,
           "id":value.user!.uid
         }
       );
     },);
     credential.User?.sendEmailVerification();
     return "200";
   }on FirebaseException catch(e){
     if(e.code=='weak-password'){
       print('The password Provided is too weak');
     }else if(e.code=='email-already exists'){
       print('The account already exists for that email');
     }
     return e.message??"Firebase";
   }catch(e){
     return e.toString();
   }
  }

  @override
  Future<Either<String, User?>> login(String email, String password,String name) async {
    try{
      final credential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);

      if (credential.user ==null){
        return Left("User not Found");
      }
      return Right(credential.user);
    }catch(e){
      return Left(e.toString());
    }

  }

}