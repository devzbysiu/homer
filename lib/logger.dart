import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: false 
    ),
  );
}