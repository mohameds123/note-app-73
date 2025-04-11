import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/logic/sign_up_cubit/state.dart';

class SignUpCubit extends Cubit <SignUpStates>{
  SignUpCubit () : super(SignUpInitialState());


  Future signUp (String userEmail, String pass)async {
    emit(SignUpLoadingState());
    try{

      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: pass);
      emit(SignUpSuccessState());

    }catch (e){
      emit(SignUpErrorState());
    }

  }

}