part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String otp;

  const OtpSuccess(this.otp);
}

class OtpError extends OtpState {
  final String error;

  const OtpError(this.error);
}
