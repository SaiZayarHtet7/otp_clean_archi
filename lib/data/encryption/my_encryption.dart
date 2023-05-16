import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:otp_clean_archi/core/core.dart';

class MyEncryption {
  Future<String> encrypt(String code) async {
    final key = Key.fromUtf8(Constants.secretKey);
    final plainText = Encrypter(AES(key, mode: AESMode.ecb));
    final iv = IV.fromLength(16);
    final encrypted = plainText.encrypt(code, iv: iv);

    return base64.encode(encrypted.bytes);
  }

  Future<String> decrypt(String encrypted) async {
    final key = Key.fromUtf8(Constants.secretKey);
    final encryptedData = Encrypted.fromBase64(encrypted);
    final iv = IV.fromLength(16);
    final cipher = Encrypter(AES(key, mode: AESMode.ecb));
    final decrypted = cipher.decrypt(encryptedData, iv: iv);

    return decrypted;
  }
}
