import 'package:logger/logger.dart';

extension LoggerExtension on String {
  void log({String? title}) {
    var logger = Logger(
        filter: null,
        printer: PrettyPrinter(
            methodCount: 0,
            colors: true,
            printEmojis: true,
            printTime: true,
            errorMethodCount: 0),
        level: Level.debug);
    logger.d("-----${title ?? ""}----->   ${this}");
  }
}
