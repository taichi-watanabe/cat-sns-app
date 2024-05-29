import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = Logger('RimawarikunApp');

void setupLogging() {
  if (kReleaseMode) {
    Logger.root.level = Level.OFF;
  } else {
    hierarchicalLoggingEnabled = true;
    logger.onRecord.listen((record) {
      var message = '${record.time} [${record.level.name}]:  ${record.message}';
      if (record.error != null) {
        message += '\nError: ${record.error}';
      }
      if (record.stackTrace != null) {
        message += '\nStack Trace: ${record.stackTrace}';
      }
      debugPrint(message);
    });
  }
}
