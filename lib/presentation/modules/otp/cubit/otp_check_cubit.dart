import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_clean_archi/core/core.dart';

class OtpCheckCubit extends Cubit<String> {
  OtpCheckCubit() : super("");

  checkOTP({required String otpAdd}) {
    otpAdd.log();
    emit(otpAdd);
  }
}
