import 'package:flutter_bloc/flutter_bloc.dart';
part 'client_state.dart';

class ClientCubit extends Cubit<clientState> {
  ClientCubit(super.initialState);

  changeLanguage({required String language }){

    final newState = clientState(
      language: language, 
      darkMode: state.darkMode,
    );

  emit(newState);

  }

  changeDarkMode({required bool darkMode}){

    final newState = clientState(
      language:state.language,  
      darkMode:darkMode,  
    );


    emit(newState);

  }



}




