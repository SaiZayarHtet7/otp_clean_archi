import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snackbar_event.dart';
part 'snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(SnackbarInitial()) {
    on<ShowSnackbar>((event, emit) async {
      emit(SnackbarShow(event.title, event.body));
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => emit(SnackbarHide()));
    });
  }
}
