part of fk_logs;

class Log {
  static Loggy _logger = Loggy('FKLog');

  static void init({LogLevel level = LogLevel.all}) {
    Loggy.initLoggy(
      logPrinter: StreamPrinter(
        PrettyDeveloperPrinter(),
      ),
      logOptions: LogOptions(
        level,
        stackTraceLevel: LogLevel.error,
      ),
    );
  }

  static void d(String msg, {dynamic error, StackTrace? stackTrace}) {
    _logger.debug(msg, error, stackTrace);
  }

  static void i(String msg, {dynamic error, StackTrace? stackTrace}) {
    _logger.info(msg, error, stackTrace);
  }

  static void w(String msg, {dynamic error, StackTrace? stackTrace}) {
    _logger.warning(msg, error, stackTrace);
  }

  static void e(String msg, {dynamic error, StackTrace? stackTrace}) {
    _logger.error(msg, error, stackTrace);
  }
}
