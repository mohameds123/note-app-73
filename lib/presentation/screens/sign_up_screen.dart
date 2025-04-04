import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/core/colors_manager.dart';
import 'package:noteappflutteronline73/logic/sign_up_cubit/cubit.dart';
import 'package:noteappflutteronline73/logic/sign_up_cubit/state.dart';
import 'package:noteappflutteronline73/presentation/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if(state is SignUpSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsManagers.primaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Text(
                      "Create New Account ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        fillColor: ColorsManagers.lightPurple,
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "password ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Enter Your password",
                        fillColor: ColorsManagers.lightPurple,
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                  ),
                  Spacer(),
                  Center(
                    child: InkWell(
                      onTap: () {
                        context.read<SignUpCubit>().signUp(
                            emailController.text, passController.text);
                      },
                      child: Container(
                        width: 312,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsManagers.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
