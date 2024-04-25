import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {
  const CubitStates();
}



class InitialState extends CubitStates {



  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {

  const LoadedState(this.places);
  final List<DataModel> places;

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {

  const DetailState(this.place);
  final DataModel place;

  @override
  List<Object> get props => [place];
}