import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/logic/login_in/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit <LoginStates> {
  LoginCubit () : super (LoginInitialState());



  ///
   Future loginEmailAndPass (String userEmail, String pass)async{
     emit(LoginLoadingState());
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: userEmail, password: pass);
       final SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setBool("logged", true);


       emit(LoginSuccessState());

     }catch (e){
       emit(LoginErrorState(e.toString()));
     }
   }

   ///
   Future continueWithGoogle ()async{
     emit(LoginLoadingState());

     try {
       await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
       emit(LoginSuccessState());

     }catch (e){
       emit(LoginErrorState(e.toString()));
     }

   }
}