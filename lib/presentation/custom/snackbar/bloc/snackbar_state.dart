part of 'snackbar_bloc.dart';

abstract class SnackbarState extends Equatable {
  const SnackbarState();

  @override
  List<Object> get props => [];
}

class SnackbarInitial extends SnackbarState {}

class SnackbarShow extends SnackbarState {
  final String title, body;

  const SnackbarShow(this.title, this.body);
}

class SnackbarHide extends SnackbarState {}
