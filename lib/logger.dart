import 'package:logger/logger.dart';

final Logger log = _getLogger();

Logger _getLogger() {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );
}
