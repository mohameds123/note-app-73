import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutteronline73/data/note_model.dart';
import 'package:noteappflutteronline73/logic/create_note/state.dart';

class CreateNoteCubit extends Cubit<CreateNoteStates> {
  CreateNoteCubit() : super(CreateNoteInitialState());

  /// Set Note Data
  Future createNoteData(NoteModel note) async {
    emit(CreateNoteLoadingState());
    try {
      await FirebaseFirestore.instance.collection("note").add(note.toJson());
      emit(CreateNoteSuccessState());
    } catch (e) {
      emit(CreateNoteErrorState(e.toString()));
    }
  }
}
