part of 'picture_bloc.dart';

abstract class PictureEvent extends Equatable {
  const PictureEvent();

  @override
  List<Object> get props => [];
}

class CambiarFotoEvent extends PictureEvent {}
