import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {}

class Waiting extends LoadingState {
  @override
  List<Object?> get props => [];
}

class Finished extends LoadingState {
  @override
  List<Object?> get props => [];
}
