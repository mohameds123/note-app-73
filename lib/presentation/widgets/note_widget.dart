import 'package:flutter/material.dart';
import 'package:noteappflutteronline73/core/colors_manager.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 80,
          decoration: BoxDecoration(
            color: ColorsManagers.lightPurple,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Meeting",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Apple,Orange,Banana,Guava.",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    Spacer(),
                    Text(
                      "9:00 pm",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
