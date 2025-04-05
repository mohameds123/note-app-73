import 'package:flutter/material.dart';
import 'package:noteappflutteronline73/presentation/screens/create_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateNoteScreen()));
        },
          child: Text("Home Screen"))),
    );
  }
}
