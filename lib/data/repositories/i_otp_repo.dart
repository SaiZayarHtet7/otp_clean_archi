import 'dart:io';

import 'package:dio/dio.dart';
import 'package:otp_clean_archi/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:otp_clean_archi/data/data.dart';
import 'package:otp_clean_archi/domain/domain.dart';

class IOtpRepo implements OTPRepo {
  @override
  Future<Either<Failure, String>> getOTP() async {
    //return left for error state
    //return right for data success state
    try {
      final data = await Api().myDio.get(MethodUtils.getOTP);

      if (data.statusCode == 200) {
        //decryption of data
        String encryptedOTP = data.data["code"];

        MyEncryption myEncryption = MyEncryption();
        String decryptOtp = await myEncryption.decrypt(encryptedOTP);

        decryptOtp.log(title: "Decrypted otp code ");
        return Right(decryptOtp);
      } else {
        return Left(ServerFailure());
      }
    } on SocketException {
      return Left(ServerFailure());
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        return Left(ConnectionFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }
}
