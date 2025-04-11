import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteappflutteronline73/core/colors_manager.dart';
import 'package:noteappflutteronline73/presentation/screens/create_note_screen.dart';
import 'package:noteappflutteronline73/presentation/screens/login_screen.dart';

import '../widgets/note_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.primaryColor,
      body : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 42,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNoteScreen()));
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
                        "Add Note",
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
                  onTap: ()async{
                   await FirebaseAuth.instance.signOut();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                        "Log Out",
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
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                    child: NoteWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
