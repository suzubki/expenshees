import 'package:logger/logger.dart';

var regisLogger = Logger(
  filter: null,
  output: null,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
