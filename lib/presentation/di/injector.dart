import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_clean_archi/presentation/custom/snackbar/bloc/snackbar_bloc.dart';
import '';
import 'package:otp_clean_archi/presentation/modules/otp/bloc/otp_bloc.dart';

import '../../data/data.dart';

class Injector extends StatelessWidget {
  final Widget child;

  const Injector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => OtpBloc(IOtpRepo()),
      ),
      BlocProvider(
        create: (context) => SnackbarBloc(),
      ),
    ], child: child);
  }
}
