import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/core/colors_manager.dart';
import 'package:noteappflutteronline73/logic/get_note/state.dart';
import 'package:noteappflutteronline73/presentation/screens/create_note_screen.dart';
import 'package:noteappflutteronline73/presentation/screens/login_screen.dart';

import '../../logic/get_note/cubit.dart';
import '../widgets/note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _toggleLanguage(BuildContext context) {
    final currentLocale = context.locale;
    if (currentLocale.languageCode == 'en') {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetNoteDataCubit()
        ..getNotesData(),
      child: Scaffold(
        backgroundColor: ColorsManagers.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.language, color: Colors.white),
                      onPressed: () => _toggleLanguage(context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => CreateNoteScreen()));
                    },
                    child: Container(
                      height: 48,
                      width: 164,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: Center(
                        child: Text(
                          "Add Note".tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorsManagers.primaryColor,
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: 48,
                      width: 164,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: Center(
                        child: Text(
                          "Log Out".tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorsManagers.primaryColor,
                          ),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 32,),
              BlocBuilder<GetNoteDataCubit, GetNoteDataStates>(
                builder: (context, state) {
                  if (state is GetNoteLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }else if (state is GetNoteSuccessState){
                    final x = state.notes;
                    return SizedBox(
                      height: 700,
                      child: ListView.builder(
                        itemCount: x.length,
                        itemBuilder: (context, index) {
                          final y = x[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: NoteWidget(
                              data: y,
                            ),
                          );
                        },
                      ),
                    );
                  }else if (state is GetNoteErrorState){
                    return Center(child: Text(state.em));
                  }else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
