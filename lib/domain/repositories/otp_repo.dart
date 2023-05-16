import 'package:dartz/dartz.dart';
import 'package:otp_clean_archi/core/core.dart';

abstract class OTPRepo {
 Future< Either<Failure, String>> getOTP();
}
