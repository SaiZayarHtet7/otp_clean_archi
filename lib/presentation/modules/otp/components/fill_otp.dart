import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:otp_clean_archi/presentation/custom/custom.dart';
import 'package:otp_clean_archi/presentation/custom/snackbar/bloc/snackbar_bloc.dart';
import 'package:otp_clean_archi/presentation/modules/otp/cubit/otp_check_cubit.dart';

import '../../../../core/core.dart';

class FillOTP extends StatefulWidget {
  final String otpFromServer;
  const FillOTP({
    super.key,
    required this.otpFromServer,
  });

  @override
  State<FillOTP> createState() => _FillOTPState();
}

class _FillOTPState extends State<FillOTP> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpCheckCubit>(
      create: (context) => OtpCheckCubit(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: Container(
          padding: EdgeInsets.all(Constants.padding),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Constants.borderRadius),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  StringUtils.fillOTP,
                  style: FontUtils.titleText,
                ),
                5.height,
                MyText(StringUtils.fillWithin1Min),
                10.height,

                ///otp field
                SizedBox(
                  height: 50,
                  child: BlocBuilder<OtpCheckCubit, String>(
                    builder: (context, otpAdd) {
                      return MyOTPField(
                        color: otpAdd.length < 6
                            ? ColorUtils.primaryColor
                            : otpAdd == widget.otpFromServer
                                ? ColorUtils.successColor
                                : ColorUtils.errorColor,
                        numberOfFields: 6,
                        onCompleted: (String value) {
                          context.read<OtpCheckCubit>().checkOTP(otpAdd: value);
                        },
                      );
                    },
                  ),
                ),
                20.height,
                BlocBuilder<OtpCheckCubit, String>(
                  builder: (context, otpAdd) {
                    return MyButton(
                      onPressed: () {
                        if (otpAdd == widget.otpFromServer) {
                          context.back();
                          context.read<SnackbarBloc>().add(
                              const ShowSnackbar("Message", "Correct OTP!"));
                        } else {
                          context.read<SnackbarBloc>().add(
                              const ShowSnackbar("Message", "Oops.Wrong OTP!"));
                        }
                      },
                      text: StringUtils.confirm,
                      width: double.infinity,
                    );
                  },
                )
              ],
            ),
          ),
        ).bottomCenter,
      ),
    );
  }
}
