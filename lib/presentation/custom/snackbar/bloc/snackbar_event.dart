part of 'snackbar_bloc.dart';

abstract class SnackbarEvent extends Equatable {
  const SnackbarEvent();

  @override
  List<Object> get props => [];
}

class ShowSnackbar extends SnackbarEvent {
  final String title, body;

  const ShowSnackbar(this.title, this.body);
}
