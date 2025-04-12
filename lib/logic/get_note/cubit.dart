import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/logic/get_note/state.dart';

import '../../data/note_model.dart';

class GetNoteDataCubit extends Cubit<GetNoteDataStates> {
  GetNoteDataCubit() : super(GetNoteInitialState());

  ///
  Future getNotesData() async {
    emit(GetNoteLoadingState());
    try {
      // get
      final getData = await FirebaseFirestore.instance.collection("note").get();
      print(getData);
      //save in model => convert to list
      final noteList =
          getData.docs.map((doc) => NoteModel.fromJson(doc.data())).toList();
      emit(GetNoteSuccessState(notes: noteList));
    } catch (e) {
      emit(GetNoteErrorState(e.toString()));
    }
  }
}
