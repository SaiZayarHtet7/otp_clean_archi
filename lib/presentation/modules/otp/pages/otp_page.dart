import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:otp_clean_archi/presentation/custom/snackbar/bloc/snackbar_bloc.dart';
import '../components/components.dart';

import '../../../../core/core.dart';
import '../../../custom/custom.dart';
import '../bloc/otp_bloc.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpLoading) {
            context.showMyDialog(child: const LoadingWidget());
          }

          if (state is OtpSuccess) {
            context.back();
            context.showMyBottomSheet(
                child: FillOTP(
              otpFromServer: state.otp,
            ));
            context
                .read<SnackbarBloc>()
                .add(ShowSnackbar("Message", state.otp));
          }

          if (state is OtpError) {
            context.back();
            context.showSnackBar(state.error, "Error",
                type: SnackbarType.error);
          }
        },
        child: Center(
          child: Builder(builder: (context) {
            return MyButton(
              onPressed: () {
                context.read<OtpBloc>().add(GetOTP());
              },
              text: StringUtils.requestOTP,
            );
          }),
        ),
      ),
    );
  }
}
