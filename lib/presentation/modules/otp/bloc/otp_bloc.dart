import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otp_clean_archi/core/core.dart';
import 'package:otp_clean_archi/data/repositories/i_otp_repo.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final IOtpRepo otpRepo;
  OtpBloc(this.otpRepo) : super(OtpInitial()) {
    on<GetOTP>((event, emit) async {
      emit(OtpLoading());
      final data = await otpRepo.getOTP();
      data.fold((error) {
        //error state
        if (error is ServerFailure) {
          emit(OtpError(StringUtils.serverFail));
        } else if (error is ConnectionFailure) {
          emit(OtpError(StringUtils.poorConnection));
        } else {
          emit(OtpError(StringUtils.somethingWentWrong));
        }
      }, (otp) async {
        //success state 
        emit(OtpSuccess(otp));
      });
    });
  }
}
